import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ShieldCheck, Info, X, CheckCircle2, AlertTriangle, ArrowRight } from 'lucide-react';
import { useNavigate } from 'react-router-dom';

const DisclaimerBanner = () => {
  const [isVisible, setIsVisible] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const onboarded = localStorage.getItem('cipherlife_onboarded');
    if (!onboarded) {
      setTimeout(() => setIsVisible(true), 1000);
    }
  }, []);

  const handleAccept = () => {
    localStorage.setItem('cipherlife_onboarded', 'true');
    setIsVisible(false);
  };

  const handleLearnMore = () => {
    setIsVisible(false);
    navigate('/vault');
  };

  return (
    <AnimatePresence>
      {isVisible && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center p-6 bg-cipher-base/80 backdrop-blur-md">
          <motion.div
            initial={{ opacity: 0, scale: 0.9, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.9, y: 20 }}
            className="max-w-xl w-full glass rounded-3xl border-white/10 shadow-[0_0_50px_rgba(0,212,255,0.1)] overflow-hidden"
          >
            <div className="relative p-8 space-y-8">
              {/* Header */}
              <div className="flex items-center gap-4">
                <div className="w-12 h-12 bg-cipher-primary/10 rounded-2xl flex items-center justify-center border border-cipher-primary/20">
                  <ShieldCheck className="w-6 h-6 text-cipher-primary" />
                </div>
                <div>
                  <h2 className="text-2xl font-black italic uppercase tracking-tighter text-white font-mono">Before You Begin</h2>
                  <p className="text-[10px] text-slate-500 font-bold uppercase tracking-widest">Privacy Protocol 1.0.4</p>
                </div>
              </div>

              <div className="space-y-4">
                 <p className="text-xs text-slate-400 leading-relaxed font-medium">
                    CipherLife provides AI-generated wellness insights based on <span className="text-cipher-primary">anonymized scores</span> — your raw personal data never leaves your device and is never stored on a server.
                 </p>

                 <div className="grid grid-cols-1 md:grid-cols-2 gap-6 pt-4 border-t border-white/5">
                    {/* Does NOT */}
                    <div className="space-y-3">
                       <h4 className="text-[10px] font-black uppercase tracking-widest text-rose-500 flex items-center gap-2">
                          <AlertTriangle className="w-3 h-3" /> This app DOES NOT:
                       </h4>
                       <ul className="space-y-2">
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-rose-500/50">✗</span> Diagnose conditions
                          </li>
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-rose-500/50">✗</span> Replace medical advice
                          </li>
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-rose-500/50">✗</span> Transmit personal data
                          </li>
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-rose-500/50">✗</span> Provide certified planning
                          </li>
                       </ul>
                    </div>

                    {/* DOES */}
                    <div className="space-y-3">
                       <h4 className="text-[10px] font-black uppercase tracking-widest text-cipher-success flex items-center gap-2">
                          <CheckCircle2 className="w-3 h-3" /> This app DOES:
                       </h4>
                       <ul className="space-y-2">
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-cipher-success/50">✓</span> Encrypt data locally
                          </li>
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-cipher-success/50">✓</span> General awareness
                          </li>
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-cipher-success/50">✓</span> Privacy at math-scale
                          </li>
                          <li className="text-[10px] text-slate-500 font-semibold flex items-center gap-2">
                             <span className="text-cipher-success/50">✓</span> Suggest specialists
                          </li>
                       </ul>
                    </div>
                 </div>
              </div>

              <p className="text-[10px] text-slate-600 italic text-center px-4 leading-relaxed font-bold uppercase tracking-tighter">
                Always consult qualified professionals for health, mental health, and financial decisions.
              </p>

              {/* Actions */}
              <div className="flex flex-col gap-3">
                <button 
                  onClick={handleAccept}
                  className="w-full py-4 rounded-xl bg-cipher-primary text-black font-black uppercase tracking-widest text-xs hover:bg-white transition-all shadow-lg flex items-center justify-center gap-2 group"
                >
                  I Understand, Continue
                  <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                </button>
                <button 
                  onClick={handleLearnMore}
                  className="w-full py-2 text-[10px] font-bold text-slate-500 hover:text-white transition-colors flex items-center justify-center gap-2"
                >
                  <Info className="w-3 h-3" />
                  Learn How Encryption Works
                </button>
              </div>

              {/* Visual Decorative */}
              <div className="absolute top-0 right-0 w-64 h-64 bg-cipher-primary/5 blur-[120px] rounded-full -mr-32 -mt-32 pointer-events-none" />
            </div>
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  );
};

export default DisclaimerBanner;
