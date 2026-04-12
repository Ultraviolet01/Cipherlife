import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  ShieldCheck, 
  Terminal, 
  Cpu, 
  Trash2, 
  Download, 
  RefreshCw,
  Lock,
  Unlock,
  ArrowRight,
  Database
} from 'lucide-react';

// Design System Components
import GlassCard from '../components/GlassCard';

const VaultPage = () => {
  const [logs, setLogs] = useState([
    { id: 1, time: '20:14:02', module: 'HEALTH', hash: '8f2a...c10e', ciphertext: '0x3a9b...2f81', status: 'TFHE_SUCCESS' },
    { id: 2, time: '21:05:44', module: 'MIND', hash: '4d1c...a9d3', ciphertext: '0x9e7b...f1a2', status: 'TFHE_SUCCESS' },
    { id: 3, time: '23:12:15', module: 'FINANCE', hash: 'e5b1...8d4a', ciphertext: '0x1b4c...d7e9', status: 'TFHE_SUCCESS' },
  ]);

  const [isDeleting, setIsDeleting] = useState(false);

  const stats = [
    { label: 'Health Exposure', val: '0', module: 'BioVault' },
    { label: 'Cognitive Leak', val: '0', module: 'MindSync' },
    { label: 'Fiscal Exposure', val: '0', module: 'FiscalCore' },
    { label: 'FHE Operations', val: '42', module: 'System' },
  ];

  return (
    <div className="max-w-6xl mx-auto space-y-12 pb-20 font-mono">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div className="flex items-center gap-4">
          <div className="w-14 h-14 bg-cipher-success/20 rounded-2xl flex items-center justify-center shadow-[0_0_20px_rgba(0,255,136,0.2)] border border-cipher-success/30">
            <ShieldCheck className="text-cipher-success w-8 h-8" />
          </div>
          <div>
            <h1 className="text-4xl font-black gradient-text from-cipher-success to-emerald-500 tracking-tighter uppercase italic">Privacy Vault</h1>
            <p className="text-slate-500 text-[10px] font-bold uppercase tracking-[0.3em]">Cryptographic Integrity Hub</p>
          </div>
        </div>
        
        <div className="flex items-center gap-2 px-4 py-2 rounded-full bg-cipher-success/5 border border-cipher-success/10">
          <div className="w-2 h-2 rounded-full bg-cipher-success animate-pulse shadow-[0_0_8px_#00FF88]" />
          <span className="text-[10px] font-bold text-cipher-success uppercase tracking-widest">Calculated on Ciphertext Only</span>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
        
        {/* Terminal Logs (7 col) */}
        <div className="lg:col-span-7 space-y-6">
          <div className="flex items-center justify-between px-2">
            <div className="flex items-center gap-2">
              <Terminal className="w-4 h-4 text-slate-500" />
              <span className="text-xs font-bold uppercase tracking-widest text-slate-500">Encryption Activity Log</span>
            </div>
            <button className="text-[10px] text-cipher-success/60 hover:text-cipher-success transition-colors font-bold uppercase underline underline-offset-4">
              Export Audit Trail
            </button>
          </div>

          <div className="bg-cipher-900/80 border border-white/5 rounded-2xl p-6 h-[500px] overflow-y-auto scrollbar-hide relative">
            <div className="absolute inset-x-0 top-0 h-10 bg-gradient-to-b from-cipher-900/80 to-transparent pointer-events-none z-10" />
            <div className="space-y-6">
              <AnimatePresence initial={false}>
                {logs.map((log) => (
                  <motion.div 
                    key={log.id}
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    className="space-y-2 border-l-2 border-cipher-success/20 pl-4 py-1"
                  >
                    <div className="flex justify-between items-center text-[10px] text-slate-600 font-bold uppercase tracking-tighter">
                      <span>[{log.time}] MODULE::{log.module}</span>
                      <span className="text-cipher-success">STATUS::{log.status}</span>
                    </div>
                    <div className="space-y-1">
                      <p className="text-[11px] text-slate-400">
                        INPUT_HASH: <span className="text-cipher-success/70">{log.hash}</span>
                      </p>
                      <p className="text-[11px] text-slate-400">
                        TX_CHIPHER: <span className="text-cipher-primary/70">{log.ciphertext}</span>
                      </p>
                    </div>
                    <div className="flex gap-4 text-[9px] font-black uppercase tracking-widest mt-2">
                      <span className="bg-cipher-success/10 text-cipher-success px-2 py-0.5 rounded">Server saw: ENCRYPTED_ONLY</span>
                      <span className="bg-white/5 text-slate-500 px-2 py-0.5 rounded">Decryption: YOUR_DEVICE</span>
                    </div>
                  </motion.div>
                ))}
              </AnimatePresence>
            </div>
            <div className="mt-8 text-[11px] text-slate-800 animate-pulse">
               _Waiting for next biometric signal...
            </div>
          </div>
        </div>

        {/* Intelligence & Explainer (5 col) */}
        <div className="lg:col-span-5 space-y-8">
          
          {/* Summary Metrics */}
          <div className="grid grid-cols-2 gap-4">
            {stats.map((s, i) => (
              <GlassCard key={i} className="!p-4 border-white/5 hover:border-cipher-success/20 transition-all">
                <span className="text-[9px] font-black uppercase text-slate-600 tracking-widest block mb-2">{s.label}</span>
                <div className="flex items-baseline gap-1">
                  <span className="text-3xl font-black italic text-white">{s.val}</span>
                  <span className="text-[10px] text-slate-500 uppercase font-bold">Times</span>
                </div>
              </GlassCard>
            ))}
          </div>

          {/* Workflow Visualizer */}
          <GlassCard glowColor="success" className="space-y-6">
             <div className="text-center">
                <h3 className="text-xs font-black uppercase tracking-[0.2em] text-slate-400 mb-2">How CipherLife FHE Protects You</h3>
                <div className="h-[1px] w-20 bg-cipher-success/30 mx-auto" />
             </div>

             <div className="flex items-center justify-between py-4">
                <WorkflowNode icon={<Database className="w-5 h-5" />} label="Your Device" status="Plaintext" />
                <ArrowRight className="w-4 h-4 text-slate-800" />
                <WorkflowNode icon={<Lock className="w-5 h-5" />} label="Blinded" status="TFHE Cipher" pulse />
                <ArrowRight className="w-4 h-4 text-slate-800" />
                <WorkflowNode icon={<Cpu className="w-5 h-5" />} label="EVM Hub" status="Encrypted Op" />
             </div>

             <p className="text-[10px] text-slate-500 leading-relaxed text-center italic">
                Using Torus Fully Homomorphic Encryption (TFHE), we calculate analytics on your private data as if it were unencrypted—without ever seeing it.
             </p>
          </GlassCard>

          {/* Controls */}
          <div className="space-y-4">
             <button className="w-full flex justify-between items-center p-4 rounded-xl border border-white/5 bg-white/5 hover:bg-white/10 transition-all group">
                <div className="flex items-center gap-3 text-left">
                   <Download className="w-5 h-5 text-cipher-primary" />
                   <div>
                      <span className="text-xs font-black uppercase block">Export Secure Data</span>
                      <span className="text-[9px] text-slate-600 font-bold uppercase tracking-tighter">JSON Payload (Encrypted)</span>
                   </div>
                </div>
                <ArrowRight className="w-4 h-4 text-slate-800 group-hover:text-cipher-primary transition-colors" />
             </button>

             <button 
                onClick={() => { setIsDeleting(true); setTimeout(() => setIsDeleting(false), 3000); }}
                className="w-full flex justify-between items-center p-4 rounded-xl border border-rose-500/10 bg-rose-500/5 hover:bg-rose-500/10 transition-all group"
             >
                <div className="flex items-center gap-3 text-left">
                   <Trash2 className="w-5 h-5 text-rose-500" />
                   <div>
                      <span className="text-xs font-black uppercase block text-rose-500">Purge Vault</span>
                      <span className="text-[9px] text-rose-800 font-bold uppercase tracking-tighter">
                         {isDeleting ? 'Broadcasting Delete Entry...' : 'Delete All On-Chain Data'}
                      </span>
                   </div>
                </div>
                {isDeleting ? <Loader2 className="w-4 h-4 text-rose-500 animate-spin" /> : <ArrowRight className="w-4 h-4 text-rose-800" />}
             </button>
          </div>
        </div>

      </div>
    </div>
  );
};

// Specialized UI Components

const WorkflowNode = ({ icon, label, status, pulse }) => (
  <div className="flex flex-col items-center gap-3">
    <div className={`w-12 h-12 rounded-xl flex items-center justify-center border transition-all ${
      pulse ? 'bg-cipher-success/20 border-cipher-success animate-pulse' : 'bg-white/5 border-white/10'
    }`}>
      <div className={pulse ? 'text-cipher-success' : 'text-slate-500'}>
        {icon}
      </div>
    </div>
    <div className="text-center">
      <span className="text-[9px] font-black uppercase block text-white">{label}</span>
      <span className="text-[8px] font-bold uppercase text-slate-600">{status}</span>
    </div>
  </div>
);

export default VaultPage;
