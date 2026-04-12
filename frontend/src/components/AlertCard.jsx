import React from 'react';
import { motion } from 'framer-motion';
import { ShieldAlert, AlertCircle, Info } from 'lucide-react';

const AlertCard = ({ title, message, severity = 'warning' }) => {
  const configs = {
    warning: {
      bg: 'bg-cipher-warning/10',
      border: 'border-cipher-warning/20',
      text: 'text-cipher-warning',
      icon: <AlertCircle className="w-5 h-5" />
    },
    critical: {
      bg: 'bg-cipher-critical/10',
      border: 'border-cipher-critical/20',
      text: 'text-cipher-critical',
      icon: <ShieldAlert className="w-5 h-5" />
    },
    info: {
      bg: 'bg-cipher-primary/10',
      border: 'border-cipher-primary/20',
      text: 'text-cipher-primary',
      icon: <Info className="w-5 h-5" />
    }
  };

  const config = configs[severity];

  return (
    <motion.div
      initial={{ x: 50, opacity: 0 }}
      animate={{ x: 0, opacity: 1 }}
      className={`p-4 rounded-xl border ${config.bg} ${config.border} flex gap-4 items-start`}
    >
      <div className={`${config.text} mt-0.5`}>
        {config.icon}
      </div>
      <div>
        <h4 className={`text-sm font-bold ${config.text} uppercase tracking-tight mb-1`}>{title}</h4>
        <p className="text-xs text-slate-300 leading-relaxed">{message}</p>
      </div>
    </motion.div>
  );
};

export default AlertCard;
