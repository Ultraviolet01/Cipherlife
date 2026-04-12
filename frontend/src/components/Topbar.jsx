import WalletButton from './WalletButton';
import { Shield, Zap, ZapOff } from 'lucide-react';
import { useDemo } from '../context/DemoContext';

const Topbar = () => {
  const { isDemoMode, toggleDemoMode } = useDemo();

  return (
    <header className="fixed top-0 left-0 right-0 h-16 bg-cipher-base/80 backdrop-blur-md border-b border-white/5 z-50 px-6 flex items-center justify-between">
      <div className="flex items-center gap-6">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-lg bg-cipher-primary/20 flex items-center justify-center border border-cipher-primary/30">
            <Shield className="text-cipher-primary w-5 h-5 animate-pulse" />
          </div>
          <h1 className="text-xl font-black italic tracking-tighter uppercase gradient-text from-white to-slate-400">CipherLife</h1>
        </div>
        
        <div className="hidden md:flex items-center gap-2 px-3 py-1 rounded-full bg-cipher-success/5 border border-cipher-success/10">
          <motion.div 
            animate={{ opacity: [0.4, 1, 0.4] }}
            transition={{ repeat: Infinity, duration: 2 }}
            className="w-2 h-2 rounded-full bg-cipher-success shadow-[0_0_8px_#00FF88]"
          />
          <span className="text-[10px] font-bold text-cipher-success uppercase tracking-widest">All Data Encrypted</span>
        </div>
      </div>

      <div className="flex items-center gap-6">
        {/* Demo Mode Toggle */}
        <button 
          onClick={toggleDemoMode}
          className={`hidden sm:flex items-center gap-2 px-3 py-1.5 rounded-xl border transition-all ${
            isDemoMode ? 'bg-amber-500/10 border-amber-500/30 text-amber-500' : 'bg-white/5 border-white/10 text-slate-500'
          }`}
        >
          {isDemoMode ? <Zap className="w-3.5 h-3.5" /> : <ZapOff className="w-3.5 h-3.5" />}
          <span className="text-[9px] font-black uppercase tracking-widest">
            Demo Mode: {isDemoMode ? 'ON' : 'OFF'}
          </span>
        </button>

        <WalletButton />
      </div>
    </header>
  );
};

export default Topbar;
