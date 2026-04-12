import React from 'react';
import { motion } from 'framer-motion';

const GlassCard = ({ children, className = '', glowColor = '' }) => {
  const glowStyles = {
    primary: 'border-cipher-primary/30 shadow-[0_0_20px_rgba(0,212,255,0.15)]',
    secondary: 'border-cipher-secondary/30 shadow-[0_0_20px_rgba(123,47,255,0.15)]',
    success: 'border-cipher-success/30 shadow-[0_0_20px_rgba(0,255,136,0.15)]',
    critical: 'border-cipher-critical/30 shadow-[0_0_20px_rgba(255,51,102,0.15)]',
  };

  return (
    <motion.div
      initial={{ opacity: 0, scale: 0.98 }}
      animate={{ opacity: 1, scale: 1 }}
      className={`glass rounded-2xl relative overflow-hidden ${glowStyles[glowColor] || ''} ${className}`}
    >
      <div className="absolute top-0 right-0 w-32 h-32 bg-white/5 blur-3xl rounded-full -mr-16 -mt-16 pointer-events-none" />
      <div className="relative z-10 p-6">
        {children}
      </div>
    </motion.div>
  );
};

export default GlassCard;
