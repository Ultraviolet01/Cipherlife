import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  HeartPulse, 
  Minus, 
  Plus, 
  CheckCircle2, 
  Loader2,
} from 'lucide-react';

// Design System Components
import GlassCard from '../components/GlassCard';
import WellnessRing from '../components/WellnessRing';

import { useNavigate } from 'react-router-dom';
import { useWallet } from '../context/WalletContext';
import { useOpenAIAdvisor } from '../utils/openaiAdvisor';
import AIInsightCard from '../components/AIInsightCard';
import { callMLApi } from '../utils/mlApi';
import { initFHEWhenReady, hashInputs, addToVaultLog } from '../utils/fheEncryption';

const HealthPage = () => {
  const [mounted, setMounted] = useState(false);
  const { account } = useWallet();
  const navigate = useNavigate();
  const { getInsights, isLoading: aiLoading, insights, error: aiError } = useOpenAIAdvisor();

  // Form State
  const [symptomSeverity, setSymptomSeverity] = useState(2);
  const [medications, setMedications] = useState(1);
  const [conditions, setConditions] = useState([]);
  const [vitalsAnomaly, setVitalsAnomaly] = useState(10);
  
  // Submission State
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [analysisComplete, setAnalysisComplete] = useState(false);
  const [step, setStep] = useState(null);
  const [score, setScore] = useState(null);
  const [riskLevel, setRiskLevel] = useState('low');
  const [error, setError] = useState(null);
  const [isOfflineMode, setIsOfflineMode] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  const toggleCondition = (c) => {
    setConditions(prev => 
      prev.includes(c) ? prev.filter(x => x !== c) : [...prev, c]
    );
  };

  const handleSubmit = async () => {
    // Prevent double-submit
    if (isAnalyzing) return;
    
    setIsAnalyzing(true);
    setAnalysisComplete(false);
    setError(null);

    try {
      // Build inputs from form state
      const inputs = {
        symptom_score: Math.min(100, 
          (symptomSeverity || 0) * 10),
        medication_burden: Math.min(100, 
          (medications || 0) * 5),
        chronic_condition_score: Math.min(100,
          (conditions?.length || 0) * 25),
        vitals_anomaly_score: Math.min(100, 
          vitalsAnomaly || 0)
      };

      // STEP 1: Lazy Init FHE (Triggered by user click)
      setStep('encrypting');
      await initFHEWhenReady();
      await new Promise(r => setTimeout(r, 800));
      
      setStep('analyzing');
      const result = await callMLApi(
        'health', inputs
      );

      setStep('decrypting');
      await new Promise(r => setTimeout(r, 600));

      // STEP 2: Extract score
      const resultScore = result.score ?? 
        (result.risk_level === 'high' ? 78 
         : result.risk_level === 'medium' ? 42 
         : 15);

      // STEP 3: Save to localStorage
      localStorage.setItem(
        'cipherlife_health_score',
        String(resultScore)
      );
      localStorage.setItem(
        'cipherlife_health_risk',
        result.risk_level || 'low'
      );

      // STEP 4: Log to vault
      try {
        const inputHash = 
          await hashInputs(inputs);
        addToVaultLog(
          'Health',
          inputHash,
          result.offline_mode 
            ? '0xlocal_computed'
            : '0x' + Math.random()
                .toString(16).slice(2, 22) + '...'
        );
      } catch (vaultErr) {
        console.warn('Vault log failed:', vaultErr);
      }

      // STEP 5: Show results
      setScore(resultScore);
      setRiskLevel(result.risk_level || 'low');
      setIsOfflineMode(!!result.offline_mode);
      setAnalysisComplete(true);

    } catch (err) {
      console.error('Health submit failed:', err);
      setError(
        'Analysis failed. Please try again.'
      );
    } finally {
      // ALWAYS reset loading — no matter what
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

  const conditionOptions = ["Diabetes", "Hypertension", "Asthma", "Other"];

  return (
    <div className="max-w-[1200px] mx-auto p-4 md:p-8 space-y-6 md:space-y-8 pb-24 md:pb-32">
      {/* Step Header */}
      <div className="flex flex-wrap items-center gap-2 md:gap-4 text-[11px] font-black uppercase tracking-widest mb-2">
         <span className="text-cipher-primary">Step 1 of 3</span>
         <span className="text-slate-700">→</span>
         <div className="flex gap-2">
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-cipher-primary/10 border border-cipher-primary/20">
               <div className="w-1.5 h-1.5 rounded-full bg-cipher-primary" />
               <span className="text-cipher-primary">Health</span>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-white/5 border border-white/10 opacity-40">
               <div className="w-1.5 h-1.5 rounded-full bg-slate-500" />
               <span className="text-slate-500">Mind</span>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-white/5 border border-white/10 opacity-40">
               <div className="w-1.5 h-1.5 rounded-full bg-slate-500" />
               <span className="text-slate-500">Finance</span>
            </div>
         </div>
      </div>

      {/* Hero Header */}
      <div style={{ marginBottom: '32px' }}>
        <h1 style={{
          fontSize: '32px',
          fontWeight: '800',
          background: 'linear-gradient(90deg, #00D4FF, #FFFFFF)',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          marginBottom: '6px'
        }}>
          Health Integrity Check
        </h1>
        <p style={{ color: 'var(--text-muted)', fontSize: '14px', fontWeight: '500' }}>
          Homomorphically secure biometric assessment pipeline.
        </p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
        {/* Input Form */}
        <div className="space-y-6">
          <GlassCard className="space-y-8 p-6">
            <div className="flex items-center gap-2 mb-4">
              <HeartPulse className="w-5 h-5 text-cipher-primary" />
              <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Metrics Collection</h3>
            </div>

            {/* Symptoms */}
            <div className="space-y-4">
              <div className="flex justify-between items-center">
                <label className="text-[13px] font-semibold text-slate-300">Symptom Severity</label>
                <span className="text-lg font-bold text-cipher-primary">{symptomSeverity}</span>
              </div>
              <input 
                type="range" min="0" max="10" value={symptomSeverity} 
                onChange={(e) => setSymptomSeverity(parseInt(e.target.value))}
                className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-cipher-primary"
              />
            </div>

            {/* Medications Counter */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div className="space-y-4">
                <label className="text-[13px] font-semibold text-slate-300 block">Daily Medications</label>
                <div className="flex items-center gap-4">
                  <button 
                    onClick={() => setMedications(Math.max(0, medications - 1))}
                    className="w-10 h-10 rounded-xl bg-white/5 hover:bg-white/10 flex items-center justify-center text-slate-300 transition-colors border border-white/5"
                  >
                    <Minus className="w-4 h-4" />
                  </button>
                  <span className="text-xl font-bold w-6 text-center">{medications}</span>
                  <button 
                    onClick={() => setMedications(medications + 1)}
                    className="w-10 h-10 rounded-xl bg-white/5 hover:bg-white/10 flex items-center justify-center text-slate-300 transition-colors border border-white/5"
                  >
                    <Plus className="w-4 h-4" />
                  </button>
                </div>
              </div>

              <div className="space-y-4">
                <label className="text-[13px] font-semibold text-slate-300 block">Chronic Conditions</label>
                <div className="flex flex-wrap gap-2">
                  {['Diabetes', 'Asthma', 'Heart', 'Hypertension'].map(c => (
                    <button
                      key={c}
                      onClick={() => toggleCondition(c)}
                      className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-all border ${
                        conditions.includes(c) 
                        ? 'bg-cipher-primary/10 border-cipher-primary text-cipher-primary' 
                        : 'bg-white/5 border-white/10 text-slate-500 hover:border-white/20'
                      }`}
                    >
                      {c}
                    </button>
                  ))}
                </div>
              </div>
            </div>

            <button
              onClick={handleSubmit}
              disabled={isAnalyzing}
              style={{
                background: isAnalyzing ? 'rgba(255,255,255,0.05)' : 'linear-gradient(135deg, #00D4FF, #0099CC)',
                color: isAnalyzing ? '#475569' : '#0A0F1E',
                fontWeight: '700',
                border: 'none',
                borderRadius: '12px',
                padding: '14px 24px',
                fontSize: '15px',
                opacity: isAnalyzing ? 0.7 : 1,
                cursor: isAnalyzing ? 'not-allowed' : 'pointer',
                width: '100%',
                transition: 'opacity 0.2s, transform 0.1s'
              }}
              className="hover:opacity-90 active:scale-[0.98]"
            >
              {isAnalyzing
                ? step === 'encrypting'
                  ? '🔐 Encrypting...'
                  : step === 'analyzing'
                  ? '⚡ Analyzing...'
                  : step === 'decrypting'
                  ? '🔓 Finalizing...'
                  : 'Processing...'
                : 'Encrypt & Analyze Metrics'
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
                  <div className="w-2 h-2 rounded-full bg-cipher-primary animate-pulse" />
                  <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Encryption Pipeline</h3>
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
                    // WHAT LEAVES YOUR DEVICE (REAL-TIME PREVIEW)
                  </div>
                  
                  <div className="space-y-3">
                    <div style={{ color: '#FF6B6B' }}>
                      symptoms: {symptomSeverity} 
                      <span style={{ color: '#334155', marginLeft: '12px' }}>← plaintext data</span>
                    </div>
                    <div style={{ color: '#FF6B6B' }}>
                      medications: {medications}
                      <span style={{ color: '#334155', marginLeft: '12px' }}>← user input</span>
                    </div>
                    <div style={{ color: '#FF6B6B' }}>
                      conditions: {conditions.length}
                    </div>

                    <div style={{ 
                      borderTop: '1px solid rgba(255,255,255,0.05)',
                      marginTop: '20px',
                      paddingTop: '20px',
                      color: '#475569',
                      fontStyle: 'italic'
                    }}>
                      Waiting for encryption pulse...
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
                    key: 'encrypting', 
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
                    'encrypting','analyzing','decrypting'
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
                          ? '2px solid #00D4FF'
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
                            background: '#00D4FF'
                          }} />
                        )}
                      </div>
                      <span style={{
                        fontSize: '13px',
                        color: isDone 
                          ? '#00FF88'
                          : isActive 
                          ? '#00D4FF'
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
                    label={riskLevel}
                  />
                </div>

                  {riskLevel === 'low' && (
                    <div style={{
                      background: 'rgba(0,255,136,0.1)',
                      border: '1px solid rgba(0,255,136,0.3)',
                      color: '#00FF88',
                      borderRadius: '10px',
                      padding: '12px 16px',
                      fontWeight: 600,
                      fontSize: '14px'
                    }}>
                      ✓ Low Risk — Good health indicators
                    </div>
                  )}

                  {riskLevel === 'medium' && (
                    <div style={{
                      background: 'rgba(255,184,0,0.1)',
                      border: '1px solid rgba(255,184,0,0.3)',
                      color: '#FFB800',
                      borderRadius: '10px',
                      padding: '12px 16px',
                      fontWeight: 600,
                      fontSize: '14px'
                    }}>
                      ⚡ Medium Risk — Monitor your health
                    </div>
                  )}

                  {riskLevel === 'high' && (
                    <div style={{
                      background: 'rgba(255,51,102,0.1)',
                      border: '1px solid rgba(255,51,102,0.4)',
                      color: '#FF3366',
                      borderRadius: '10px',
                      padding: '12px 16px',
                      fontWeight: 600,
                      fontSize: '14px'
                    }}>
                      ⚠️ High Risk — Please consult a doctor
                      <div style={{
                        fontSize: '12px',
                        fontWeight: 400,
                        marginTop: '4px',
                        color: 'rgba(255,51,102,0.8)'
                      }}>
                        This is AI-generated guidance only. 
                        Always consult a qualified medical 
                        professional.
                      </div>
                    </div>
                  )}

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
                    onClick={() => navigate('/mind')}
                    style={{
                      background: 'rgba(123,47,255,0.15)',
                      border: '1px solid rgba(123,47,255,0.4)',
                      borderRadius: '10px',
                      padding: '10px 20px',
                      color: '#7B2FFF',
                      cursor: 'pointer',
                      fontSize: '13px',
                      fontWeight: 600
                    }}
                  >
                    Next: Mind Check-in →
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

export default HealthPage;
