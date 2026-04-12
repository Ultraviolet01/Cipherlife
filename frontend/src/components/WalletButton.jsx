import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Wallet, LogOut, Loader2, Link, AlertCircle, RefreshCw, ExternalLink } from 'lucide-react';
import { useWallet } from '../context/WalletContext';

const WalletButton = () => {
  const { 
    account, 
    isConnecting, 
    chainId, 
    connectWallet, 
    disconnectWallet, 
    switchToSepolia, 
    networkError 
  } = useWallet();

  const truncateAddress = (addr) => `${addr.substring(0, 6)}...${addr.substring(addr.length - 4)}`;
  
  const isSepolia = chainId === 11155111;

  if (!window.ethereum && !account) {
    return (
      <a 
        href="https://metamask.io" 
        target="_blank" 
        rel="noopener noreferrer"
        className="px-6 py-2 rounded-xl bg-orange-500/10 border border-orange-500/30 text-orange-500 hover:bg-orange-500/20 transition-all font-black uppercase text-[10px] tracking-widest flex items-center gap-2"
      >
        <AlertCircle className="w-3.5 h-3.5" />
        Install MetaMask
      </a>
    );
  }

  return (
    <div className="flex items-center gap-3">
      {networkError && (
        <span className="text-[9px] font-black uppercase text-rose-500 animate-pulse bg-rose-500/5 px-3 py-1 rounded-full border border-rose-500/10">
          {networkError}
        </span>
      )}

      <div className="relative group">
        <AnimatePresence mode="wait">
          {!account ? (
            <motion.button
              key="connect"
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              exit={{ opacity: 0, scale: 0.95 }}
              onClick={connectWallet}
              disabled={isConnecting}
              className="px-6 py-2 rounded-xl bg-cipher-primary/10 border border-cipher-primary/30 text-cipher-primary hover:bg-cipher-primary/20 transition-all font-black uppercase text-[10px] tracking-widest flex items-center gap-2 shadow-[0_0_15px_rgba(0,212,255,0.1)] hover:shadow-[0_0_25px_rgba(0,212,255,0.3)]"
            >
              {isConnecting ? (
                <Loader2 className="w-3.5 h-3.5 animate-spin" />
              ) : (
                <Wallet className="w-3.5 h-3.5" />
              )}
              {isConnecting ? 'Linking...' : 'Connect Identity'}
            </motion.button>
          ) : (
            <motion.div
              key="connected"
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              className="flex items-center gap-2"
            >
              <div className="flex flex-col items-end mr-2">
                <span className="text-[8px] font-black text-slate-500 uppercase tracking-widest">Active Node</span>
                <span className="text-[10px] font-mono text-cipher-primary font-bold">{truncateAddress(account)}</span>
              </div>
              
              <div className="flex items-center gap-2 relative">
                {!isSepolia && (
                  <button
                    onClick={switchToSepolia}
                    className="flex items-center gap-2 px-3 py-2 rounded-xl bg-amber-500/10 border border-amber-500/30 text-amber-500 text-[9px] font-black uppercase tracking-wider hover:bg-amber-500/20 transition-all"
                  >
                    <RefreshCw className="w-3 h-3" />
                    Switch to Sepolia
                  </button>
                )}
                
                <button
                  onClick={disconnectWallet}
                  className="w-10 h-10 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center hover:bg-rose-500/10 hover:border-rose-500/30 transition-all text-slate-400 hover:text-rose-500 group"
                >
                  <Link className="w-4 h-4 group-hover:hidden" />
                  <LogOut className="w-4 h-4 hidden group-hover:block" />
                </button>
              </div>
            </motion.div>
          )}
        </AnimatePresence>

        {account && (
          <div className="absolute top-full right-0 mt-2 pointer-events-none">
             <div className={`flex items-center gap-1.5 px-3 py-1 rounded-full border backdrop-blur-md translate-y-2 opacity-0 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300 ${isSepolia ? 'bg-cipher-success/5 border-cipher-success/20' : 'bg-amber-500/5 border-amber-500/20'}`}>
                <div className={`w-1.5 h-1.5 rounded-full animate-pulse shadow-md ${isSepolia ? 'bg-cipher-success shadow-cipher-success/50' : 'bg-amber-500 shadow-amber-500/50'}`} />
                <span className={`text-[8px] font-black uppercase tracking-widest ${isSepolia ? 'text-cipher-success' : 'text-amber-500'}`}>
                  {isSepolia ? 'Sepolia' : 'Wrong Network'}
                </span>
             </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default WalletButton;
