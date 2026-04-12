import React from 'react';
import { NavLink } from 'react-router-dom';
import { motion } from 'framer-motion';
import { 
  LayoutDashboard, 
  Heart, 
  Brain, 
  TrendingUp, 
  Sparkles, 
  Shield 
} from 'lucide-react';

const navItems = [
  { path: '/insights', label: 'Dashboard', icon: Sparkles },
  { path: '/health', label: 'Health', icon: Heart },
  { path: '/mind', label: 'Mind', icon: Brain },
  { path: '/finance', label: 'Finance', icon: TrendingUp },
  { path: '/vault', label: 'Privacy Vault', icon: Shield },
];

const Sidebar = () => {
  return (
    <>
      {/* Desktop Sidebar */}
      <aside className="fixed left-0 top-16 bottom-0 w-20 xl:w-64 glass border-r border-white/5 hidden md:flex flex-col py-8 z-40 transition-all">
        <nav className="flex flex-col gap-2 px-3">
          {navItems.map((item) => (
            <NavLink
              key={item.path}
              to={item.path}
              className={({ isActive }) => `
                relative group flex items-center gap-4 p-4 rounded-2xl transition-all
                ${isActive ? 'text-cipher-primary' : 'text-slate-500 hover:text-slate-300 hover:bg-white/5'}
              `}
            >
              {({ isActive }) => (
                <>
                  <item.icon className={`w-6 h-6 transition-transform group-hover:scale-110 ${isActive ? 'drop-shadow-[0_0_8px_rgba(0,212,255,0.4)]' : ''}`} />
                  <span className="hidden xl:block font-bold text-sm tracking-tight">{item.label}</span>
                  
                  {isActive && (
                    <motion.div 
                      layoutId="activeGlow"
                      className="absolute inset-0 bg-cipher-primary/5 border border-cipher-primary/20 rounded-2xl -z-10 shadow-[0_0_15px_rgba(0,212,255,0.1)]"
                      initial={false}
                      transition={{ type: "spring", stiffness: 380, damping: 30 }}
                    />
                  )}
                </>
              )}
            </NavLink>
          ))}
        </nav>
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
            {({ isActive }) => (
              <>
                <item.icon className={`w-5 h-5 ${isActive ? 'drop-shadow-[0_0_8px_rgba(0,212,255,0.4)]' : ''}`} />
                <span className="text-[10px] font-bold uppercase tracking-tighter">{item.label.split(' ')[0]}</span>
                
                {isActive && (
                  <motion.div 
                    layoutId="mobileActiveGlow"
                    className="absolute -top-1 w-12 h-1 bg-cipher-primary rounded-full shadow-[0_0_10px_#00D4FF]"
                    initial={false}
                    transition={{ type: "spring", stiffness: 380, damping: 30 }}
                  />
                )}
              </>
            )}
          </NavLink>
        ))}
      </nav>
    </>
  );
};

export default Sidebar;
