import React from 'react';
import { motion } from 'framer-motion';
import { Terminal, Database } from 'lucide-react';

const PrivacyProofPanel = ({ hashes = [] }) => {
  return (
    <div className="flex flex-col gap-4">
      <div className="flex justify-between items-center px-1">
        <div className="flex items-center gap-2">
          <Terminal className="w-4 h-4 text-slate-500" />
          <span className="text-[10px] font-bold text-slate-500 uppercase tracking-widest">Transparency Log</span>
        </div>
        <div className="flex items-center gap-1.5 px-2 py-0.5 rounded bg-cipher-success/10 border border-cipher-success/20">
          <div className="w-1.5 h-1.5 rounded-full bg-cipher-success animate-pulse" />
          <span className="text-[9px] font-bold text-cipher-success uppercase">Verifying FHE Proofs</span>
        </div>
      </div>
      
      <div className="bg-cipher-900/50 border border-white/5 rounded-xl p-4 font-mono">
        <div className="space-y-3">
          {hashes.map((h, i) => (
            <motion.div 
              key={i}
              initial={{ opacity: 0, x: -10 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: i * 0.1 }}
              className="flex items-start gap-3"
            >
              <Database className="w-3 h-3 text-cipher-secondary mt-1 shrink-0" />
              <div className="flex flex-col gap-1 overflow-hidden">
                <span className="text-[10px] text-slate-600">CIPHERTEXT_ID_0{i+1}:</span>
                <span className="text-[11px] text-cipher-primary truncate selection:bg-cipher-primary/30">
                  {h}
                </span>
              </div>
            </motion.div>
          ))}
          {hashes.length === 0 && (
            <div className="flex flex-col items-center justify-center py-6 gap-2 opacity-30">
              <Terminal className="w-6 h-6" />
              <span className="text-[10px] uppercase font-bold text-center">Awaiting Data Streams</span>
            </div>
          )}
        </div>
        <div className="mt-4 pt-4 border-t border-white/5 flex justify-between items-center">
          <span className="text-[9px] text-slate-500 uppercase">ZK-Proof Status: Verified</span>
          <span className="text-[9px] text-slate-500 font-bold">128-bit Security</span>
        </div>
      </div>
    </div>
  );
};

export default PrivacyProofPanel;
