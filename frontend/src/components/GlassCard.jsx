import React from 'react';

const GlassCard = ({ children, className = '', glowColor = '' }) => {
  const glowStyles = {
    primary: 'border-cipher-primary/30 shadow-[0_0_15px_rgba(0,212,255,0.15)]',
    secondary: 'border-cipher-secondary/30 shadow-[0_0_15px_rgba(123,47,255,0.15)]',
    warning: 'border-cipher-warning/30 shadow-[0_0_15px_rgba(255,184,0,0.15)]',
    critical: 'border-cipher-critical/30 shadow-[0_0_15px_rgba(255,51,102,0.15)]',
  };

  return (
    <div className={`
      bg-white/5 backdrop-blur-xl border border-white/10 shadow-2xl transition-all duration-300
      hover:border-white/20 hover:shadow-[0_0_20px_rgba(255,255,255,0.05)]
      rounded-[16px] p-6
      ${glowColor ? glowStyles[glowColor] : ''}
      ${className}
    `}>
      {children}
    </div>
  );
};

export default GlassCard;
