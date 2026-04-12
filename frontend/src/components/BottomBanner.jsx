import React from 'react';
import { Lock } from 'lucide-react';

const BottomBanner = () => {
  return (
    <div className="fixed bottom-16 md:bottom-0 left-0 right-0 md:left-20 xl:left-64 h-8 bg-cipher-base/40 backdrop-blur-sm border-t border-white/5 flex items-center justify-center z-30 px-4 pointer-events-none">
      <div className="flex items-center gap-2 text-[10px] font-medium text-slate-500 uppercase tracking-widest">
        <Lock className="w-3 h-3 text-cipher-primary opacity-60" />
        <span>Your data is mathematically encrypted. This server has never seen your information.</span>
      </div>
    </div>
  );
};

export default BottomBanner;
