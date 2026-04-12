import React, { useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  TrendingUp, 
  Eye, 
  EyeOff, 
  DollarSign, 
  CheckCircle2, 
  Loader2, 
  ShieldAlert,
  ArrowRight,
  Target
} from 'lucide-react';
import axios from 'axios';

// Design System Components
import GlassCard from '../components/GlassCard';
import DataStream from '../components/DataStream';
import WellnessRing from '../components/WellnessRing';

// Cryptography
import { useFHE } from '../hooks/useFHE';
import { useWallet } from '../context/WalletContext';
import { useCipherLifeContract } from '../hooks/useCipherLifeContract';
import { useDemo } from '../context/DemoContext';
import { executeUnifiedSubmission } from '../utils/submission';
import { useOpenAIAdvisor } from '../hooks/useOpenAIAdvisor';
import AIInsightCard from '../components/AIInsightCard';

const stabilityOptions = [
  { id: 'freelance', label: 'Freelance', desc: 'Variable income', icon: <Target className="w-4 h-4 text-amber-500" /> },
  { id: 'part-time', label: 'Part-time', desc: 'Limited hours', icon: <Target className="w-4 h-4 text-amber-500 opacity-70" /> },
  { id: 'full-time', label: 'Full-time', desc: 'Steady salary', icon: <Target className="w-4 h-4 text-amber-400" /> },
  { id: 'multiple', label: 'Multiple', desc: 'Hybrid streams', icon: <Target className="w-4 h-4 text-amber-300" /> },
];

const FinancePage = () => {
  const { encryptModule, decryptResult } = useFHE();
  const { account } = useWallet();
  const { submitFinance } = useCipherLifeContract();
  const { isDemoMode, getDemoData } = useDemo();
  
  // Form State
  const [income, setIncome] = useState(8500);
  const [spending, setSpending] = useState(4200);
  const [debtPercent, setDebtPercent] = useState(45);
  const [savingsRate, setSavingsRate] = useState(15);
  const [stability, setStability] = useState('full-time');
  
  // Submission State
  const [step, setStep] = useState(0); 
  const [scoreData, setScoreData] = useState(null);
  const { getInsights, isLoading: aiLoading, insights, error: aiError } = useOpenAIAdvisor();

  const handleAssess = async () => {
    setStep(1);
    
    try {
      const inputs = isDemoMode 
        ? Object.values(getDemoData('finance'))
        : [income, spending, debtPercent, savingsRate];

      await executeUnifiedSubmission({
        moduleName: 'Finance',
        rawData: inputs,
        encryptFn: encryptModule,
        decryptFn: decryptResult,
        contractFn: submitFinance,
        apiEndpoint: 'http://localhost:3001/analyze/finance',
        walletAccount: account,
        onComplete: (score) => {
          setScoreData({
            score: Math.round(score),
            level: score > 70 ? 'CRITICAL' : score > 40 ? 'MODERATE' : 'OPTIMAL'
          });
          setStep(4);
          
          // Trigger AI Advisor
          const stress = score > 70 ? 'High' : score > 40 ? 'Moderate' : 'Low';
          getInsights('finance', Math.round(score), stress, stability);
        }
      });
    } catch (err) {
      setStep(0);
    }
  };

  const getRecommendations = (score) => {
    if (score > 70) return [
      "Immediate action: Pause all non-essential discretionary spending.",
      "Consolidate high-interest debt into a single lower-rate instrument.",
      "Emergency fund target: aim for 3 months of basic living costs."
    ];
    if (score > 40) return [
      "Review subscription recurring costs for optimization potential.",
      "Increase monthly debt repayment by 10% to accelerate clearance.",
      "Automate a small percentage of income increase towards high-yield savings."
    ];
    return [
      "Wealth Preservation: Rebalance portfolio for diversified stability.",
      "Consider tax-loss harvesting for the current fiscal quarter.",
      "Maintain existing savings rate to sustain long-term growth targets."
    ];
  };

  return (
    <div className="max-w-4xl mx-auto space-y-10 pb-20 font-mono">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 bg-amber-500/20 rounded-xl flex items-center justify-center shadow-lg shadow-amber-500/20 ring-1 ring-amber-500/30">
            <TrendingUp className="text-amber-400 w-7 h-7" />
          </div>
          <div>
            <h1 className="text-3xl font-black gradient-text from-amber-200 to-amber-500 tracking-tighter uppercase italic">Finance Module</h1>
            <p className="text-slate-500 text-[10px] font-bold uppercase tracking-widest leading-none">Fiscal Integrity Analysis Engine</p>
          </div>
        </div>
        <div className="text-[10px] bg-amber-500/5 px-4 py-1.5 rounded-full border border-amber-500/20 text-amber-500/80 font-bold uppercase tracking-widest flex items-center gap-2">
           <DollarSign className="w-3 h-3" />
           Analytical Transparency Active
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
        {/* Left Column: Input Form (8 col) */}
        <div className="lg:col-span-8 space-y-8">
          <GlassCard className="space-y-10">
            <div className="grid md:grid-cols-2 gap-8">
              {/* Monthly Income */}
              <MaskedInput 
                label="Monthly Net Income" 
                value={income} 
                onChange={setIncome} 
                prefix="$"
              />
              
              {/* Monthly Spending */}
              <MaskedInput 
                label="Monthly Spending" 
                value={spending} 
                onChange={setSpending} 
                prefix="$"
              />
            </div>

            {/* Debt Slider */}
            <div className="space-y-4">
              <div className="flex justify-between items-center px-1">
                <label className="text-[10px] font-bold uppercase tracking-[0.2em] text-slate-500">Debt-to-Annual-Income</label>
                <span className="text-sm font-black text-amber-200">{debtPercent}%</span>
              </div>
              <div className="relative pt-2">
                <input 
                  type="range" min="0" max="200" value={debtPercent}
                  onChange={(e) => setDebtPercent(parseInt(e.target.value))}
                  className="w-full h-1.5 bg-amber-500/10 rounded-lg appearance-none cursor-pointer accent-amber-500"
                />
                <div className="flex justify-between mt-3 text-[8px] font-bold text-slate-700 uppercase tracking-widest">
                  <span>Sustainable (0%)</span>
                  <span>Leveraged (100%)</span>
                  <span>Critical (200%)</span>
                </div>
              </div>
            </div>

            <div className="grid md:grid-cols-2 gap-12 items-center">
              {/* Arc Gauge for Savings */}
              <div className="flex flex-col items-center gap-4">
                 <ArcGauge value={savingsRate} />
                 <div className="text-center">
                    <span className="text-[9px] font-black uppercase text-slate-600 block tracking-[0.2em] mb-1">Savings Rate</span>
                    <input 
                      type="range" min="0" max="100" value={savingsRate}
                      onChange={(e) => setSavingsRate(parseInt(e.target.value))}
                      className="w-32 h-1 bg-amber-500/10 appearance-none rounded-full accent-amber-500 cursor-pointer"
                    />
                 </div>
              </div>

              {/* Stability Cards */}
              <div className="space-y-4">
                <label className="text-[10px] font-bold uppercase tracking-[0.2em] text-slate-500 block">Income Stability</label>
                <div className="grid grid-cols-2 gap-3">
                  {stabilityOptions.map(opt => (
                    <button
                      key={opt.id}
                      onClick={() => setStability(opt.id)}
                      className={`flex flex-col items-start gap-1 p-3 rounded-lg border text-left transition-all ${
                        stability === opt.id 
                        ? 'bg-amber-500/10 border-amber-500/40' 
                        : 'bg-white/5 border-white/5 opacity-50 hover:opacity-100 hover:border-white/10'
                      }`}
                    >
                      {opt.icon}
                      <span className={`text-[9px] font-bold uppercase tracking-tight mt-1 ${stability === opt.id ? 'text-amber-200' : 'text-slate-500'}`}>{opt.label}</span>
                    </button>
                  ))}
                </div>
              </div>
            </div>

            <div className="pt-4 space-y-4">
              <button
                onClick={handleAssess}
                disabled={step > 0}
                className={`w-full py-4 rounded-lg font-black uppercase tracking-[0.3em] text-[10px] transition-all shadow-xl border border-amber-500/20 ${
                  step > 0 
                  ? 'bg-white/5 text-slate-600' 
                  : 'bg-gradient-to-br from-amber-600 to-amber-900 text-amber-100 hover:border-amber-400/50'
                }`}
              >
                Encrypt & Assess Fiscal Stress
              </button>
              <div className="flex items-center justify-center gap-2 opacity-40">
                <div className="h-[1px] flex-1 bg-white/10" />
                <span className="text-[8px] font-black uppercase tracking-[0.5em] text-slate-400">Secure Computation Module</span>
                <div className="h-[1px] flex-1 bg-white/10" />
              </div>
            </div>
          </GlassCard>
        </div>

        {/* Right Column: Previews & Results (4 col) */}
        <div className="lg:col-span-4 space-y-8">
          {/* Encryption Preview */}
          {step === 0 && !scoreData && (
            <div className="space-y-6">
              <div className="flex flex-col gap-1">
                <span className="text-[10px] font-black uppercase tracking-[0.2em] text-amber-500/60">Live Signal Feed</span>
                <div className="h-[1px] w-full bg-amber-500/10" />
              </div>
              <div className="space-y-3">
                <DataStream label="Fiscal Inflow" value={`$${income}`} />
                <DataStream label="Outflow Vector" value={`$${spending}`} />
                <DataStream label="Leverage Score" value={`${debtPercent}%`} />
              </div>
              <div className="p-4 rounded-lg bg-black/40 border border-white/5 text-[9px] text-slate-600 leading-relaxed italic">
                 Note: All data is locally blinded using TFHE-compatible quantization before transmission.
              </div>
            </div>
          )}

          {/* FHE Analysis Workflow */}
          {step > 0 && step < 4 && (
            <div className="space-y-8 py-10 px-4">
               <AnalysisStep currentStep={step} stepIndex={1} text="Quantizing net inflow..." />
               <AnalysisStep currentStep={step} stepIndex={2} text="Running homomorphic regression..." />
               <AnalysisStep currentStep={step} stepIndex={3} text="Decrypting risk boundary..." />
            </div>
          )}

          {/* Scoring & Recommendations */}
          <AnimatePresence>
            {step === 4 && scoreData && (
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                className="space-y-8"
              >
                <div className="flex flex-col items-center">
                   <span className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-600 mb-6">Fiscal Stress Index</span>
                   <WellnessRing score={scoreData.score} size={200} />
                   <p className="mt-4 text-[10px] font-black uppercase tracking-[0.3em] text-rose-500">
                      Stress Level: {scoreData.score > 70 ? 'CRITICAL' : scoreData.score > 40 ? 'MODERATE' : 'OPTIMAL'}
                   </p>
                </div>

                {/* AI Advice Section */}
                {scoreData && (
                  <AIInsightCard 
                    module="finance"
                    score={scoreData.score}
                    insights={insights.finance}
                    isLoading={aiLoading}
                    error={aiError}
                    onRefresh={() => {
                       const stress = scoreData.score > 70 ? 'High' : scoreData.score > 40 ? 'Moderate' : 'Low';
                       getInsights('finance', scoreData.score, stress, stability);
                    }}
                  />
                )}

                <button 
                  onClick={() => setStep(0)}
                  className="w-full text-center text-[9px] font-bold uppercase text-slate-600 hover:text-white transition-colors"
                >
                  Terminate Analysis Session
                </button>
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </div>
    </div>
  );
};

// Specialized UI Components

const MaskedInput = ({ label, value, onChange, prefix }) => {
  const [isMasked, setIsMasked] = useState(false);
  const timerRef = useRef(null);

  const handleChange = (e) => {
    const val = parseInt(e.target.value.replace(/\D/g, '')) || 0;
    onChange(val);
    
    // Reset masking timer on interaction
    setIsMasked(false);
    if (timerRef.current) clearTimeout(timerRef.current);
    timerRef.current = setTimeout(() => setIsMasked(true), 3000);
  };

  useEffect(() => {
    timerRef.current = setTimeout(() => setIsMasked(true), 3000);
    return () => clearTimeout(timerRef.current);
  }, []);

  return (
    <div className="space-y-3">
      <div className="flex justify-between items-center group">
        <label className="text-[10px] font-bold uppercase tracking-[0.2em] text-slate-500">{label}</label>
        <button 
          onClick={() => {
            setIsMasked(false);
            if (timerRef.current) clearTimeout(timerRef.current);
            timerRef.current = setTimeout(() => setIsMasked(true), 3000);
          }}
          className="opacity-0 group-hover:opacity-100 transition-opacity"
        >
          {isMasked ? <Eye className="w-3 h-3 text-amber-400" /> : <EyeOff className="w-3 h-3 text-slate-600" />}
        </button>
      </div>
      <div className="relative">
        <span className="absolute left-4 top-1/2 -translate-y-1/2 font-black text-amber-900/50">{prefix}</span>
        <input 
          type="text"
          value={isMasked ? '****' : value.toLocaleString()}
          onChange={handleChange}
          onFocus={() => setIsMasked(false)}
          className="w-full bg-white/5 border border-white/5 rounded-lg py-4 pl-10 pr-4 text-sm font-black text-amber-100 focus:bg-white/10 focus:border-amber-500/30 transition-all outline-none"
        />
        {isMasked && (
          <div className="absolute inset-0 bg-amber-500/5 backdrop-blur-[2px] rounded-lg pointer-events-none" />
        )}
      </div>
    </div>
  );
};

const ArcGauge = ({ value }) => {
  const radius = 60;
  const circumference = radius * Math.PI; // Semicircle
  const offset = circumference - (value / 100) * circumference;

  return (
    <div className="relative flex items-center justify-center h-20 w-40 overflow-hidden">
      <svg className="absolute top-0 rotate-180" width="140" height="70" viewBox="0 0 140 70">
        <path
          d="M 10 70 A 60 60 0 0 1 130 70"
          fill="none"
          stroke="rgba(255,255,255,0.05)"
          strokeWidth="10"
        />
        <motion.path
          d="M 10 70 A 60 60 0 0 1 130 70"
          fill="none"
          stroke="#FBBF24"
          strokeWidth="10"
          strokeDasharray={circumference}
          initial={{ strokeDashoffset: circumference }}
          animate={{ strokeDashoffset: offset }}
          transition={{ duration: 1.5, ease: "easeOut" }}
          strokeLinecap="round"
        />
      </svg>
      <div className="absolute bottom-0 text-center">
         <span className="text-xl font-black italic">{value}%</span>
      </div>
    </div>
  );
};

const AnalysisStep = ({ currentStep, stepIndex, text }) => {
  const isDone = currentStep > stepIndex;
  const isActive = currentStep === stepIndex;

  return (
    <div className="flex items-start gap-4">
       <div className={`mt-1 shrink-0 ${isDone ? 'text-amber-400' : isActive ? 'text-amber-100 animate-pulse' : 'text-slate-800'}`}>
          {isDone ? <CheckCircle2 className="w-4 h-4" /> : <Loader2 className="w-4 h-4 animate-spin" />}
       </div>
       <div className="space-y-1">
          <p className={`text-[10px] font-black uppercase tracking-widest ${isDone ? 'text-amber-400' : isActive ? 'text-white' : 'text-slate-700'}`}>
             {text}
          </p>
          {isActive && (
            <div className="h-[2px] w-full bg-white/5 overflow-hidden">
               <motion.div 
                 initial={{ x: '-100%' }}
                 animate={{ x: '100%' }}
                 transition={{ repeat: Infinity, duration: 1.5 }}
                 className="h-full w-1/2 bg-amber-500"
               />
            </div>
          )}
       </div>
    </div>
  );
};

export default FinancePage;
