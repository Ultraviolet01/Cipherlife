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
  { path: '/insights', label: 'Dashboard', icon: Sparkles, key: 'dashboard' },
  { path: '/health', label: 'Health', icon: Heart, key: 'health' },
  { path: '/mind', label: 'Mind', icon: Brain, key: 'mind' },
  { path: '/finance', label: 'Finance', icon: TrendingUp, key: 'finance' },
  { path: '/vault', label: 'Privacy Vault', icon: Shield, key: 'vault' },
];

const Sidebar = () => {
  const location = useLocation();
  
  const getCompletedModules = () => {
    let count = 0;
    if (localStorage.getItem('cipherlife_health_score')) count++;
    if (localStorage.getItem('cipherlife_mind_score')) count++;
    if (localStorage.getItem('cipherlife_finance_score')) count++;
    return count;
  };

  const [completedModules, setCompleted] = useState(getCompletedModules());

  useEffect(() => {
    setCompleted(getCompletedModules());
  }, [location.pathname]);

  const progressPercent = (completedModules / 3) * 100;

  const completionStatus = {
    health: !!localStorage.getItem('cipherlife_health_score'),
    mind: !!localStorage.getItem('cipherlife_mind_score'),
    finance: !!localStorage.getItem('cipherlife_finance_score'),
  };

  return (
    <>
      <aside className="fixed left-0 top-16 bottom-0 w-20 xl:w-64 bg-cipher-base border-r border-white/5 hidden md:flex flex-col py-8 z-40 transition-all">
        <nav className="flex flex-col gap-2 px-3 flex-grow">
          {navItems.map((item) => (
            <NavLink
              key={item.path}
              to={item.path}
              className={({ isActive }) => `
                relative group flex items-center justify-between p-4 rounded-xl transition-all
                ${isActive ? 'bg-cipher-primary/10 text-cipher-primary border-l-4 border-cipher-primary' : 'text-slate-500 hover:text-slate-300 hover:bg-white/5'}
              `}
            >
              {({ isActive }) => (
                <>
                  <div className="flex items-center gap-4">
                    <item.icon className={`w-5 h-5 transition-transform group-hover:scale-110 ${isActive ? 'text-cipher-primary' : ''}`} />
                    <span className="hidden xl:block font-bold text-sm">{item.label}</span>
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
                </>
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
             
             <a 
               href="#" 
               className="flex items-center gap-2 text-[10px] font-bold text-slate-600 hover:text-slate-400 mt-4 uppercase tracking-widest transition-colors"
             >
                <ExternalLink className="w-3 h-3" />
                Contract Trace ↗
             </a>
          </div>
        </div>
      </aside>

      {/* Mobile Bottom Nav */}
      <nav className="fixed bottom-0 left-0 right-0 h-16 glass border-t border-white/10 md:hidden flex items-center justify-around px-2 z-50 rounded-none">
        {navItems.map((item) => (
          <NavLink
            key={item.path}
            to={item.path}
            className={({ isActive }) => `
              relative flex flex-col items-center justify-center gap-1 w-full h-full transition-all
              ${isActive ? 'text-cipher-primary' : 'text-slate-500'}
            `}
          >
            <item.icon className="w-5 h-5" />
            <span className="text-[10px] font-bold uppercase">{item.label.split(' ')[0]}</span>
          </NavLink>
        ))}
      </nav>
    </>
  );
};

export default Sidebar;
