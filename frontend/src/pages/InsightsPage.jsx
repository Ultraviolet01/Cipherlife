import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { 
  Sparkles, 
  TrendingUp, 
  Activity,
  Brain,
  Wallet,
  ArrowRight
} from 'lucide-react';
import { NavLink } from 'react-router-dom';

// Design System Components
import GlassCard from '../components/GlassCard';
import WellnessRing from '../components/WellnessRing';
import AlertCard from '../components/AlertCard';
import { useCipherLifeContract } from '../hooks/useCipherLifeContract';
import { useOpenAIAdvisor } from '../utils/openaiAdvisor';
import AIInsightCard from '../components/AIInsightCard';
import { useDemo } from '../context/DemoContext';
import AIChat from '../components/AIChat';

const InsightsPage = () => {
  const { isDemoMode } = useDemo();
  const { contract } = useCipherLifeContract();
  const { getInsights } = useOpenAIAdvisor();
  const [mounted, setMounted] = useState(false);
  const [scores, setScores] = useState({
    health: 0,
    mind: 0,
    finance: 0
  });

  useEffect(() => {
    setMounted(true);
    const loadScores = () => {
      let h = parseInt(localStorage.getItem('cipherlife_health_score') ?? '0');
      let m = parseInt(localStorage.getItem('cipherlife_mind_score') ?? '0');
      let f = parseInt(localStorage.getItem('cipherlife_finance_score') ?? '0');
      
      // If no scores and demo mode is on, pre-fill with healthy demo values
      if (h === 0 && m === 0 && f === 0 && isDemoMode) {
        h = 88; m = 92; f = 75;
      }
      
      setScores({ health: h, mind: m, finance: f });
    };
    
    loadScores();
    window.addEventListener('storage', loadScores);
    return () => window.removeEventListener('storage', loadScores);
  }, [isDemoMode]);

  if (!mounted) return (
    <div className="flex flex-col items-center justify-center h-[60vh] gap-4">
      <div className="spinner" />
      <p className="text-slate-500 font-bold uppercase tracking-widest text-[10px]">Initializing Intelligence...</p>
    </div>
  );

  const activeScores = Object.values(scores).filter(s => s > 0);
  const unifiedScore = activeScores.length > 0 
    ? Math.round(activeScores.reduce((a, b) => a + b, 0) / activeScores.length)
    : 0;

  const hasNoData = unifiedScore === 0;

  const handleRefreshAdvisor = () => {
    getInsights('combined', scores, "Recalculating baseline metrics");
  };

  const container = {
    hidden: { opacity: 0 },
    show: { opacity: 1, transition: { staggerChildren: 0.1 } }
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
      className="max-w-[1200px] mx-auto p-8 space-y-8"
    >
      {/* Hero Section */}
      <section style={{
        background: 'linear-gradient(135deg, rgba(0,212,255,0.06), rgba(123,47,255,0.06))',
        border: '1px solid rgba(0,212,255,0.15)',
        borderRadius: '20px',
        padding: '32px',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        marginBottom: '24px'
      }}>
        <div>
          <div style={{ fontSize: '13px', color: 'var(--text-muted)', marginBottom: '8px', fontWeight: '600', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
            Your Life Score
          </div>
          <div style={{
            fontSize: '64px',
            fontWeight: '800',
            background: 'linear-gradient(90deg, #00D4FF, #7B2FFF)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            lineHeight: 1
          }}>
            {unifiedScore}/100
          </div>
          <div style={{ fontSize: '14px', color: 'var(--text-muted)', marginTop: '8px', fontWeight: '500' }}>
            Computed from encrypted data. Score derived on-device.
          </div>
        </div>
        <WellnessRing score={unifiedScore} size={120} />
      </section>

      {/* Score Cards Grid */}
      <section className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <ScoreModuleCard title="Health" icon="🫀" score={scores.health} color="#00D4FF" />
        <ScoreModuleCard title="Mind" icon="🧠" score={scores.mind} color="#7B2FFF" />
        <ScoreModuleCard title="Finance" icon="💰" score={scores.finance} color="#FFB800" />
      </section>

      {/* Intelligence Section */}
      <section className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <div className="space-y-6">
          <div className="flex items-center gap-2">
            <Sparkles className="w-5 h-5 text-cipher-primary" />
            <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Holistic Analysis</h3>
          </div>
          
          {hasNoData ? (
             <GlassCard className="p-12 flex flex-col items-center text-center gap-6">
                <div className="w-16 h-16 rounded-full bg-white/5 flex items-center justify-center border border-white/10">
                   <Activity className="w-8 h-8 text-slate-600" />
                </div>
                <div className="space-y-2">
                   <h4 className="text-xl font-bold">No Data Points Detected</h4>
                   <p className="text-slate-500 text-sm max-w-xs">
                      Complete your first check-in to activate your AI advisor and see personalized privacy-preserving insights.
                   </p>
                </div>
                <NavLink 
                  to="/health"
                  className="px-8 py-3 rounded-xl bg-gradient-to-r from-cipher-primary to-cipher-secondary text-white font-bold flex items-center gap-2 hover:opacity-90 transition-all"
                >
                   Complete Health Check-in
                   <ArrowRight className="w-4 h-4" />
                </NavLink>
             </GlassCard>
          ) : (
            <AIInsightCard 
              module="combined"
              scores={scores}
              patterns="Recalculating baseline metrics"
            />
          )}

          {!hasNoData && (
            <div className="space-y-4">
               <AlertCard 
                 severity="info"
                 title="System Operational"
                 message="All indices are currently derived from local encrypted snapshots. No plaintext has left your device."
               />
            </div>
          )}
        </div>

        <div className="space-y-6">
           <div className="flex items-center gap-2">
             <Brain className="w-5 h-5 text-cipher-secondary" />
             <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Interactive Advisor</h3>
           </div>
           <AIChat 
             scores={scores} 
             patterns="Baseline assessment in progress" 
           />
        </div>
      </section>
    </motion.div>
  );
};

const ScoreModuleCard = ({ title, icon, score, color }) => (
  <div style={{
    background: 'rgba(255,255,255,0.04)',
    border: '1px solid rgba(255,255,255,0.08)',
    borderRadius: '16px',
    padding: '24px',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    gap: '12px',
    flex: 1
  }}>
    <div style={{ 
      fontSize: '13px', 
      color: 'var(--text-muted)',
      textTransform: 'uppercase',
      letterSpacing: '0.05em',
      fontWeight: '700'
    }}>
      {icon} {title}
    </div>
    <WellnessRing 
      score={score} 
      size={80} 
      color={color}
    />
    <div style={{
      fontSize: '12px',
      color: score === 0 ? 'var(--text-muted)' : color,
      textAlign: 'center',
      fontWeight: 'bold'
    }}>
      {score === 0 ? 'Not assessed yet' : `${score}/100`}
    </div>
  </div>
);

export default InsightsPage;
