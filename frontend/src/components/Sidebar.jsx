import React, { useEffect, useState } from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { motion } from 'framer-motion';
import { 
  Heart, 
  Brain, 
  TrendingUp, 
  Sparkles, 
  Shield,
  ExternalLink
} from 'lucide-react';

const navItems = [
  { path: '/dashboard', label: 'Dashboard', icon: '⊞', key: 'dashboard' },
  { path: '/health', label: 'Health', icon: '♥', key: 'health' },
  { path: '/mind', label: 'Mind', icon: '◎', key: 'mind' },
  { path: '/finance', label: 'Finance', icon: '↗', key: 'finance' },
  { path: '/vault', label: 'Privacy Vault', icon: '◈', key: 'vault' },
];

const Sidebar = () => {
  const [completedModules, setProgress] = useState(0);

  // Recalculate on every render cycle for absolute synchronization
  useEffect(() => {
    const count = [
      'cipherlife_health_score',
      'cipherlife_mind_score', 
      'cipherlife_finance_score'
    ].filter(key => {
      const val = localStorage.getItem(key);
      return val && val !== '0' && val !== 'null';
    }).length;
    setProgress(count);
  });

  const progressPercent = (completedModules / 3) * 100;

  const completionStatus = {
    health: !!localStorage.getItem('cipherlife_health_score') && localStorage.getItem('cipherlife_health_score') !== '0',
    mind: !!localStorage.getItem('cipherlife_mind_score') && localStorage.getItem('cipherlife_mind_score') !== '0',
    finance: !!localStorage.getItem('cipherlife_finance_score') && localStorage.getItem('cipherlife_finance_score') !== '0',
  };

  return (
    <>
      <aside className="fixed left-0 top-16 bottom-0 w-20 xl:w-64 bg-cipher-base border-r border-white/5 hidden md:flex flex-col py-8 z-40 transition-all overflow-y-auto">
        <nav className="flex flex-col gap-1 px-3 flex-grow">
          {navItems.map((item) => (
            <NavLink
              key={item.path}
              to={item.path}
              style={({ isActive }) => ({
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                gap: '12px',
                padding: '12px 16px',
                borderRadius: '10px',
                textDecoration: 'none',
                color: isActive 
                  ? '#00D4FF' 
                  : 'rgba(240,244,255,0.6)',
                background: isActive 
                  ? 'rgba(0,212,255,0.08)' 
                  : 'transparent',
                borderLeft: isActive 
                  ? '3px solid #00D4FF' 
                  : '3px solid transparent',
                cursor: 'pointer',
                transition: 'all 0.2s',
                pointerEvents: 'all',
                userSelect: 'none',
                width: '100%',
              })}
            >
              <div className="flex items-center gap-3">
                <span style={{ fontSize: '18px', width: '20px', textAlign: 'center' }}>{item.icon}</span>
                <span className="hidden xl:block" style={{ fontSize: '14px', fontWeight: 600 }}>
                  {item.label}
                </span>
              </div>

              {item.key !== 'dashboard' && item.key !== 'vault' && (
                <div 
                  style={{
                    width: '8px', height: '8px',
                    borderRadius: '50%',
                    background: completionStatus[item.key] ? '#00FF88' : 'rgba(255,255,255,0.2)'
                  }} 
                />
              )}
            </NavLink>
          ))}
        </nav>

        {/* Progress Footer */}
        <div className="px-6 py-8 border-t border-white/5 hidden xl:block">
          <div className="space-y-4">
             <div className="flex justify-between text-[10px] font-bold uppercase tracking-widest text-slate-500">
               <span>Setup Progress</span>
               <span>{completedModules}/3 Modules</span>
             </div>
             <div className="h-1 w-full bg-white/10 rounded-full overflow-hidden">
                <motion.div 
                  initial={{ width: 0 }}
                  animate={{ width: `${progressPercent}%` }}
                  className="h-full bg-cipher-primary shadow-[0_0_8px_#00D4FF]"
                />
             </div>
          </div>
        </div>
      </aside>

      {/* Mobile Bottom Nav */}
      <nav className="fixed bottom-0 left-0 right-0 h-16 glass border-t border-white/10 md:hidden flex items-center justify-around px-2 z-50">
        {navItems.map((item) => (
          <NavLink
            key={item.path}
            to={item.path}
            className={({ isActive }) => `
              relative flex flex-col items-center justify-center gap-1 w-full h-full transition-all
              ${isActive ? 'text-cipher-primary' : 'text-slate-500'}
            `}
          >
            <span style={{ fontSize: '18px' }}>{item.icon}</span>
            <span className="text-[10px] font-bold uppercase">{item.label.split(' ')[0]}</span>
          </NavLink>
        ))}
      </nav>
    </>
  );
};

export default Sidebar;
