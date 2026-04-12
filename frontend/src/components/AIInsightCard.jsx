import React from 'react';
import { motion } from 'framer-motion';
import { Sparkles, Activity, AlertCircle, RefreshCw } from 'lucide-react';
import ReactMarkdown from 'react-markdown';
import GlassCard from './GlassCard';

const AIInsightCard = ({ insights, isLoading, module = 'combined', score, error, onRefresh }) => {
  const getTheme = () => {
    switch (module.toLowerCase()) {
      case 'health': return { color: 'text-cipher-primary', border: 'border-cipher-primary/30', bg: 'bg-cipher-primary/10', shadow: 'shadow-cipher-primary/10' };
      case 'mind': return { color: 'text-cipher-secondary', border: 'border-cipher-secondary/30', bg: 'bg-cipher-secondary/10', shadow: 'shadow-cipher-secondary/10' };
      case 'finance': return { color: 'text-amber-400', border: 'border-amber-400/30', bg: 'bg-amber-400/10', shadow: 'shadow-amber-400/10' };
      default: return { color: 'text-white', border: 'border-white/20', bg: 'bg-gradient-to-r from-cipher-primary/5 via-white/5 to-cipher-secondary/5', shadow: 'shadow-white/5' };
    }
  };

  const theme = getTheme();

  return (
    <GlassCard 
      className={`relative border-t-2 ${theme.border} ${theme.shadow} overflow-hidden transition-all duration-500`}
    >
      {/* Header */}
      <div className="flex items-center justify-between mb-6 pb-4 border-b border-white/5">
        <div className="flex items-center gap-3">
          <div className={`p-2 rounded-lg ${theme.bg}`}>
            <Sparkles className={`w-4 h-4 ${theme.color}`} />
          </div>
          <div>
            <h3 className="text-xs font-black uppercase tracking-[0.2em] text-white">AI Wellness Advisor</h3>
            <p className="text-[9px] text-slate-500 font-bold uppercase tracking-widest mt-0.5">Privacy-First Strategic Analysis</p>
          </div>
        </div>
        
        <div className="flex items-center gap-2">
          {score !== undefined && (
            <div className={`px-3 py-1 rounded-full ${theme.bg} border ${theme.border} text-[10px] font-black uppercase`}>
              <span className={theme.color}>{score}</span>/100
            </div>
          )}
        </div>
      </div>

      {/* Body / Loading / Error */}
      <div className="min-h-[120px]">
        {isLoading ? (
          <div className="space-y-4 py-2">
            <ShimmerLine width="w-full" delay={0} />
            <ShimmerLine width="w-4/5" delay={0.2} />
            <ShimmerLine width="w-5/6" delay={0.4} />
            <div className="pt-4 flex items-center gap-2">
              <RefreshCw className="w-3 h-3 text-slate-700 animate-spin" />
              <span className="text-[10px] text-slate-600 font-bold uppercase tracking-widest">Analyzing your encrypted results...</span>
            </div>
          </div>
        ) : error ? (
          <div className="flex flex-col items-center justify-center py-6 text-center space-y-3">
            <AlertCircle className="w-8 h-8 text-rose-500/50" />
            <p className="text-[10px] text-rose-500/80 font-black uppercase tracking-widest leading-relaxed">
              Strategic Advisor Offline: <br/> {error}
            </p>
            {onRefresh && (
              <button 
                onClick={onRefresh}
                className="px-4 py-1.5 rounded-full bg-white/5 border border-white/10 text-[9px] font-bold uppercase hover:bg-white/10 transition-all"
              >
                Retry Analysis
              </button>
            )}
          </div>
        ) : (
          <motion.div 
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            className="prose prose-invert prose-xs max-w-none text-slate-300 leading-relaxed font-medium"
          >
            <ReactMarkdown
              components={{
                p: ({node, ...props}) => <p className="mb-4 text-[11px]" {...props} />,
                li: ({node, ...props}) => <li className="mb-2 text-[11px]" {...props} />,
                strong: ({node, ...props}) => <strong className={`font-black uppercase tracking-wider ${theme.color}`} {...props} />,
                h1: ({node, ...props}) => <h1 className="text-sm font-black uppercase mb-4" {...props} />,
                h2: ({node, ...props}) => <h2 className="text-xs font-black uppercase mb-3" {...props} />,
                h3: ({node, ...props}) => <h3 className="text-[11px] font-black uppercase mb-2" {...props} />,
              }}
            >
              {insights || "Strategic advisor currently processing baseline metrics..."}
            </ReactMarkdown>
          </motion.div>
        )}
      </div>

      {/* Footer / Disclaimer */}
      {!error && (
        <div className="mt-8 pt-6 border-t border-white/5">
          <div className="flex gap-3 p-4 rounded-xl bg-black/20 border-l-2 border-cipher-warning/40">
             <AlertCircle className="w-4 h-4 text-cipher-warning/60 shrink-0 mt-0.5" />
             <p className="text-[10px] text-slate-500 italic leading-relaxed">
               Important: My recommendations are AI-generated for wellness awareness only. Always consult a qualified medical, mental health, or financial professional for specific concerns or treatments.
             </p>
          </div>
          
          {onRefresh && !isLoading && (
            <button 
              onClick={onRefresh}
              className="absolute bottom-4 right-4 p-2 rounded-lg bg-white/5 hover:bg-white/10 transition-colors group"
            >
              <RefreshCw className="w-3 h-3 text-slate-600 group-hover:text-white transition-colors" />
            </button>
          )}
        </div>
      )}
    </GlassCard>
  );
};

const ShimmerLine = ({ width, delay }) => (
  <div className={`h-2 ${width} bg-white/5 rounded-full overflow-hidden relative`}>
    <motion.div
      initial={{ x: '-100%' }}
      animate={{ x: '100%' }}
      transition={{ repeat: Infinity, duration: 1.5, delay }}
      className="absolute inset-0 bg-gradient-to-r from-transparent via-white/10 to-transparent"
    />
  </div>
);

export default AIInsightCard;
