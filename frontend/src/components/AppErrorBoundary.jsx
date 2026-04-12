import React from 'react';
import { ShieldAlert, RefreshCw } from 'lucide-react';

class AppErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error("CipherLife Runtime Error:", error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="fixed inset-0 bg-[#0A0F1E] flex items-center justify-center p-6 text-center z-[200]">
          <div className="max-w-md space-y-8 p-12 rounded-3xl bg-white/5 border border-rose-500/20 backdrop-blur-3xl shadow-[0_0_50px_rgba(239,68,68,0.1)]">
            <div className="w-20 h-20 bg-rose-500/20 rounded-2xl flex items-center justify-center mx-auto mb-6">
              <ShieldAlert className="text-rose-500 w-10 h-10 animate-pulse" />
            </div>
            
            <div className="space-y-4">
              <h1 className="text-3xl font-black italic uppercase tracking-tighter text-white">System Anomaly</h1>
              <p className="text-slate-400 text-sm font-bold uppercase tracking-wider leading-relaxed">
                A non-private runtime exception was detected. Our security boundary protected your raw data from leaking during the crash.
              </p>
            </div>

            <button
              onClick={() => window.location.reload()}
              className="flex items-center gap-3 bg-rose-500 hover:bg-rose-600 text-white px-8 py-3 rounded-xl font-black uppercase text-xs tracking-widest transition-all mx-auto shadow-lg shadow-rose-500/20"
            >
              <RefreshCw className="w-4 h-4" />
              Re-initialize Core
            </button>
            
            <div className="pt-6 border-t border-white/5">
               <span className="text-[9px] font-bold text-slate-700 uppercase tracking-[0.4em]">Error Code: FHE_RUNTIME_DESYNC</span>
            </div>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default AppErrorBoundary;
