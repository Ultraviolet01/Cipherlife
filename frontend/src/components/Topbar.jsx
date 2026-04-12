import React from 'react';
import WalletButton from './WalletButton';
import { Shield } from 'lucide-react';
import { motion } from 'framer-motion';

const Topbar = () => {
  return (
    <header className="fixed top-0 left-0 right-0 h-16 bg-cipher-base/80 backdrop-blur-lg border-b border-white/5 z-50 px-6 flex items-center justify-between">
      <div className="flex items-center gap-6">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-lg bg-cipher-primary/10 flex items-center justify-center border border-cipher-primary/20">
            <Shield className="text-cipher-primary w-4 h-4" />
          </div>
          <h1 className="text-xl font-extrabold italic tracking-tighter uppercase bg-clip-text text-transparent bg-gradient-to-r from-white to-slate-500">
            CipherLife
          </h1>
        </div>
        
        <div className="hidden md:flex items-center gap-2 px-3 py-1 rounded-full bg-cipher-success/5 border border-cipher-success/10 pulse-active">
          <div className="w-1.5 h-1.5 rounded-full bg-cipher-success shadow-[0_0_8px_#00FF88]" />
          <span className="text-[10px] font-bold text-cipher-success uppercase tracking-widest">All Data Encrypted</span>
        </div>
      </div>

      <div className="flex items-center gap-6">
        <WalletButton />
      </div>
    </header>
  );
};

export default Topbar;
