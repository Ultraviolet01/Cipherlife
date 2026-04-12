import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Lock, Shield, Loader2 } from 'lucide-react';
import { useFHE } from '../hooks/useFHE';

const FHEOverlay = () => {
  const { fheReady, loadingMsg, error } = useFHE();

  // We no longer block the UI during initialization as requested
  // However, we still show a small status toast in the corner
  
  return (
    <AnimatePresence>
      {!fheReady && (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: 20 }}
          className="fixed bottom-6 right-6 z-[120] bg-cipher-base/90 backdrop-blur-lg border border-white/10 p-4 rounded-2xl shadow-2xl flex items-center gap-4 max-w-xs"
        >
          <div className="relative w-10 h-10 flex-shrink-0">
            <motion.div 
              animate={{ scale: [1, 1.1, 1], opacity: [0.3, 0.6, 0.3] }}
              transition={{ repeat: Infinity, duration: 2 }}
              className="absolute inset-0 bg-cipher-primary/20 rounded-full blur-lg"
            />
            <div className="relative flex items-center justify-center h-full border border-cipher-primary/30 rounded-xl bg-cipher-base">
              {error ? (
                <Shield className="w-5 h-5 text-rose-500" />
              ) : (
                <Lock className="w-5 h-5 text-cipher-primary" />
              )}
            </div>
          </div>

          <div className="text-left">
            <h3 className="text-[10px] font-black uppercase tracking-tighter text-white">
              {error ? 'Privacy Engine Caution' : 'Privacy Engine Active'}
            </h3>
            <div className="flex items-center gap-2 mt-0.5">
              {!fheReady && !error && <Loader2 className="w-3 h-3 text-cipher-primary animate-spin" />}
              <span className={`text-[9px] font-bold uppercase tracking-widest ${error ? 'text-rose-500' : 'text-slate-500'}`}>
                 {error ? 'Connect Wallet for FHE' : loadingMsg || 'Initializing...'}
              </span>
            </div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default FHEOverlay;
