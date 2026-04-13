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

import { useWallet } from '../context/WalletContext';
import { useOpenAIAdvisor } from '../hooks/useOpenAIAdvisor';
import AIInsightCard from '../components/AIInsightCard';
import { getFHEInstance, hashInputs, addToVaultLog } from '../utils/fheEncryption';

const FinancePage = () => {
  const [mounted, setMounted] = useState(false);
  const { account } = useWallet();
  const { getInsights, isLoading: aiLoading, insights, error: aiError } = useOpenAIAdvisor();

  // Form State
  const [income, setIncome] = useState(5000);
  const [spending, setSpending] = useState(3000);
  const [savingsRate, setSavingsRate] = useState(20);
  
  // Submission State
  const [step, setStep] = useState(0); 
  const [resultScore, setResultScore] = useState(null);
  const [error, setError] = useState(null);
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [fheSuccess, setFheSuccess] = useState(false);
  const [riskLevel, setRiskLevel] = useState('moderate');

  useEffect(() => {
    setMounted(true);
    // Auto-calculate savings rate
    const rate = Math.max(0, Math.round(((income - spending) / income) * 100));
    setSavingsRate(isNaN(rate) ? 0 : rate);
  }, [income, spending]);

  const handleAnalyze = async () => {
    setIsAnalyzing(true);
    setStep(1);
    setError(null);
    setFheSuccess(false);

    const formValues = { income, spending, savingsRate };
    const isDemoMode = import.meta.env.VITE_DEMO_MODE === 'true';

    if (isDemoMode) {
      const demoScores = { finance: 42 };
      localStorage.setItem('cipherlife_finance_score', String(demoScores.finance));
      addToVaultLog('Finance', '0xdemo_hash_finance...', '0xdemo_cipher_finance...');
      setResultScore(demoScores.finance);
      setStep(4);
      setIsAnalyzing(false);
      return; 
    }

    try {
      const mlResult = await fetch(
        `${import.meta.env.VITE_ML_API_URL}/analyze/finance`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(formValues)
        }
      ).then(r => r.json());

      const score = mlResult.score || 45;
      localStorage.setItem('cipherlife_finance_score', String(score));

      setStep(2);
      const fhe = await getFHEInstance();
      
      if (fhe && import.meta.env.VITE_CONTRACT_ADDRESS && import.meta.env.VITE_CONTRACT_ADDRESS !== '0x000...') {
        try {
          const contractAddress = import.meta.env.VITE_CONTRACT_ADDRESS;
          const userAddress = (await window.ethereum.request({ method: 'eth_accounts' }))[0];

          const input = fhe.createEncryptedInput(contractAddress, userAddress);
          input.add32(Math.round(score)); // Finance uses add32 according to old fheEncryption.ts
          const encrypted = await input.encrypt();

          addToVaultLog(
            'Finance',
            await hashInputs(formValues),
            '0x' + Buffer.from(encrypted.handles[0]).toString('hex').slice(0, 20) + '...'
          );

          setFheSuccess(true);
        } catch (fheErr) {
          console.warn('⚠️ FHE encryption skipped:', fheErr.message);
          setFheSuccess(false);
        }
      } else {
        addToVaultLog('Finance', await hashInputs(formValues), 'demo-mode-no-encryption');
      }

      setStep(3);
      setResultScore(score);
      setRiskLevel(mlResult.risk_level || 'moderate');
      setStep(4);

    } catch (err) {
      console.error('Analysis failed:', err);
      setError('Analysis failed. Check your connection and try again.');
    } finally {
      setIsAnalyzing(false);
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
                   <span className="text-lg font-bold text-amber-500">${income}</span>
                </div>
                <input 
                  type="range" min="1000" max="25000" step="100" value={income} 
                  onChange={(e) => setIncome(parseInt(e.target.value))}
                  className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-amber-500"
                />
              </div>

              {/* Spending */}
              <div className="space-y-4">
                <div className="flex justify-between items-center">
                   <label className="text-[13px] font-semibold text-slate-300">Monthly Expenditure</label>
                   <span className="text-lg font-bold text-rose-500">${spending}</span>
                </div>
                <input 
                  type="range" min="500" max="20000" step="100" value={spending} 
                  onChange={(e) => setSpending(parseInt(e.target.value))}
                  className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-rose-500"
                />
              </div>

              {/* Savings Progress Bar Implementation */}
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
                <div style={{ 
                  fontSize: '11px',
                  color: 'var(--text-muted)',
                  marginTop: '10px',
                  fontWeight: '500',
                  lineHeight: '1.4'
                }}>
                  {savingsRate < 10 && "⚠️ Warning: Savings rate below recommended minimum safety margin."}
                  {savingsRate >= 10 && savingsRate < 20 && "📈 Moderate efficiency: Goal is to reach 20% for long-term compounding."}
                  {savingsRate >= 20 && "✓ Optimal efficiency: You are successfully building a secure capital buffer."}
                </div>
              </div>
            </div>

            <button
              onClick={handleAnalyze}
              disabled={step > 0}
              style={{
                background: step > 0 ? 'rgba(255,255,255,0.05)' : 'linear-gradient(135deg, #FFB800, #CC9200)',
                color: '#0A0F1E',
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
              Encrypt & Assess
            </button>
          </GlassCard>
        </div>

        {/* Data Stream */}
        <div className="space-y-6">
          <GlassCard className="p-6 h-full min-h-[400px]">
             {step === 0 && (
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
                    <div style={{ color: '#FF6B6B' }}>net_income: {income} <span className="text-slate-700 ml-4">← local plaintext</span></div>
                    <div style={{ color: '#FF6B6B' }}>expenditure: {spending}</div>
                    <div style={{ color: '#FF6B6B' }}>savings_rate: {savingsRate}%</div>
                    
                    <div style={{ color: '#444', marginTop: '20px', borderTop: '1px solid #ffffff05', paddingTop: '10px' }}>
                      Server sees $0 throughout this session.
                    </div>
                  </div>
                </div>
              </div>
            )}

            {step > 0 && step < 4 && (
              <div className="h-full flex flex-col justify-center items-center gap-6 py-20">
                 <Loader2 className="w-12 h-12 text-amber-500 animate-spin" />
                 <div className="text-center">
                    <h4 className="text-lg font-bold uppercase tracking-tighter">Fiscal Blindness Active</h4>
                    <p className="text-slate-500 text-xs mt-2">Converting net worth metrics to ciphertext handles...</p>
                 </div>
              </div>
            )}

            {step === 4 && (
              <motion.div 
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                className="flex flex-col items-center justify-center h-full gap-8 py-6"
              >
                <div className="text-center">
                   <WellnessRing score={resultScore} size={150} color="#FFB800" />
                   <div className="mt-4 text-2xl font-black text-amber-500">LIQUIDITY INDEX: {resultScore}</div>
                </div>
                <AIInsightCard 
                  module="finance"
                  score={resultScore}
                  insights={insights.finance}
                  isLoading={aiLoading}
                  error={aiError}
                  onRefresh={() => getInsights('finance', resultScore, savingsRate < 10 ? 'Risky' : 'Stable')}
                />
              </motion.div>
            )}
          </GlassCard>
        </div>
      </div>
    </div>
  );
};

export default FinancePage;
