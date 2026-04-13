import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useFHE } from '../hooks/useFHE';
import { useWallet } from '../context/WalletContext';

const FHEOverlay = () => {
  const { fheReady, error } = useFHE();
  const { account: walletAddress } = useWallet();

  // Render logic:
  let content = null;

  if (!walletAddress) {
    // State 0: Connect wallet to enable FHE (User didn't specify UI for this, but it's implied)
    // We'll keep it hidden or show something subtle
    return null;
  } else if (walletAddress && !fheReady && !error) {
    // State 1: Initializing (amber, subtle)
    content = (
      <div style={{
        background: 'rgba(255,184,0,0.1)',
        border: '1px solid rgba(255,184,0,0.3)',
        borderRadius: '12px',
        padding: '10px 14px',
        display: 'flex',
        alignItems: 'center',
        gap: '8px',
        fontSize: '12px',
        color: '#FFFFFF'
      }}>
        <div className="spinner-small" style={{ width: '12px', height: '12px', border: '2px solid rgba(255,184,0,0.3)', borderTop: '2px solid #FFB800', borderRadius: '50%', animation: 'spin 1s linear infinite' }} />
        <div>
          <div style={{ color: '#FFB800', fontWeight: 600 }}>
            Initializing Encryption
          </div>
          <div style={{ color: 'rgba(255,184,0,0.7)', fontSize: '10px' }}>
            FHE engine loading...
          </div>
        </div>
      </div>
    );
  } else if (fheReady) {
    // State 2: FHE Ready (green)
    content = (
      <div style={{
        background: 'rgba(0,255,136,0.08)',
        border: '1px solid rgba(0,255,136,0.2)',
        borderRadius: '12px',
        padding: '10px 14px',
        display: 'flex',
        alignItems: 'center',
        gap: '8px',
        fontSize: '12px'
      }}>
        <span style={{ fontSize: '16px' }}>🔐</span>
        <div>
          <div style={{ color: '#00FF88', fontWeight: 600 }}>
            FHE Engine Active
          </div>
          <div style={{ color: 'rgba(0,255,136,0.6)', fontSize: '10px' }}>
            Encryption ready
          </div>
        </div>
      </div>
    );
  } else if (error) {
    // State 3: FHE failed (amber, NOT red)
    content = (
      <div style={{
        background: 'rgba(255,184,0,0.08)',
        border: '1px solid rgba(255,184,0,0.2)',
        borderRadius: '12px',
        padding: '10px 14px',
        fontSize: '12px',
        color: '#FFFFFF'
      }}>
        <div style={{ color: '#FFB800', fontWeight: 600 }}>
          ⚡ Analysis Mode
        </div>
        <div style={{ color: 'rgba(255,184,0,0.6)', fontSize: '10px' }}>
          ML analysis active. On-chain encryption unavailable.
        </div>
      </div>
    );
  }

  return (
    <AnimatePresence>
      {content && (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: 20 }}
          className="fixed bottom-6 right-6 z-[120] backdrop-blur-lg shadow-2xl"
        >
          {content}
        </motion.div>
      )}
      <style>{`
        @keyframes spin {
          0% { transform: rotate(0deg); }
          100% { transform: rotate(360deg); }
        }
      `}</style>
    </AnimatePresence>
  );
};

export default FHEOverlay;

