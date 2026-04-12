import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Lock, Shield, Loader2 } from 'lucide-react';
import { useFHE } from '../hooks/useFHE';

const FHEOverlay = () => {
  const { fheReady, loadingMsg, error } = useFHE();

  return (
    <AnimatePresence>
      {!fheReady && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-[120] bg-cipher-base/95 backdrop-blur-xl flex flex-col items-center justify-center p-6 text-center"
        >
          <div className="max-w-md space-y-8">
            <div className="relative mx-auto w-24 h-24">
              <motion.div 
                animate={{ scale: [1, 1.1, 1], opacity: [0.3, 0.6, 0.3] }}
                transition={{ repeat: Infinity, duration: 2 }}
                className="absolute inset-0 bg-cipher-primary/20 rounded-full blur-2xl"
              />
              <div className="relative flex items-center justify-center h-full border-2 border-cipher-primary/30 rounded-3xl bg-cipher-base shadow-[0_0_30px_rgba(0,212,255,0.2)]">
                <Lock className="w-10 h-10 text-cipher-primary" />
              </div>
            </div>

            <div className="space-y-3">
              <h2 className="text-2xl font-black italic uppercase tracking-tighter text-white">
                {error ? 'Initialization Failed' : 'Security Layer Initializing'}
              </h2>
              <div className="flex items-center justify-center gap-3">
                <Loader2 className={`w-4 h-4 ${error ? 'text-rose-500' : 'text-cipher-primary animate-spin'}`} />
                <span className={`text-xs font-bold uppercase tracking-widest ${error ? 'text-rose-500' : 'text-slate-400'}`}>
                   {loadingMsg || 'Bootstrapping TFHE parameters...'}
                </span>
              </div>
            </div>

            {!error && (
              <div className="space-y-4 pt-6 border-t border-white/5">
                <p className="text-[11px] text-slate-500 leading-relaxed font-bold uppercase tracking-wide">
                  Generating your unique homomorphic encryption keys locally. 
                  <span className="text-cipher-success block mt-1">These keys never leave this device.</span>
                </p>
                
                <div className="h-1.5 w-full bg-white/5 rounded-full overflow-hidden">
                   <motion.div 
                     initial={{ width: "0%" }}
                     animate={{ width: "100%" }}
                     transition={{ duration: 10, ease: "linear" }}
                     className="h-full bg-cipher-primary shadow-[0_0_10px_#00D4FF]"
                   />
                </div>
              </div>
            )}

            {error && (
              <button 
                onClick={() => window.location.reload()}
                className="px-8 py-3 rounded-xl bg-rose-500 text-white font-black uppercase text-xs tracking-widest hover:bg-rose-600 transition-colors"
              >
                Retry Privacy Handshake
              </button>
            )}
          </div>
          
          <div className="absolute bottom-8 flex items-center gap-2 opacity-30">
             <Shield className="w-4 h-4" />
             <span className="text-[10px] font-black uppercase tracking-[0.3em]">End-to-End Mathematic Isolation</span>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default FHEOverlay;
