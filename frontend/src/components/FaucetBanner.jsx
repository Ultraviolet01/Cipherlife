import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ChevronRight, X, AlertTriangle } from 'lucide-react';
import { useWallet } from '../context/WalletContext';

const FaucetBanner = () => {
  const { showFaucetBanner, setShowFaucetBanner } = useWallet();

  return (
    <AnimatePresence>
      {showFaucetBanner && (
        <motion.div
          initial={{ height: 0, opacity: 0 }}
          animate={{ height: 'auto', opacity: 1 }}
          exit={{ height: 0, opacity: 0 }}
          className="bg-amber-500 text-amber-950 px-6 py-2 flex items-center justify-between overflow-hidden relative"
        >
          <div className="flex items-center gap-4 flex-1 justify-center">
            <AlertTriangle className="w-4 h-4 animate-pulse" />
            <p className="text-[11px] font-black uppercase tracking-wider">
              You need Sepolia ETH to submit encrypted data on-chain.
            </p>
            <a 
              href="https://sepoliafaucet.com" 
              target="_blank" 
              rel="noopener noreferrer"
              className="flex items-center gap-1.5 px-3 py-1 bg-amber-950 text-amber-500 rounded-full text-[9px] font-black uppercase tracking-widest hover:bg-black transition-colors ml-4"
            >
              Get free test ETH <ChevronRight className="w-3 h-3" />
            </a>
          </div>
          
          <button 
            onClick={() => setShowFaucetBanner(false)}
            className="p-1 hover:bg-amber-600 rounded-lg transition-colors ml-4"
          >
            <X className="w-4 h-4" />
          </button>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default FaucetBanner;
