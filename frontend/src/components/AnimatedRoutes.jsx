import React from 'react';
import { Routes, Route, useLocation, Navigate } from 'react-router-dom';
import { AnimatePresence, motion } from 'framer-motion';

import HealthPage from '../pages/HealthPage';
import MindPage from '../pages/MindPage';
import FinancePage from '../pages/FinancePage';
import InsightsPage from '../pages/InsightsPage';
import VaultPage from '../pages/VaultPage';

// Placeholder Pages (To be built or replaced)
const PagePlaceholder = ({ title }) => (
  <div className="flex flex-col gap-6">
    <div className="flex justify-between items-end">
      <div>
        <h2 className="text-3xl font-black italic uppercase tracking-tighter">{title}</h2>
        <p className="text-slate-500 text-sm font-bold uppercase tracking-widest mt-1">CipherLife Instance 01</p>
      </div>
    </div>
    <div className="glass p-12 rounded-3xl border-dashed border-2 border-white/5 flex flex-col items-center justify-center min-h-[400px]">
      <div className="w-16 h-16 rounded-2xl bg-white/5 flex items-center justify-center mb-4">
        <span className="text-2xl opacity-20 whitespace-nowrap overflow-hidden text-clip">{title} MODULE</span>
      </div>
      <p className="text-slate-600 font-mono text-xs uppercase">Initializing secure computation pipeline...</p>
    </div>
  </div>
);

const AnimatedRoutes = () => {
  const location = useLocation();

  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={location.pathname}
        initial={{ opacity: 0, y: 30, scale: 0.98 }}
        animate={{ opacity: 1, y: 0, scale: 1 }}
        exit={{ opacity: 0, y: -20, scale: 0.98 }}
        transition={{ duration: 0.5, ease: [0.22, 1, 0.36, 1] }}
        className="h-full"
      >
        <Routes location={location}>
          <Route path="/" element={<Navigate to="/insights" replace />} />
          <Route path="/insights" element={<InsightsPage />} />
          <Route path="/health" element={<HealthPage />} />
          <Route path="/mind" element={<MindPage />} />
          <Route path="/finance" element={<FinancePage />} />
          <Route path="/vault" element={<VaultPage />} />
        </Routes>
      </motion.div>
    </AnimatePresence>
  );
};

export default AnimatedRoutes;
