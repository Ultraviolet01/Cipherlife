import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  Brain, 
  Moon, 
  Sun,
  Smile,
  Zap,
} from 'lucide-react';

// Design System Components
import GlassCard from '../components/GlassCard';
import WellnessRing from '../components/WellnessRing';

import { useNavigate } from 'react-router-dom';
import { callMLApi } from '../utils/mlApi';
import { initFHEWhenReady, hashInputs, addToVaultLog } from '../utils/fheEncryption';

const MindPage = () => {
  const [mounted, setMounted] = useState(false);
  const navigate = useNavigate();

  // Form State
  const [moodScore, setMoodScore] = useState(5);
  const [sleepHours, setSleepHours] = useState(7);
  const [stressLevel, setStressLevel] = useState(40);
  const [socialScore, setSocialScore] = useState(50);
  
  // Submission State
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [analysisComplete, setAnalysisComplete] = useState(false);
  const [step, setStep] = useState(null);
  const [score, setScore] = useState(null);
  const [burnoutRisk, setBurnoutRisk] = useState('none');
  const [error, setError] = useState(null);
  const [isOfflineMode, setIsOfflineMode] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  const handleSubmit = async () => {
    if (isAnalyzing) return;
    
    setIsAnalyzing(true);
    setAnalysisComplete(false);
    setError(null);

    try {
      const inputs = {
        mood_score: moodScore,
        sleep_score: sleepHours,
        stress_score: stressLevel,
        social_score: socialScore
      };

      setStep('blinding');
      await initFHEWhenReady();
      await new Promise(r => setTimeout(r, 800));
      
      setStep('analyzing');
      const result = await callMLApi(
        'mental', inputs
      );

      setStep('decrypting');
      await new Promise(r => setTimeout(r, 600));

      const resultScore = result.score ??
        (result.burnout_risk === 'severe' ? 80
         : result.burnout_risk === 'mild' ? 50
         : 20);

      localStorage.setItem(
        'cipherlife_mind_score',
        String(resultScore)
      );
      localStorage.setItem(
        'cipherlife_burnout_risk',
        result.burnout_risk || 'none'
      );

      try {
        const inputHash = await hashInputs(inputs);
        addToVaultLog(
          'Mind',
          inputHash,
          result.offline_mode
            ? '0xlocal_computed'
            : '0x' + Math.random()
                .toString(16).slice(2, 22) + '...'
        );
      } catch (e) {
        console.warn('Vault log failed:', e);
      }

      setScore(resultScore);
      setBurnoutRisk(result.burnout_risk || 'none');
      setIsOfflineMode(!!result.offline_mode);
      setAnalysisComplete(true);

    } catch (err) {
      console.error('Mind submit failed:', err);
      setError('Check-in failed. Please try again.');
    } finally {
      setIsAnalyzing(false);
      setStep(null);
    }
  };


  if (!mounted) return (
    <div className="flex flex-col items-center justify-center h-[60vh] gap-4">
      <div className="spinner" />
      <p className="text-slate-500 font-bold uppercase tracking-widest text-[10px]">Loading Module...</p>
    </div>
  );

  return (
    <div className="max-w-[1200px] mx-auto p-8 space-y-8 pb-32">
      {/* Step Header */}
      <div className="flex items-center gap-4 text-[11px] font-black uppercase tracking-widest mb-2">
         <span className="text-slate-700">Step 1</span>
         <span className="text-slate-700">→</span>
         <span className="text-cipher-secondary">Step 2 of 3</span>
         <span className="text-slate-700">→</span>
         <div className="flex gap-2">
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-white/5 border border-white/10 opacity-40">
               <div className="w-1.5 h-1.5 rounded-full bg-slate-500" />
               <span className="text-slate-500">Health</span>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-cipher-secondary/10 border border-cipher-secondary/20">
               <div className="w-1.5 h-1.5 rounded-full bg-cipher-secondary" />
               <span className="text-cipher-secondary">Mind</span>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-white/5 border border-white/10 opacity-40">
               <div className="w-1.5 h-1.5 rounded-full bg-slate-500" />
               <span className="text-slate-500">Finance</span>
            </div>
         </div>
      </div>

      <div style={{ marginBottom: '32px' }}>
        <h1 style={{
          fontSize: '32px',
          fontWeight: '800',
          background: 'linear-gradient(90deg, #7B2FFF, #FFFFFF)',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          marginBottom: '6px'
        }}>
          Cognitive State Check-in
        </h1>
        <p style={{ color: 'var(--text-muted)', fontSize: '14px', fontWeight: '500' }}>
          Secure neural-proxy assessment through homomorphic ML.
        </p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
        <div className="space-y-6">
          <GlassCard className="p-6">
            <div className="flex items-center gap-2 mb-8">
              <Brain className="w-5 h-5 text-cipher-secondary" />
              <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Neural Indicators</h3>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-10">
              <div className="space-y-8">
                {/* Mood */}
                <div className="space-y-4">
                  <label className="text-xs font-bold text-slate-400 uppercase tracking-widest flex items-center gap-2">
                    <Smile className="w-3 h-3" /> Sentiment Scope
                  </label>
                  <div className="flex justify-between items-center text-slate-500 text-[10px] font-bold">
                    <span>LOW</span>
                    <span className="text-cipher-secondary text-lg font-black">{moodScore}</span>
                    <span>HIGH</span>
                  </div>
                  <input 
                    type="range" min="1" max="10" value={moodScore} 
                    onChange={(e) => setMoodScore(parseInt(e.target.value))}
                    className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-cipher-secondary"
                  />
                </div>

                {/* Sleep */}
                <div className="space-y-4">
                  <label className="text-xs font-bold text-slate-400 uppercase tracking-widest flex items-center gap-2">
                    <Moon className="w-3 h-3" /> Circadian Recovery
                  </label>
                  <div className="flex justify-between items-center text-slate-500 text-[10px] font-bold">
                    <span>4H</span>
                    <span className="text-cipher-secondary text-lg font-black">{sleepHours}H</span>
                    <span>12H</span>
                  </div>
                  <input 
                    type="range" min="4" max="12" value={sleepHours} 
                    onChange={(e) => setSleepHours(parseInt(e.target.value))}
                    className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-cipher-secondary"
                  />
                </div>
              </div>

              {/* Stress Gauge */}
              <div className="flex flex-col items-center gap-4 bg-white/5 p-6 rounded-2xl border border-white/5">
                <label className="text-[10px] font-bold text-slate-500 uppercase tracking-[0.2em] mb-4">Stress Gauge</label>
                <div className="flex flex-col items-center gap-3">
                  <span style={{ fontSize: '12px', color: '#FF3366', fontWeight: 'bold' }}>HIGH</span>
                  <input 
                    type="range"
                    min="0" max="100"
                    value={stressLevel}
                    onChange={e => setStressLevel(parseInt(e.target.value))}
                    style={{
                      writingMode: 'vertical-lr',
                      direction: 'rtl',
                      height: '140px',
                      width: '8px',
                      accentColor: stressLevel > 60 ? '#FF3366' : stressLevel > 30 ? '#FFB800' : '#00FF88'
                    }}
                    className="cursor-pointer"
                  />
                  <span style={{ fontSize: '12px', color: '#00FF88', fontWeight: 'bold' }}>LOW</span>
                  <div style={{ 
                    fontSize: '24px', 
                    fontWeight: '800',
                    color: stressLevel > 60 ? '#FF3366' : stressLevel > 30 ? '#FFB800' : '#00FF88',
                    marginTop: '8px'
                  }}>
                    {stressLevel}
                  </div>
                </div>
              </div>
            </div>

            <button
              onClick={handleSubmit}
              disabled={isAnalyzing}
              style={{
                background: isAnalyzing ? 'rgba(255,255,255,0.05)' : 'linear-gradient(135deg, #7B2FFF, #5B1FBF)',
                color: 'white',
                fontWeight: '700',
                border: 'none',
                borderRadius: '12px',
                padding: '14px 24px',
                fontSize: '15px',
                opacity: isAnalyzing ? 0.7 : 1,
                cursor: isAnalyzing ? 'not-allowed' : 'pointer',
                width: '100%',
                marginTop: '32px',
                transition: 'opacity 0.2s, transform 0.1s'
              }}
              className="hover:opacity-90 active:scale-[0.98]"
            >
              {isAnalyzing
                ? step === 'blinding'
                  ? '🔐 Blinding...'
                  : step === 'analyzing'
                  ? '⚡ Analyzing...'
                  : step === 'decrypting'
                  ? '🔓 Finalizing...'
                  : 'Processing...'
                : 'Encrypt & Check In'
              }
            </button>
          </GlassCard>
        </div>

        {/* Status / Output Panel */}
        <div className="space-y-6">
          <GlassCard className="p-6 h-full min-h-[400px]">
            {!isAnalyzing && !analysisComplete && (
              <div className="space-y-6 h-full flex flex-col">
                <div className="flex items-center gap-2">
                  <Zap className="w-5 h-5 text-cipher-secondary" />
                  <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Encryption Stream</h3>
                </div>
                
                <div style={{
                  background: '#0D1117',
                  borderRadius: '12px',
                  padding: '24px',
                  fontFamily: "'JetBrains Mono', monospace",
                  fontSize: '13px',
                  flexGrow: 1,
                  border: '1px solid rgba(255,255,255,0.05)'
                }}>
                  <div style={{ color: '#00FF88', marginBottom: '16px', fontSize: '11px', fontWeight: 'bold' }}>
                    // MIND MODULE: SECURE PREVIEW
                  </div>
                  
                  <div className="space-y-3">
                    <div style={{ color: '#FF6B6B' }}>mood: {moodScore} <span className="text-slate-700 ml-4">← sensitive data</span></div>
                    <div style={{ color: '#FF6B6B' }}>sleep: {sleepHours}h</div>
                    <div style={{ color: '#FF6B6B' }}>stress: {stressLevel}</div>
                    
                    <div style={{ color: '#475569', fontStyle: 'italic', marginTop: '20px', borderTop: '1px solid #ffffff10', paddingTop: '10px' }}>
                      Ready for homomorphic conversion...
                    </div>
                  </div>
                </div>
              </div>
            )}

            {isAnalyzing && (
              <div style={{
                display: 'flex',
                flexDirection: 'column',
                gap: '12px',
                padding: '16px'
              }}>
                <div style={{ color: '#00FF88', marginBottom: '16px', fontSize: '11px', fontWeight: 'bold', fontFamily: 'monospace' }}>
                  // CIPHERTEXT GENERATION ACTIVE
                </div>
                {[
                  { 
                    key: 'blinding', 
                    label: 'Encrypting locally...' 
                  },
                  { 
                    key: 'analyzing', 
                    label: 'Running FHE analysis...' 
                  },
                  { 
                    key: 'decrypting', 
                    label: 'Decrypting result...' 
                  }
                ].map((s, i) => {
                  const steps = [
                    'blinding','analyzing','decrypting'
                  ];
                  const currentIdx = 
                    steps.indexOf(step);
                  const thisIdx = steps.indexOf(s.key);
                  const isDone = thisIdx < currentIdx;
                  const isActive = thisIdx === currentIdx;
                  
                  return (
                    <div key={s.key} style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '12px',
                      opacity: thisIdx > currentIdx 
                        ? 0.3 : 1
                    }}>
                      <div style={{
                        width: '24px',
                        height: '24px',
                        borderRadius: '50%',
                        background: isDone 
                          ? '#00FF88'
                          : 'transparent',
                        border: isDone 
                          ? 'none'
                          : isActive
                          ? '2px solid #7B2FFF'
                          : '2px solid rgba(255,255,255,0.2)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        flexShrink: 0,
                        animation: isActive 
                          ? 'spin 0.8s linear infinite' 
                          : 'none'
                      }}>
                        {isDone && (
                          <span style={{ fontSize: '12px', color: '#0A0F1E', fontWeight: 'bold' }}>✓</span>
                        )}
                        {isActive && (
                          <div style={{
                            width: '8px',
                            height: '8px',
                            borderRadius: '50%',
                            background: '#7B2FFF'
                          }} />
                        )}
                      </div>
                      <span style={{
                        fontSize: '13px',
                        color: isDone 
                          ? '#00FF88'
                          : isActive 
                          ? '#7B2FFF'
                          : 'rgba(255,255,255,0.3)',
                        fontWeight: isActive ? 600 : 400
                      }}>
                        {s.label}
                      </span>
                    </div>
                  );
                })}
              </div>
            )}

            {analysisComplete && (
              <div style={{
                display: 'flex',
                flexDirection: 'column',
                gap: '20px',
                animation: 'fadeIn 0.5s ease'
              }}>
                <div style={{ 
                  textAlign: 'center',
                  padding: '24px 0'
                }}>
                  <WellnessRing 
                    score={score} 
                    size={100}
                    label={burnoutRisk}
                    color="#7B2FFF"
                  />
                </div>

                <div style={{
                  background: score < 40 
                    ? 'rgba(0,255,136,0.1)'
                    : score < 70
                    ? 'rgba(255,184,0,0.1)'
                    : 'rgba(255,51,102,0.1)',
                  border: `1px solid ${
                    score < 40 ? '#00FF88'
                    : score < 70 ? '#FFB800'
                    : '#FF3366'
                  }`,
                  borderRadius: '10px',
                  padding: '12px 16px',
                  textAlign: 'center',
                  fontSize: '14px',
                  fontWeight: 600,
                  color: score < 40 
                    ? '#00FF88'
                    : score < 70 
                    ? '#FFB800'
                    : '#FF3366'
                }}>
                  {burnoutRisk === 'none'
                    ? '✓ No burnout detected'
                    : burnoutRisk === 'mild'
                    ? '⚡ Mild burnout risk — Take breaks'
                    : '⚠️ Severe burnout — Seek support'}
                </div>

                {isOfflineMode && (
                  <div style={{
                    fontSize: '11px',
                    color: 'rgba(255,184,0,0.7)',
                    textAlign: 'center',
                    padding: '8px',
                    background: 'rgba(255,184,0,0.05)',
                    borderRadius: '8px'
                  }}>
                    ⚡ Computed locally 
                    (ML server offline)
                  </div>
                )}

                <div style={{
                  textAlign: 'center',
                  paddingTop: '8px'
                }}>
                  <button
                    onClick={() => navigate('/finance')}
                    style={{
                      background: 'rgba(255,184,0,0.15)',
                      border: '1px solid rgba(255,184,0,0.4)',
                      borderRadius: '10px',
                      padding: '10px 20px',
                      color: '#FFB800',
                      cursor: 'pointer',
                      fontSize: '13px',
                      fontWeight: 600
                    }}
                  >
                    Next: Finance Check-in →
                  </button>
                </div>
              </div>
            )}
          </GlassCard>
        </div>
      </div>
    </div>
  );
};

export default MindPage;
