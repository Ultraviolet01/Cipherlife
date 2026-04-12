import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  Brain, 
  Moon, 
  Users, 
  CheckCircle2, 
  Loader2, 
  MessageCircleHeart,
  Calendar,
  Zap,
  Sparkles,
  Info,
  ChevronDown,
  ChevronUp
} from 'lucide-react';
import { 
  BarChart, 
  Bar, 
  XAxis, 
  YAxis, 
  CartesianGrid, 
  Tooltip, 
  ResponsiveContainer,
  Cell
} from 'recharts';
import axios from 'axios';

// Design System Components
import GlassCard from '../components/GlassCard';
import DataStream from '../components/DataStream';

// Cryptography
import { useFHE } from '../hooks/useFHE';
import { useWallet } from '../context/WalletContext';
import { useCipherLifeContract } from '../hooks/useCipherLifeContract';
import { useDemo } from '../context/DemoContext';
import { executeUnifiedSubmission } from '../utils/submission';
import { useOpenAIAdvisor } from '../hooks/useOpenAIAdvisor';
import AIInsightCard from '../components/AIInsightCard';

const emojis = [
  { icon: "😞", value: 1, label: "Low" },
  { icon: "😕", value: 2, label: "Fair" },
  { icon: "😐", value: 3, label: "Steady" },
  { icon: "🙂", value: 4, label: "Good" },
  { icon: "😄", value: 5, label: "Peak" }
];

const socialLevels = [
  { id: 'isolated', label: 'Isolated', icon: <Users className="w-4 h-4" /> },
  { id: 'some', label: 'Some Contact', icon: <Users className="w-4 h-4 opacity-70" /> },
  { id: 'connected', label: 'Connected', icon: <Users className="w-4 h-4" /> },
  { id: 'social', label: 'Very Social', icon: <Users className="w-4 h-4 text-purple-400" /> }
];

const MindPage = () => {
  const { encryptModule, decryptResult } = useFHE();
  const { account } = useWallet();
  const { submitMental } = useCipherLifeContract();
  const { isDemoMode, getDemoData } = useDemo();
  
  // Form State
  const [mood, setMood] = useState(3);
  const [sleep, setSleep] = useState(7);
  const [stress, setStress] = useState(4); // 0-10
  const [social, setSocial] = useState('connected');
  
  // Submission State
  const [step, setStep] = useState(0); 
  const [riskData, setRiskData] = useState(null);
  const [mindScore, setMindScore] = useState(null);
  const [history, setHistory] = useState([]);

  const { getInsights, isLoading: aiLoading, insights, error: aiError } = useOpenAIAdvisor();

  const handleCheckIn = async () => {
    setStep(1);
    
    try {
      const inputs = isDemoMode 
        ? Object.values(getDemoData('mind')).map((v, i) => i === 3 ? socialLevels.findIndex(s => s.id === v) : v)
        : [mood, sleep, stress, socialLevels.findIndex(s => s.id === social)];

      await executeUnifiedSubmission({
        moduleName: 'Mind',
        rawData: inputs,
        encryptFn: encryptModule,
        decryptFn: decryptResult,
        contractFn: submitMental,
        apiEndpoint: 'http://localhost:3001/analyze/mental',
        walletAccount: account,
        onComplete: (riskLevel) => {
          const riskLabels = ["Stable", "Emerging Stress", "Severe Burnout"];
          const riskColors = ["text-green-400", "text-amber-400", "text-rose-400"];

          setMindScore(100 - (riskLevel * 35));
          setRiskData({
            level: riskLabels[riskLevel],
            color: riskColors[riskLevel],
            message: getSupportiveMessage(riskLevel)
          });
          
          setStep(4);
          
          // Trigger AI Advisor
          getInsights('mind', mood * 20, (3 - riskLevel) * 33, social);
          
          const newEntry = { day: new Date().toLocaleDateString('en-US', { weekday: 'short' }), score: mood };
          const newHistory = [...history.slice(-6), newEntry];
          setHistory(newHistory);
          localStorage.setItem('cipherlife_mind_history', JSON.stringify(newHistory));
        }
      });
    } catch (err) {
      setStep(0);
    }
  };

  const getSupportiveMessage = (level) => {
    const messages = [
      "You're maintaining a great emotional balance. Keep up the mindfulness practices that are working for you.",
      "You've survived 100% of your bad days. Today might be heavy, but your resilience is stronger than your stress.",
      "Severe burnout detected. This is a physiological signal to rest. Please prioritize silence and safe spaces today."
    ];
    return messages[level];
  };

  return (
    <div className="max-w-4xl mx-auto space-y-10 pb-20">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 bg-purple-500/20 rounded-xl flex items-center justify-center shadow-lg shadow-purple-500/20">
            <Brain className="text-purple-400 w-7 h-7" />
          </div>
          <div>
            <h1 className="text-3xl font-black gradient-text from-purple-400 to-indigo-500 tracking-tighter uppercase italic">Mind Module</h1>
            <p className="text-slate-500 text-[10px] font-bold uppercase tracking-widest">Cognitive Integrity Engine</p>
          </div>
        </div>
        <div className="text-[10px] font-bold text-purple-400/60 uppercase tracking-widest bg-purple-500/5 px-3 py-1 rounded-full border border-purple-500/10">
          Safe & Supportive Space
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
        {/* Left Column: Input Form */}
        <div className="space-y-6">
          <GlassCard className="space-y-8">
            {/* Mood Selector */}
            <div className="space-y-4">
              <label className="text-xs font-bold uppercase tracking-widest text-slate-400 block text-center">How are you feeling?</label>
              <div className="flex justify-between items-center px-4">
                {emojis.map((e) => (
                  <button
                    key={e.value}
                    onClick={() => setMood(e.value)}
                    className="flex flex-col items-center gap-2 group"
                  >
                    <motion.span
                      animate={{ 
                        scale: mood === e.value ? 1.5 : 1,
                        filter: mood === e.value ? 'grayscale(0%)' : 'grayscale(100%)'
                      }}
                      className="text-2xl cursor-pointer"
                    >
                      {e.icon}
                    </motion.span>
                    <span className={`text-[8px] font-bold uppercase tracking-tighter transition-all ${mood === e.value ? 'text-purple-400 opacity-100' : 'opacity-0'}`}>
                      {e.label}
                    </span>
                  </button>
                ))}
              </div>
            </div>

            {/* Sleep Moon Arc */}
            <div className="space-y-4">
              <div className="flex justify-between items-center">
                <label className="text-xs font-bold uppercase tracking-widest text-slate-400">Rest Duration</label>
                <span className="text-sm font-black text-purple-300 font-mono">{sleep}h</span>
              </div>
              <div className="relative pt-4 px-2">
                <input 
                  type="range" min="0" max="12" step="0.5" value={sleep}
                  onChange={(e) => setSleep(parseFloat(e.target.value))}
                  className="w-full h-1 bg-purple-500/10 rounded-lg appearance-none cursor-pointer accent-purple-400"
                />
                <div className="flex justify-between mt-2 text-[9px] font-bold text-slate-600 uppercase">
                  <span>New Moon</span>
                  <Moon className="w-3 h-3 text-purple-400/40" />
                  <span>Full Cycle</span>
                </div>
              </div>
            </div>

            {/* Stress thermometer */}
            <div className="flex gap-8 items-center">
              <div className="flex-1 space-y-4">
                <label className="text-xs font-bold uppercase tracking-widest text-slate-400">Stress Intensity</label>
                <p className="text-[10px] text-slate-600 uppercase font-medium leading-relaxed italic">
                  Take a deep breath. Focus on your physical tension.
                </p>
              </div>
              <div className="relative h-32 w-4 bg-white/5 rounded-full overflow-hidden border border-white/5">
                {/* Inverted Thermometer: Red (high stress) at bottom, Green (low stress) at top */}
                {/* We map stress 0-10 to height. Stress 10 = Height 100% */}
                <motion.div 
                  animate={{ height: `${stress * 10}%` }}
                  className="absolute bottom-0 w-full bg-gradient-to-t from-rose-500 via-amber-400 to-green-400"
                />
                <input 
                  type="range" min="0" max="10" value={stress} 
                  onChange={(e) => setStress(parseInt(e.target.value))}
                  className="absolute inset-0 w-full h-full opacity-0 cursor-pointer -rotate-180 [writing-mode:vertical-lr]"
                />
              </div>
            </div>

            {/* Social Connection */}
            <div className="space-y-4">
              <label className="text-xs font-bold uppercase tracking-widest text-slate-400">Human Connection</label>
              <div className="grid grid-cols-2 gap-3">
                {socialLevels.map(s => (
                  <button
                    key={s.id}
                    onClick={() => setSocial(s.id)}
                    className={`flex items-center gap-3 p-3 rounded-xl border text-[10px] font-bold uppercase tracking-tight transition-all ${
                      social === s.id 
                      ? 'bg-purple-500/20 border-purple-500/40 text-purple-200' 
                      : 'bg-white/5 border-white/5 text-slate-500 hover:border-white/20'
                    }`}
                  >
                    {s.icon}
                    {s.label}
                  </button>
                ))}
              </div>
            </div>

            <button
              onClick={handleCheckIn}
              disabled={step > 0}
              className={`w-full py-4 rounded-xl font-black uppercase tracking-[0.2em] text-xs transition-all shadow-lg ${
                step > 0 
                ? 'bg-white/5 text-slate-500' 
                : 'bg-gradient-to-r from-purple-500 to-indigo-600 text-white hover:shadow-purple-500/20'
              }`}
            >
              Encrypt & Check In
            </button>

            <p className="text-center text-[9px] text-slate-600 font-bold uppercase tracking-widest">
              🔐 Not even we can read your data. Private by default.
            </p>
          </GlassCard>
        </div>

        {/* Right Column: Analytics & Status */}
        <div className="space-y-8">
           {/* Weekly Chart */}
           <GlassCard className="!p-4 overflow-hidden">
            <div className="flex items-center justify-between mb-6">
              <div className="flex items-center gap-2">
                <Calendar className="w-4 h-4 text-purple-400" />
                <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Emotional Patterns</span>
              </div>
              <span className="text-[9px] font-bold text-slate-600 uppercase">Last 7 Cycles</span>
            </div>
            
            <div className="h-40 w-full">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={history}>
                  <XAxis 
                    dataKey="day" 
                    axisLine={false} 
                    tickLine={false} 
                    tick={{fill: '#475569', fontSize: 10, fontWeight: 'bold'}}
                  />
                  <Tooltip 
                    contentStyle={{ backgroundColor: '#0f172a', border: 'none', borderRadius: '12px', fontSize: '12px' }}
                    cursor={{fill: 'rgba(255,255,255,0.05)'}}
                  />
                  <Bar dataKey="score" radius={[4, 4, 0, 0]}>
                    {history.map((entry, index) => (
                      <Cell key={index} fill={entry.score > 3 ? '#A78BFA' : '#4F46E5'} fillOpacity={0.6} />
                    ))}
                  </Bar>
                </BarChart>
              </ResponsiveContainer>
            </div>
          </GlassCard>

          {/* Encryption Preview */}
          {step === 0 && !riskData && (
            <div className="space-y-4">
              <div className="flex items-center gap-2 px-2">
                <Zap className="w-4 h-4 text-amber-400" />
                <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Homomorphic Signal</span>
              </div>
              <div className="space-y-2">
                <DataStream label="Mood Metric" value={mood} />
                <DataStream label="Rest Phase" value={`${sleep}h`} />
                <DataStream label="Stress Vector" value={stress} />
              </div>
            </div>
          )}

          {/* FHE Process Animation */}
          {step > 0 && step < 4 && (
            <div className="py-10 space-y-8">
               <MindStepIndicator currentStep={step} stepIndex={1} text="Blinding biological signals..." />
               <MindStepIndicator currentStep={step} stepIndex={2} text="Processing in the encrypted domain..." />
               <MindStepIndicator currentStep={step} stepIndex={3} text="Validating cryptographic proof..." />
            </div>
          )}

          {/* Results Analysis */}
          <AnimatePresence>
            {step === 4 && riskData && (
              <motion.div
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                className="space-y-6"
              >
                <GlassCard glowColor="secondary" className="space-y-4 text-center">
                  <div className="flex flex-col items-center gap-2">
                    <span className="text-[10px] font-black uppercase tracking-[0.2em] text-slate-500">Inference Result</span>
                    <h3 className={`text-2xl font-black italic uppercase tracking-tighter ${riskData.color}`}>
                      {riskData.level}
                    </h3>
                  </div>
                  
                  <div className="p-4 rounded-xl bg-purple-500/5 border border-purple-500/10 flex gap-4 text-left">
                    <div className="shrink-0 pt-1">
                      <MessageCircleHeart className="w-5 h-5 text-purple-400" />
                    </div>
                    <div>
                      <span className="text-[9px] font-bold text-slate-500 uppercase tracking-widest mb-1 block">Supportive Intelligence</span>
                      <p className="text-xs text-slate-300 leading-relaxed italic">
                        "{riskData.message}"
                      </p>
                    </div>
                  </div>
                </GlassCard>

                {/* AI Advisor Section */}
                {mindScore !== null && (
                  <AIInsightCard 
                    module="mind"
                    score={mindScore}
                    insights={insights.mind}
                    isLoading={aiLoading}
                    error={aiError}
                    onRefresh={() => getInsights('mind', mood * 20, mindScore, social)}
                  />
                )}
                
                <button 
                  onClick={() => setStep(0)}
                  className="w-full text-center text-[10px] font-bold uppercase text-slate-500 hover:text-white transition-colors"
                >
                  Return to Sanctuary
                </button>
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </div>
    </div>
  );
};

const MindStepIndicator = ({ currentStep, stepIndex, text }) => {
  const isDone = currentStep > stepIndex;
  const isActive = currentStep === stepIndex;

  return (
    <div className="flex items-center gap-4">
      <div className={`w-8 h-8 rounded-full flex items-center justify-center border transition-all ${
        isDone ? 'bg-purple-500/20 border-purple-500/40 text-purple-400' : 
        isActive ? 'bg-purple-500/40 border-purple-400 animate-pulse text-white' : 
        'bg-white/5 border-white/5 opacity-20'
      }`}>
        {isDone ? <CheckCircle2 className="w-5 h-5" /> : 
         isActive ? <Loader2 className="w-5 h-5 animate-spin" /> : 
         <div className="w-2 h-2 rounded-full bg-slate-700" />}
      </div>
      <span className={`text-[10px] uppercase font-bold tracking-widest transition-all ${
        isDone ? 'text-purple-300' : 
        isActive ? 'text-white' : 
        'text-slate-700'
      }`}>
        {text}
      </span>
    </div>
  );
};

export default MindPage;
