import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Wallet, LogOut, Loader2, Link, AlertCircle, RefreshCw } from 'lucide-react';
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
      <button 
        onClick={() => window.open('https://metamask.io', '_blank')}
        style={{
          background: 'rgba(255,184,0,0.1)',
          border: '1px solid rgba(255,184,0,0.3)',
          borderRadius: '10px',
          padding: '8px 16px',
          color: '#FFB800',
          fontSize: '13px',
          cursor: 'pointer',
          fontWeight: '600'
        }}
      >
        Install MetaMask
      </button>
    );
  }

  if (!account) {
    return (
      <div className="flex flex-col items-end gap-2">
        <button 
          id="connect-wallet-button"
          onClick={connectWallet}
          disabled={isConnecting}
          style={{
            background: 'rgba(0,212,255,0.1)',
            border: '1px solid rgba(0,212,255,0.4)',
            borderRadius: '12px',
            padding: '10px 20px',
            color: '#00D4FF',
            fontSize: '14px',
            cursor: 'pointer',
            fontWeight: '700',
            display: 'flex',
            alignItems: 'center',
            gap: '10px',
            transition: 'all 0.2s cubic-bezier(0.4, 0, 0.2, 1)'
          }}
          className="hover:bg-cipher-primary/20 hover:scale-[1.02] active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {isConnecting ? <Loader2 className="w-4 h-4 animate-spin" /> : <Wallet className="w-4 h-4" />}
          {isConnecting ? 'Authorizing...' : 'Connect Identity'}
        </button>
        
        {networkError && (
          <div className="flex items-center gap-2 text-[10px] text-rose-500 font-bold uppercase tracking-widest bg-rose-500/5 px-2 py-1 rounded">
            <AlertCircle className="w-3 h-3" />
            {networkError}
          </div>
        )}
      </div>
    );
  }

  return (
    <div className="flex items-center gap-4">
      {/* Network Status */}
      <div style={{
        display: 'flex',
        alignItems: 'center',
        gap: '8px',
        background: isSepolia ? 'rgba(0,255,136,0.08)' : 'rgba(255,184,0,0.08)',
        border: isSepolia ? '1px solid rgba(0,255,136,0.2)' : '1px solid rgba(255,184,0,0.2)',
        borderRadius: '10px',
        padding: '8px 14px',
        fontSize: '13px'
      }}>
        <span style={{
          width: '8px', height: '8px',
          borderRadius: '50%',
          background: isSepolia ? '#00FF88' : '#FFB800',
          display: 'inline-block',
          animation: 'pulse-soft 2s infinite'
        }} />
        <span style={{ color: isSepolia ? '#00FF88' : '#FFB800', fontWeight: 'bold' }}>
          {isSepolia ? 'Sepolia' : 'Wrong Network'}
        </span>
        <span style={{ color: 'var(--text-muted)', fontSize: '11px', fontWeight: '500' }}>
          {truncateAddress(account)}
        </span>
      </div>

      {!isSepolia && (
        <button
          onClick={switchToSepolia}
          className="p-2 rounded-lg bg-amber-500/10 border border-amber-500/30 text-amber-500 hover:bg-amber-500/20 transition-all"
          title="Switch to Sepolia"
        >
          <RefreshCw className="w-4 h-4" />
        </button>
      )}

      <button
        onClick={disconnectWallet}
        className="p-2 rounded-lg bg-white/5 border border-white/10 text-slate-500 hover:text-rose-500 hover:bg-rose-500/10 hover:border-rose-500/30 transition-all"
        title="Disconnect"
      >
        <LogOut className="w-4 h-4" />
      </button>
    </div>
  );
};

export default WalletButton;
