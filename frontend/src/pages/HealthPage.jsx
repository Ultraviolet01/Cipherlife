import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  HeartPulse, 
  Minus, 
  Plus, 
  ChevronDown, 
  ChevronUp, 
  CheckCircle2, 
  Loader2,
  Info,
  Sparkles
} from 'lucide-react';
import axios from 'axios';

// Design System Components
import GlassCard from '../components/GlassCard';
import EncryptionBadge from '../components/EncryptionBadge';
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

const HealthPage = () => {
  const { encryptModule, decryptResult } = useFHE();
  const { account } = useWallet();
  const { submitHealth } = useCipherLifeContract();
  const { isDemoMode, getDemoData } = useDemo();
  const { getInsights, isLoading: aiLoading, insights, error: aiError } = useOpenAIAdvisor();

  // Form State
  const [symptoms, setSymptoms] = useState(2);
  const [meds, setMeds] = useState(1);
  const [conditions, setConditions] = useState([]);
  const [anomaly, setAnomaly] = useState(15);
  
  // Submission State
  const [step, setStep] = useState(0); 
  const [isExplainerOpen, setIsExplainerOpen] = useState(false);
  const [resultScore, setResultScore] = useState(null);

  const toggleCondition = (c) => {
    setConditions(prev => 
      prev.includes(c) ? prev.filter(x => x !== c) : [...prev, c]
    );
  };

  const handleAnalyze = async () => {
    setStep(1);
    
    try {
      const inputs = isDemoMode 
        ? Object.values(getDemoData('health'))
        : [symptoms, meds, conditions.length, anomaly];

      await executeUnifiedSubmission({
        moduleName: 'Health',
        rawData: inputs,
        encryptFn: encryptModule,
        decryptFn: decryptResult,
        contractFn: submitHealth,
        apiEndpoint: 'http://localhost:3001/analyze/health',
        walletAccount: account,
        onComplete: (score) => {
          setResultScore(score);
          setStep(4);
          
          // Trigger AI Advisor automatically
          const risk = score > 70 ? 'High' : score > 40 ? 'Moderate' : 'Low';
          getInsights('health', score, risk);
        }
      });
    } catch (error) {
      setStep(0);
    }
  };

  const conditionOptions = ["Diabetes", "Hypertension", "Asthma", "Other"];

  return (
    <div className="max-w-4xl mx-auto space-y-8 pb-20">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 bg-rose-500/20 rounded-xl flex items-center justify-center shadow-lg shadow-rose-500/10">
            <HeartPulse className="text-rose-400 w-7 h-7" />
          </div>
          <div>
            <h1 className="text-3xl font-black gradient-text tracking-tighter uppercase italic">Health Module</h1>
            <p className="text-slate-500 text-[10px] font-bold uppercase tracking-widest">Biometric Integrity Controller</p>
          </div>
        </div>
        <EncryptionBadge />
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        {/* Input Form */}
        <div className="space-y-6">
          <GlassCard className="space-y-8">
            {/* Symptoms Slider */}
            <div className="space-y-4">
              <div className="flex justify-between items-center">
                <label className="text-xs font-bold uppercase tracking-widest text-slate-400">Symptom Count</label>
                <span className="text-lg font-black text-cipher-primary font-mono">{symptoms}</span>
              </div>
              <input 
                type="range" min="0" max="10" value={symptoms} 
                onChange={(e) => setSymptoms(parseInt(e.target.value))}
                className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-cipher-primary"
              />
            </div>

            {/* Medications Counter */}
            <div className="space-y-4">
              <label className="text-xs font-bold uppercase tracking-widest text-slate-400 block">Active Medications</label>
              <div className="flex items-center gap-6">
                <button 
                  onClick={() => setMeds(Math.max(0, meds - 1))}
                  className="w-10 h-10 rounded-xl bg-white/5 hover:bg-white/10 flex items-center justify-center text-slate-300 transition-colors"
                >
                  <Minus className="w-4 h-4" />
                </button>
                <span className="text-2xl font-black font-mono w-8 text-center">{meds}</span>
                <button 
                  onClick={() => setMeds(meds + 1)}
                  className="w-10 h-10 rounded-xl bg-white/5 hover:bg-white/10 flex items-center justify-center text-slate-300 transition-colors"
                >
                  <Plus className="w-4 h-4" />
                </button>
              </div>
            </div>

            {/* Conditions Multi-select */}
            <div className="space-y-4">
              <label className="text-xs font-bold uppercase tracking-widest text-slate-400 block">Chronic Conditions</label>
              <div className="flex flex-wrap gap-2">
                {conditionOptions.map(c => (
                  <button
                    key={c}
                    onClick={() => toggleCondition(c)}
                    className={`px-4 py-2 rounded-full text-xs font-bold transition-all border ${
                      conditions.includes(c) 
                      ? 'bg-cipher-primary/20 border-cipher-primary text-cipher-primary shadow-[0_0_15px_#00D4FF20]' 
                      : 'bg-white/5 border-white/10 text-slate-500 hover:border-white/30'
                    }`}
                  >
                    {c}
                  </button>
                ))}
              </div>
            </div>

            {/* Vitals Anomaly Slider */}
            <div className="space-y-4">
              <div className="flex justify-between items-center">
                <label className="text-xs font-bold uppercase tracking-widest text-slate-400">Vitals Anomaly</label>
                <span className="text-sm font-bold text-cipher-secondary font-mono">{anomaly}%</span>
              </div>
              <p className="text-[10px] text-slate-600 uppercase font-bold tracking-tighter">Self-reported deviation from normal</p>
              <input 
                type="range" min="0" max="100" value={anomaly} 
                onChange={(e) => setAnomaly(parseInt(e.target.value))}
                className="w-full h-1.5 bg-white/5 rounded-lg appearance-none cursor-pointer accent-cipher-secondary"
              />
            </div>

            <button
              onClick={handleAnalyze}
              disabled={step > 0}
              className={`w-full py-4 rounded-xl font-black uppercase tracking-[0.2em] text-xs transition-all shadow-lg ${
                step > 0 
                ? 'bg-white/5 text-slate-500 cursor-not-allowed' 
                : 'bg-gradient-to-r from-rose-500 to-rose-600 text-white hover:shadow-rose-500/20'
              }`}
            >
              Encrypt & Analyze
            </button>
          </GlassCard>
        </div>

        {/* Status / Output Panel */}
        <div className="space-y-6">
          <GlassCard className="h-full flex flex-col justify-between">
            {step === 0 && !resultScore && (
              <div className="flex flex-col gap-6">
                <div>
                  <h3 className="text-xs font-bold uppercase tracking-[0.2em] text-slate-500 mb-4">Encryption Preview</h3>
                  <div className="space-y-2">
                    <DataStream label="Symptoms" value={symptoms} />
                    <DataStream label="Meds" value={meds} />
                    <DataStream label="Anomaly" value={`${anomaly}%`} />
                  </div>
                </div>
                <div className="p-4 rounded-xl bg-cipher-primary/5 border border-dashed border-cipher-primary/20 flex flex-col items-center justify-center py-10 opacity-60">
                  <span className="text-[10px] font-bold uppercase tracking-widest text-cipher-primary mb-1">Preview Logic Active</span>
                  <p className="text-[9px] text-slate-500">This is what leaves your device ↑</p>
                </div>
              </div>
            )}

            {step > 0 && step < 4 && (
              <div className="flex-1 flex flex-col justify-center gap-8 py-10">
                <StepIndicator currentStep={step} stepIndex={1} text="Encrypting locally..." />
                <StepIndicator currentStep={step} stepIndex={2} text="Sending ciphertext to FHE model..." />
                <StepIndicator currentStep={step} stepIndex={3} text="Receiving encrypted result..." />
              </div>
            )}

            {step === 4 && (
              <motion.div 
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                className="flex-1 flex flex-col items-center justify-center py-6 gap-6"
              >
                <div className="text-center">
                  <h3 className="text-[10px] font-black uppercase tracking-[0.3em] text-cipher-success mb-2">Biometric Score Calculated</h3>
                  <WellnessRing score={resultScore} size={160} />
                </div>

                {/* AI Advice Section */}
                {resultScore !== null && (
                  <div className="w-full">
                    <AIInsightCard 
                      module="health"
                      score={resultScore}
                      insights={insights.health}
                      isLoading={aiLoading}
                      error={aiError}
                      onRefresh={() => {
                        const risk = resultScore > 70 ? 'High' : resultScore > 40 ? 'Moderate' : 'Low';
                        getInsights('health', resultScore, risk);
                      }}
                    />
                  </div>
                )}

                <button 
                  onClick={() => setStep(0)}
                  className="text-[10px] font-bold uppercase text-slate-500 hover:text-white transition-colors"
                >
                  Return to controller
                </button>
              </motion.div>
            )}

            <div className="pt-6 border-t border-white/5">
              <button 
                onClick={() => setIsExplainerOpen(!isExplainerOpen)}
                className="w-full flex items-center justify-between group"
              >
                <div className="flex items-center gap-2">
                  <Info className="w-4 h-4 text-cipher-primary group-hover:scale-110 transition-transform" />
                  <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">How does this protect you?</span>
                </div>
                {isExplainerOpen ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
              </button>
              
              <AnimatePresence>
                {isExplainerOpen && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="overflow-hidden"
                  >
                    <p className="text-[11px] text-slate-500 leading-relaxed mt-4 p-4 rounded-lg bg-white/5">
                      Fully Homomorphic Encryption (FHE) allows our servers to process your health data without ever seeing the raw numbers. 
                      Your local device encrypts the inputs into a complex mathematical ciphertext. 
                      The FHE model performs operations directly on this encrypted data, producing an encrypted result. 
                      Only <span className="text-cipher-primary font-bold">YOU</span> have the key to see what the result actually means.
                    </p>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          </GlassCard>
        </div>
      </div>
    </div>
  );
};

const StepIndicator = ({ currentStep, stepIndex, text }) => {
  const isDone = currentStep > stepIndex;
  const isActive = currentStep === stepIndex;

  return (
    <div className="flex items-center gap-4 group">
      <div className={`w-6 h-6 rounded-full flex items-center justify-center border transition-all ${
        isDone ? 'bg-cipher-success/20 border-cipher-success' : 
        isActive ? 'bg-cipher-primary/20 border-cipher-primary animate-pulse' : 
        'bg-white/5 border-white/10 opacity-30'
      }`}>
        {isDone ? <CheckCircle2 className="w-4 h-4 text-cipher-success" /> : 
         isActive ? <Loader2 className="w-4 h-4 text-cipher-primary animate-spin" /> : 
         <div className="w-1.5 h-1.5 rounded-full bg-slate-600" />}
      </div>
      <span className={`text-[10px] uppercase font-bold tracking-widest transition-all ${
        isDone ? 'text-cipher-success' : 
        isActive ? 'text-cipher-primary' : 
        'text-slate-700'
      }`}>
        {text}
      </span>
    </div>
  );
};

export default HealthPage;
