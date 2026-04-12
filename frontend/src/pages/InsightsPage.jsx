import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { 
  Sparkles, 
  TrendingUp, 
  TrendingDown, 
  MessageCircle, 
  Send,
  Zap,
  Activity,
  Brain,
  Wallet,
  Loader2,
  RefreshCw
} from 'lucide-react';
import { 
  LineChart, 
  Line, 
  XAxis, 
  YAxis, 
  Tooltip, 
  ResponsiveContainer 
} from 'recharts';

// Design System Components
import GlassCard from '../components/GlassCard';
import WellnessRing from '../components/WellnessRing';
import AlertCard from '../components/AlertCard';

import { useCipherLifeContract } from '../hooks/useCipherLifeContract';
import { useOpenAIAdvisor } from '../hooks/useOpenAIAdvisor';
import AIInsightCard from '../components/AIInsightCard';
import AIChat from '../components/AIChat';

const InsightsPage = () => {
  const { contract } = useCipherLifeContract();
  const [scores, setScores] = useState({
    health: 0,
    mind: 0,
    finance: 0
  });

  const [isRefreshing, setIsRefreshing] = useState(false);

  useEffect(() => {
    const loadScores = () => {
      const h = parseInt(localStorage.getItem('cipherlife_score_Health')) || 0;
      const m = parseInt(localStorage.getItem('cipherlife_score_Mind')) || 0;
      const f = parseInt(localStorage.getItem('cipherlife_score_Finance')) || 0;
      setScores({ health: h, mind: m, finance: f });
    };
    
    loadScores();
    window.addEventListener('storage', loadScores);
    return () => window.removeEventListener('storage', loadScores);
  }, []);

  const handleRefresh = async () => {
    if (!contract) return;
    setIsRefreshing(true);
    try {
      const onChainScore = await contract.getInsightScore();
      // If we don't have individual scores, we can at least show the unified one
      // In a real app we might fetch all 3 individual scores from events or a mapping
      console.log("On-chain unified score:", onChainScore);
    } catch (err) {
      console.error("Failed to sync with chain:", err);
    } finally {
      setIsRefreshing(false);
    }
  };

  const unifiedScore = Math.round((scores.health + scores.mind + scores.finance) / (Object.values(scores).filter(s => s > 0).length || 1));

  // Mock Trend Histories
  const history = [
    { day: 'M', h: 65, m: 45, f: 80 },
    { day: 'T', h: 68, m: 42, f: 78 },
    { day: 'W', h: 70, m: 40, f: 76 },
    { day: 'T', h: 71, m: 39, f: 75 },
    { day: 'F', h: 72, m: 38, f: 75 },
  ];

  const patterns = [];
  if (scores.mind < 40 && scores.finance > 70) {
    patterns.push({
      severity: 'warning',
      title: 'Financial-Cognitive Tension',
      message: 'Financial stress may be affecting your mental wellbeing. Consider a budget review to reduce cognitive load.'
    });
  }
  if (scores.health > 60 && scores.finance < 30) {
    patterns.push({
      severity: 'critical',
      title: 'Medical Buffer Risk',
      message: 'Health risks detected with low financial buffer. Prioritize building an emergency fund for potential medical expenses.'
    });
  }
  if (scores.health > 70 && scores.mind > 70 && scores.finance > 70) {
    patterns.push({
      severity: 'critical',
      title: 'Systemic Overload',
      message: '⚠️ Critical: All life domains showing stress. Prioritize rest and seek professional support immediately.'
    });
  }
  if (scores.health < 30 && scores.mind < 30 && scores.finance < 30) {
    patterns.push({
      severity: 'info',
      title: 'Harmonized Balance',
      message: '✨ Excellent balance across all domains. Your current lifestyle is highly sustainable.'
    });
  }

  const { getInsights, isLoading: aiLoading, insights: aiInsights, error: aiError } = useOpenAIAdvisor();

  const handleRefreshAdvisor = () => {
    const detectedLabels = patterns.map(p => p.title).join(', ') || 'Normal balance';
    getInsights('combined', scores.health, scores.mind, scores.finance, detectedLabels);
  };

  const container = {
    hidden: { opacity: 0 },
    show: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1
      }
    }
  };

  const item = {
    hidden: { y: 20, opacity: 0 },
    show: { y: 0, opacity: 1 }
  };

  return (
    <motion.div 
      variants={container}
      initial="hidden"
      animate="show"
      className="max-w-6xl mx-auto space-y-12 pb-20"
    >
      {/* Hero Section */}
      <section className="text-center space-y-6">
        <motion.div variants={item} className="inline-flex items-center gap-3 px-4 py-2 rounded-full bg-cipher-primary/5 border border-cipher-primary/20 text-cipher-primary text-xs font-bold uppercase tracking-widest mb-4">
           <Zap className="w-3 h-3" />
           Holistic Life Computation Active
        </motion.div>
        
        <motion.div variants={item} className="flex justify-center flex-col items-center">
          <WellnessRing score={unifiedScore} size={220} />
          <div className="mt-6">
             <h2 className="text-4xl font-black gradient-text tracking-tighter uppercase italic">Your Life Score</h2>
             <p className="text-slate-500 text-[10px] font-bold uppercase tracking-[0.3em] mt-2">
                Computed from encrypted data. Score derived on-device.
             </p>
          </div>
        </motion.div>
      </section>

      {/* Domain Score Row */}
      <section className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <ScoreCard 
          title="Health" 
          score={scores.health} 
          glow="primary" 
          icon={<Activity className="text-cipher-primary" />}
          data={history}
          dataKey="h"
          variants={item}
        />
        <ScoreCard 
          title="Mind" 
          score={scores.mind} 
          glow="secondary" 
          icon={<Brain className="text-cipher-secondary" />}
          data={history}
          dataKey="m"
          variants={item}
        />
        <ScoreCard 
          title="Finance" 
          score={scores.finance} 
          glow="warning" 
          icon={<Wallet className="text-amber-400" />}
          data={history}
          dataKey="f"
          variants={item}
        />
      </section>

      {/* Intelligence Grid */}
      <section className="grid grid-cols-1 lg:grid-cols-2 gap-10">
        
        {/* Holistic AI Analysis */}
        <motion.div variants={item} className="space-y-6">
           <div className="flex items-center gap-2">
              <Sparkles className="w-5 h-5 text-cipher-primary" />
              <h3 className="text-sm font-black uppercase tracking-[0.2em] text-slate-400">Holistic Analysis</h3>
           </div>
           
           <AIInsightCard 
             module="combined"
             score={unifiedScore}
             insights={aiInsights.combined}
             isLoading={aiLoading}
             error={aiError}
             onRefresh={handleRefreshAdvisor}
           />

           <div className="space-y-4">
              <div className="flex items-center gap-2 mt-8">
                <Activity className="w-4 h-4 text-slate-500" />
                <h4 className="text-[10px] font-black uppercase tracking-widest text-slate-500">Cross-Domain Patterns</h4>
              </div>
              {patterns.map((p, i) => (
                <AlertCard 
                  key={i}
                  severity={p.severity}
                  title={p.title}
                  message={p.message}
                />
              ))}
           </div>
        </motion.div>

        {/* Interactive Advisor Chat */}
        <motion.div variants={item} className="space-y-6">
           <AIChat 
             scores={scores} 
             patterns={patterns.map(p => p.title).join(', ')} 
           />
        </motion.div>

      </section>
    </motion.div>
  );
};

const ScoreCard = ({ title, score, glow, icon, data, dataKey, variants }) => (
  <motion.div variants={variants}>
    <GlassCard glowColor={glow} className="relative overflow-hidden group">
       <div className="flex justify-between items-start mb-6">
          <div className="flex flex-col gap-1">
             <span className="text-[10px] font-black uppercase tracking-widest text-slate-500">{title} Index</span>
             <div className="flex items-center gap-2">
                <span className="text-2xl font-black italic">{score}</span>
                <TrendingUp className="w-4 h-4 text-cipher-success" />
             </div>
          </div>
          <div className="p-2 rounded-lg bg-white/5">
             {icon}
          </div>
       </div>

       <div className="h-16 w-full -mb-2 mt-4">
          <ResponsiveContainer width="100%" height="100%">
             <LineChart data={data}>
                <Line 
                  type="monotone" 
                  dataKey={dataKey} 
                  stroke={glow === 'primary' ? '#00D4FF' : glow === 'secondary' ? '#7B2FFF' : '#FFB800'} 
                  strokeWidth={2} 
                  dot={false}
                />
             </LineChart>
          </ResponsiveContainer>
       </div>
       
       <div className="absolute top-0 right-0 p-2 opacity-5">
          <Sparkles className="w-12 h-12" />
       </div>
    </GlassCard>
  </motion.div>
);

export default InsightsPage;
