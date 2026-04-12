import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

const DataStream = ({ label, value }) => {
  const [isEncrypted, setIsEncrypted] = useState(false);
  const [cipher, setCipher] = useState('');

  useEffect(() => {
    // Simulate encryption transition
    const interval = setInterval(() => {
      setIsEncrypted(prev => !prev);
    }, 4000);

    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    if (isEncrypted) {
      setCipher(Math.random().toString(16).substring(2, 10).toUpperCase());
    }
  }, [isEncrypted]);

  return (
    <div className="flex flex-col gap-1 py-1 px-3 rounded-lg hover:bg-white/5 transition-colors">
      <span className="text-[10px] text-slate-500 font-medium uppercase tracking-wider">{label}</span>
      <div className="h-6 relative overflow-hidden flex items-center">
        <AnimatePresence mode="wait">
          {!isEncrypted ? (
            <motion.span
              key="raw"
              initial={{ y: 20, opacity: 0 }}
              animate={{ y: 0, opacity: 1 }}
              exit={{ y: -20, opacity: 0 }}
              className="text-sm font-semibold text-white"
            >
              {value}
            </motion.span>
          ) : (
            <motion.span
              key="hex"
              initial={{ y: 20, opacity: 0 }}
              animate={{ y: 0, opacity: 1 }}
              exit={{ y: -20, opacity: 0 }}
              className="terminal-text text-[11px]"
            >
              0x{cipher}...
            </motion.span>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
};

export default DataStream;
