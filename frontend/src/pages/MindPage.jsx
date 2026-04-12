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

// Cryptography
import { useFHE } from '../hooks/useFHE';
import { useWallet } from '../context/WalletContext';
import { useCipherLifeContract } from '../hooks/useCipherLifeContract';
import { useDemo } from '../context/DemoContext';
import { executeUnifiedSubmission } from '../utils/submission';
import { useOpenAIAdvisor } from '../hooks/useOpenAIAdvisor';
import AIInsightCard from '../components/AIInsightCard';

const MindPage = () => {
  const [mounted, setMounted] = useState(false);
  const { encryptModule, decryptResult } = useFHE();
  const { account } = useWallet();
  const { submitMind } = useCipherLifeContract();
  const { isDemoMode, getDemoData } = useDemo();
  const { getInsights, isLoading: aiLoading, insights, error: aiError } = useOpenAIAdvisor();

  // Form State
  const [mood, setMood] = useState(5);
  const [sleep, setSleep] = useState(7);
  const [stress, setStress] = useState(40);
  const [social, setSocial] = useState('moderate');
  
  // Submission State
  const [step, setStep] = useState(0); 
  const [resultScore, setResultScore] = useState(null);

  useEffect(() => {
    setMounted(true);
  }, []);

  const handleAnalyze = async () => {
    setStep(1);
    try {
      const inputs = isDemoMode 
        ? Object.values(getDemoData('mind'))
        : [mood, sleep, stress, social === 'high' ? 3 : social === 'moderate' ? 2 : 1];

      await executeUnifiedSubmission({
        moduleName: 'Mind',
        rawData: inputs,
        encryptFn: encryptModule,
        decryptFn: decryptResult,
        contractFn: submitMind,
        apiEndpoint: '/analyze/mind',
        walletAccount: account,
        onComplete: (score) => {
          setResultScore(score);
          setStep(4);
          getInsights('mind', score, stress > 60 ? 'High' : 'Normal');
        }
      });
    } catch (error) {
      setStep(0);
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
                    <span className="text-cipher-secondary text-lg font-black">{mood}</span>
                    <span>HIGH</span>
                  </div>
                  <input 
                    type="range" min="1" max="10" value={mood} 
                    onChange={(e) => setMood(parseInt(e.target.value))}
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
                    <span className="text-cipher-secondary text-lg font-black">{sleep}H</span>
                    <span>12H</span>
                  </div>
                  <input 
                    type="range" min="4" max="12" value={sleep} 
                    onChange={(e) => setSleep(parseInt(e.target.value))}
                    className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-cipher-secondary"
                  />
                </div>
              </div>

              {/* Stress Vertical Slider */}
              <div className="flex flex-col items-center gap-4 bg-white/5 p-6 rounded-2xl border border-white/5">
                <label className="text-[10px] font-bold text-slate-500 uppercase tracking-[0.2em] mb-4">Stress Gauge</label>
                <div className="flex flex-col items-center gap-3">
                  <span style={{ fontSize: '12px', color: '#FF3366', fontWeight: 'bold' }}>HIGH</span>
                  <input 
                    type="range"
                    min="0" max="100"
                    value={stress}
                    onChange={e => setStress(parseInt(e.target.value))}
                    style={{
                      writingMode: 'vertical-lr',
                      direction: 'rtl',
                      height: '140px',
                      width: '8px',
                      accentColor: stress > 60 ? '#FF3366' : stress > 30 ? '#FFB800' : '#00FF88'
                    }}
                    className="cursor-pointer"
                  />
                  <span style={{ fontSize: '12px', color: '#00FF88', fontWeight: 'bold' }}>LOW</span>
                  <div style={{ 
                    fontSize: '24px', 
                    fontWeight: '800',
                    color: stress > 60 ? '#FF3366' : stress > 30 ? '#FFB800' : '#00FF88',
                    marginTop: '8px'
                  }}>
                    {stress}
                  </div>
                </div>
              </div>
            </div>

            <button
              onClick={handleAnalyze}
              disabled={step > 0}
              style={{
                background: step > 0 ? 'rgba(255,255,255,0.05)' : 'linear-gradient(135deg, #7B2FFF, #5B1FBF)',
                color: 'white',
                fontWeight: '700',
                border: 'none',
                borderRadius: '12px',
                padding: '14px 24px',
                fontSize: '15px',
                cursor: step > 0 ? 'not-allowed' : 'pointer',
                width: '100%',
                marginTop: '32px',
                transition: 'opacity 0.2s, transform 0.1s'
              }}
              className="hover:opacity-90 active:scale-[0.98]"
            >
              Encrypt & Check In
            </button>
          </GlassCard>
        </div>

        {/* Data Preview */}
        <div className="space-y-6">
          <GlassCard className="p-6 h-full min-h-[400px]">
            {step === 0 && (
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
                    <div style={{ color: '#FF6B6B' }}>mood: {mood} <span className="text-slate-700 ml-4">← sensitive data</span></div>
                    <div style={{ color: '#FF6B6B' }}>sleep: {sleep}h</div>
                    <div style={{ color: '#FF6B6B' }}>stress: {stress}</div>
                    
                    <div style={{ color: '#475569', fontStyle: 'italic', marginTop: '20px', borderTop: '1px solid #ffffff10', paddingTop: '10px' }}>
                      Ready for homomorphic conversion...
                    </div>
                  </div>
                </div>
              </div>
            )}

            {step > 0 && step < 4 && (
              <div className="h-full flex flex-col justify-center items-center text-center py-20">
                 <div className="w-16 h-16 rounded-full border-4 border-cipher-secondary/20 border-t-cipher-secondary animate-spin mb-6" />
                 <h4 className="text-xl font-bold mb-2">Blinding Active</h4>
                 <p className="text-slate-500 text-sm max-w-xs">Your data is being mathematically isolated from all systemic observers.</p>
              </div>
            )}

            {step === 4 && (
              <motion.div 
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                className="flex flex-col items-center justify-center h-full gap-8 py-6"
              >
                <div className="text-center">
                   <WellnessRing score={resultScore} size={150} color="#7B2FFF" />
                   <div className="mt-4 text-2xl font-black text-cipher-secondary">MIND SCORE: {resultScore}</div>
                </div>
                <AIInsightCard 
                  module="mind"
                  score={resultScore}
                  insights={insights.mind}
                  isLoading={aiLoading}
                  error={aiError}
                  onRefresh={() => getInsights('mind', resultScore, stress > 60 ? 'High' : 'Normal')}
                />
              </motion.div>
            )}
          </GlassCard>
        </div>
      </div>
    </div>
  );
};

export default MindPage;
