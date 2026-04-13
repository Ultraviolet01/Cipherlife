import React from 'react';
import { Routes, Route, useLocation, Navigate } from 'react-router-dom';
import { AnimatePresence, motion } from 'framer-motion';

const InsightsPage = React.lazy(() => import('../pages/InsightsPage'));
const HealthPage = React.lazy(() => import('../pages/HealthPage'));
const MindPage = React.lazy(() => import('../pages/MindPage'));
const FinancePage = React.lazy(() => import('../pages/FinancePage'));
const VaultPage = React.lazy(() => import('../pages/VaultPage'));

const AnimatedRoutes = () => {
  const location = useLocation();

  return (
    <React.Suspense fallback={
      <div style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        height: '60vh',
        color: '#00D4FF',
        fontSize: '11px',
        fontWeight: 'bold',
        textTransform: 'uppercase',
        letterSpacing: '0.2em',
        gap: '12px'
      }}>
        <div className="spinner" style={{ width: '16px', height: '16px' }} />
        Cipher Pipeline Synchronizing...
      </div>
    }>
      <AnimatePresence mode="wait">
        <motion.div
          key={location.pathname}
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -10 }}
          transition={{ duration: 0.3 }}
          className="h-full"
        >
          <Routes location={location}>
            <Route path="/" element={<Navigate to="/dashboard" replace />} />
            <Route path="/dashboard" element={<InsightsPage />} />
            <Route path="/health" element={<HealthPage />} />
            <Route path="/mind" element={<MindPage />} />
            <Route path="/finance" element={<FinancePage />} />
            <Route path="/vault" element={<VaultPage />} />
            <Route path="*" element={<Navigate to="/dashboard" replace />} />
          </Routes>
        </motion.div>
      </AnimatePresence>
    </React.Suspense>
  );
};

export default AnimatedRoutes;
