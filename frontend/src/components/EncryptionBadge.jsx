import React from 'react';
import { motion } from 'framer-motion';
import { Lock } from 'lucide-react';

const EncryptionBadge = () => {
  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      className="flex items-center gap-2 px-3 py-1.5 rounded-full bg-cipher-primary/10 border border-cipher-primary/20 text-cipher-primary text-[10px] font-bold uppercase tracking-widest"
    >
      <motion.div
        animate={{ 
          scale: [1, 1.2, 1],
          opacity: [0.5, 1, 0.5]
        }}
        transition={{ 
          repeat: Infinity, 
          duration: 3,
          ease: "easeInOut"
        }}
        className="relative"
      >
        <Lock className="w-3 h-3" />
        <motion.div 
          className="absolute inset-0 bg-cipher-primary blur-[4px]"
          animate={{ opacity: [0, 0.5, 0] }}
          transition={{ repeat: Infinity, duration: 3 }}
        />
      </motion.div>
      <span>🔐 End-to-End Encrypted</span>
    </motion.div>
  );
};

export default EncryptionBadge;
