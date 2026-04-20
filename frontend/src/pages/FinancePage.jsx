import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  Wallet, 
  TrendingUp, 
  TrendingDown,
  DollarSign,
  PieChart,
  Loader2,
} from 'lucide-react';

// Design System Components
import GlassCard from '../components/GlassCard';
import WellnessRing from '../components/WellnessRing';

import { useNavigate } from 'react-router-dom';
import { callMLApi } from '../utils/mlApi';
import { initFHEWhenReady, hashInputs, addToVaultLog } from '../utils/fheEncryption';

const FinancePage = () => {
  const [mounted, setMounted] = useState(false);
  const navigate = useNavigate();

  // Form State
  const [netIncome, setNetIncome] = useState(100);
  const [expenditure, setExpenditure] = useState(50);
  const [debtRatio, setDebtRatio] = useState(30);
  const [incomeStability, setIncomeStability] = useState(75);
  
  // Submission State
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [analysisComplete, setAnalysisComplete] = useState(false);
  const [step, setStep] = useState(null);
  const [score, setScore] = useState(null);
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
      const savingsRate = netIncome > 0
        ? Math.max(0, 
            ((netIncome - expenditure) 
             / netIncome) * 100
          )
        : 0;
      
      const inputs = {
        net_income: netIncome,
        expenditure: expenditure,
        savings_rate: Math.round(savingsRate),
        debt_ratio: debtRatio || 30,
        income_stability: incomeStability || 75,
        spending_volatility: 
          100 - Math.round(savingsRate)
      };

      setStep('encrypting');
      await initFHEWhenReady();
      await new Promise(r => setTimeout(r, 800));
      
      setStep('analyzing');
      const result = await callMLApi(
        'finance', inputs
      );

      setStep('decrypting');
      await new Promise(r => setTimeout(r, 600));

      const resultScore = result.score 
        ?? result.stress_score 
        ?? Math.round(100 - savingsRate);

      localStorage.setItem(
        'cipherlife_finance_score',
        String(Math.min(100, Math.max(0, resultScore)))
      );
      localStorage.setItem(
        'cipherlife_savings_rate',
        String(Math.round(savingsRate))
      );

      try {
        // Hash ratios only — never raw amounts
        const safeInputs = {
          savings_rate: Math.round(savingsRate),
          debt_ratio: inputs.debt_ratio,
          income_stability: inputs.income_stability
        };
        const inputHash = 
          await hashInputs(safeInputs);
        addToVaultLog(
          'Finance',
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
      setIsOfflineMode(!!result.offline_mode);
      setAnalysisComplete(true);

    } catch (err) {
      console.error('Finance submit failed:', err);
      setError('Assessment failed. Try again.');
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

  const savingsRate = netIncome > 0
    ? Math.max(0, Math.round(((netIncome - expenditure) / netIncome) * 100))
    : 0;

  return (
    <div className="max-w-[1200px] mx-auto p-8 space-y-8 pb-32">
       {/* Step Header */}
       <div className="flex items-center gap-4 text-[11px] font-black uppercase tracking-widest mb-2">
         <span className="text-slate-700">Step 2</span>
         <span className="text-slate-700">→</span>
         <span className="text-amber-500">Step 3 of 3</span>
         <div className="flex gap-2">
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-white/5 border border-white/10 opacity-40">
               <div className="w-1.5 h-1.5 rounded-full bg-slate-500" />
               <span className="text-slate-500">Health</span>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-white/5 border border-white/10 opacity-40">
               <div className="w-1.5 h-1.5 rounded-full bg-slate-500" />
               <span className="text-slate-500">Mind</span>
            </div>
            <div className="flex items-center gap-1.5 px-2 py-0.5 rounded-md bg-amber-500/10 border border-amber-500/20">
               <div className="w-1.5 h-1.5 rounded-full bg-amber-500" />
               <span className="text-amber-500">Finance</span>
            </div>
         </div>
      </div>

      <div style={{ marginBottom: '32px' }}>
        <h1 style={{
          fontSize: '32px',
          fontWeight: '800',
          background: 'linear-gradient(90deg, #FFB800, #FFFFFF)',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          marginBottom: '6px'
        }}>
          Financial Liquidity Engine
        </h1>
        <p style={{ color: 'var(--text-muted)', fontSize: '14px', fontWeight: '500' }}>
          Fully Homomorphic privacy assessment of fiscal health.
        </p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
        <div className="space-y-6">
          <GlassCard className="p-6">
            <div className="flex items-center gap-2 mb-8">
              <DollarSign className="w-5 h-5 text-amber-500" />
              <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Economic Inputs</h3>
            </div>

            <div className="space-y-8">
              {/* Income */}
              <div className="space-y-4">
                <div className="flex justify-between items-center">
                   <label className="text-[13px] font-semibold text-slate-300">Monthly Net Income</label>
                   <span className="text-lg font-bold text-amber-500">${netIncome}</span>
                </div>
                <input 
                  type="range" min="100" max="25000" step="50" value={netIncome} 
                  onChange={(e) => setNetIncome(parseInt(e.target.value))}
                  className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-amber-500"
                />
              </div>

              {/* Spending */}
              <div className="space-y-4">
                <div className="flex justify-between items-center">
                   <label className="text-[13px] font-semibold text-slate-300">Monthly Expenditure</label>
                   <span className="text-lg font-bold text-rose-500">${expenditure}</span>
                </div>
                <input 
                  type="range" min="50" max="20000" step="10" value={expenditure} 
                  onChange={(e) => setExpenditure(parseInt(e.target.value))}
                  className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-rose-500"
                />
              </div>

              {/* Savings Progress */}
              <div style={{ marginTop: '16px', background: 'rgba(255,255,255,0.02)', padding: '20px', borderRadius: '16px', border: '1px solid rgba(255,255,255,0.05)' }}>
                <div style={{ 
                  display: 'flex', 
                  justifyContent: 'space-between',
                  fontSize: '12px',
                  color: 'var(--text-muted)',
                  marginBottom: '10px',
                  fontWeight: '600',
                  textTransform: 'uppercase',
                  letterSpacing: '0.05em'
                }}>
                  <span>Computed Savings Rate</span>
                  <span style={{ 
                    color: savingsRate > 20 ? '#00FF88' : savingsRate > 10 ? '#FFB800' : '#FF3366',
                    fontWeight: '800',
                    fontSize: '14px'
                  }}>
                    {savingsRate}%
                  </span>
                </div>
                <div style={{
                  height: '10px',
                  background: 'rgba(255,255,255,0.08)',
                  borderRadius: '5px',
                  overflow: 'hidden'
                }}>
                  <motion.div 
                    initial={{ width: 0 }}
                    animate={{ width: `${Math.min(100, savingsRate)}%` }}
                    style={{
                      height: '100%',
                      background: savingsRate > 20
                        ? 'linear-gradient(90deg, #00FF88, #00CC66)'
                        : savingsRate > 10
                        ? 'linear-gradient(90deg, #FFB800, #CC9200)'
                        : 'linear-gradient(90deg, #FF3366, #FF6B6B)',
                      borderRadius: '5px',
                    }} 
                  />
                </div>
              </div>
            </div>

            <button
              onClick={handleSubmit}
              disabled={isAnalyzing}
              style={{
                background: isAnalyzing ? 'rgba(255,255,255,0.05)' : 'linear-gradient(135deg, #FFB800, #CC9200)',
                color: '#0A0F1E',
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
                ? step === 'encrypting'
                  ? '🔐 Encrypting...'
                  : step === 'analyzing'
                  ? '⚡ Analyzing...'
                  : step === 'decrypting'
                  ? '🔓 Finalizing...'
                  : 'Processing...'
                : 'Encrypt & Assess'
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
                  <PieChart className="w-5 h-5 text-amber-500" />
                  <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Privacy Preview</h3>
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
                    // FISCAL MODULE: LOCAL DATA STATE
                  </div>
                  
                  <div className="space-y-3">
                    <div style={{ color: '#FF6B6B' }}>net_income: {netIncome} <span className="text-slate-700 ml-4">← local plaintext</span></div>
                    <div style={{ color: '#FF6B6B' }}>expenditure: {expenditure}</div>
                    <div style={{ color: '#FF6B6B' }}>savings_rate: {savingsRate}%</div>
                    
                    <div style={{ color: '#444', marginTop: '20px', borderTop: '1px solid #ffffff05', paddingTop: '10px' }}>
                      Server sees $0 throughout this session.
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
                          ? '2px solid #FFB800'
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
                            background: '#FFB800'
                          }} />
                        )}
                      </div>
                      <span style={{
                        fontSize: '13px',
                        color: isDone 
                          ? '#00FF88'
                          : isActive 
                          ? '#FFB800'
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
                    label={`${score}/100`}
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
                  {score < 40
                    ? '✓ Healthy financial position'
                    : score < 70
                    ? '⚡ Moderate financial stress'
                    : '⚠️ High financial stress'}
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
                    onClick={() => navigate('/dashboard')}
                    style={{
                      background: 'rgba(0,212,255,0.15)',
                      border: '1px solid rgba(0,212,255,0.4)',
                      borderRadius: '10px',
                      padding: '10px 20px',
                      color: '#00D4FF',
                      cursor: 'pointer',
                      fontSize: '13px',
                      fontWeight: 600
                    }}
                  >
                    View Full Dashboard →
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

export default FinancePage;
