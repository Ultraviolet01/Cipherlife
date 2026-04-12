import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { 
  Shield, 
  Terminal as TerminalIcon, 
  Cpu, 
  Database, 
  Globe,
  Lock,
  ArrowRight
} from 'lucide-react';

// Design System Components
import GlassCard from '../components/GlassCard';

const VaultPage = () => {
  const [mounted, setMounted] = useState(false);
  
  useEffect(() => {
    setMounted(true);
  }, []);

  if (!mounted) return (
    <div className="flex flex-col items-center justify-center min-h-[60vh] gap-4">
      <div className="spinner" />
      <p className="text-slate-500 font-bold uppercase tracking-widest text-[10px]">Accessing Vault...</p>
    </div>
  );

  return (
    <div className="max-w-[1200px] mx-auto p-8 space-y-12 pb-32">
      {/* Header */}
      <div style={{ marginBottom: '32px' }}>
        <h1 style={{
          fontSize: '32px',
          fontWeight: '800',
          background: 'linear-gradient(90deg, #00D4FF, #FFFFFF)',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          marginBottom: '6px'
        }}>
          Privacy Vault
        </h1>
        <p style={{ color: 'var(--text-muted)', fontSize: '14px', fontWeight: '500' }}>
          Transparent log of every homomorphic computation pulse.
        </p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Performance Metrics */}
        <div className="lg:col-span-1 space-y-6">
           <div className="flex items-center gap-2">
              <Cpu className="w-5 h-5 text-cipher-primary" />
              <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Integrity Stats</h3>
           </div>
           
           <div className="grid grid-cols-1 gap-4">
              <MetricBox label="Plaintext Leaks" value="0" color="#00FF88" />
              <MetricBox label="Gateway Snoops" value="0" color="#00FF88" />
              <MetricBox label="Total Computations" value="12" color="#00D4FF" />
           </div>
        </div>

        {/* Real-time Logs */}
        <div className="lg:col-span-2 space-y-6">
           <div className="flex items-center gap-2">
              <TerminalIcon className="w-5 h-5 text-cipher-primary" />
              <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Audit Trail</h3>
           </div>
           
           <GlassCard className="p-0 overflow-hidden border-white/5">
              <div className="bg-[#0D1117] p-6 space-y-6 font-mono text-[13px] min-h-[500px]">
                 <TerminalEntry 
                   timestamp="23:14:02" 
                   module="Health" 
                   action="ENCRYPT_MODULE" 
                   status="SUCCESS" 
                   color="#00D4FF"
                 />
                 <TerminalEntry 
                   timestamp="23:14:05" 
                   module="Health" 
                   action="GATEWAY_COMPUTE" 
                   status="FHE_BLINDED" 
                   color="#00D4FF"
                 />
                 <TerminalEntry 
                   timestamp="22:45:12" 
                   module="Mind" 
                   action="ENCRYPT_MODULE" 
                   status="SUCCESS" 
                   color="#7B2FFF"
                 />
                 <TerminalEntry 
                   timestamp="22:45:30" 
                   module="Mind" 
                   action="GATEWAY_COMPUTE" 
                   status="FHE_BLINDED" 
                   color="#7B2FFF"
                 />
                 <div className="pt-4 border-t border-white/5 opacity-30 text-[11px] italic">
                   Listening for new mathematical pulses...
                 </div>
              </div>
           </GlassCard>
        </div>
      </div>

      {/* How it works - Flow Diagram */}
      <section className="space-y-8">
         <div className="flex items-center gap-2">
            <Globe className="w-5 h-5 text-cipher-primary" />
            <h3 style={{ fontSize: '18px', fontWeight: '700', color: 'var(--text-primary)' }}>Cryptographic Flow</h3>
         </div>
         
         <div className="flex flex-wrap items-center justify-between gap-4 py-8 px-4 bg-white/5 rounded-3xl border border-white/5">
            {['Your Device', 'FHE Encrypt', 'Sepolia Node', 'ML Coprocessor', 'Back to You'].map((step, i) => (
              <React.Fragment key={i}>
                <div style={{
                  background: 'rgba(0,212,255,0.06)',
                  border: '1px solid rgba(0,212,255,0.2)',
                  borderRadius: '16px',
                  padding: '24px',
                  textAlign: 'center',
                  minWidth: '140px',
                  display: 'flex',
                  flexDirection: 'column',
                  alignItems: 'center',
                  gap: '12px'
                }}>
                  <div className="w-10 h-10 rounded-full bg-cipher-primary/10 flex items-center justify-center">
                     {i === 0 && <Database className="w-5 h-5 text-cipher-primary" />}
                     {i === 1 && <Lock className="w-5 h-5 text-cipher-primary" />}
                     {i === 2 && <Globe className="w-5 h-5 text-cipher-primary" />}
                     {i === 3 && <Cpu className="w-5 h-5 text-cipher-primary" />}
                     {i === 4 && <Shield className="w-5 h-5 text-cipher-primary" />}
                  </div>
                  <div style={{
                    fontSize: '14px',
                    fontWeight: '700',
                    color: '#00D4FF'
                  }}>
                    {step}
                  </div>
                </div>
                {i < 4 && (
                  <div className="flex-1 min-w-[30px] flex justify-center">
                    <ArrowRight className="text-cipher-primary opacity-30" />
                  </div>
                )}
              </React.Fragment>
            ))}
         </div>
         
         <p className="text-slate-500 text-sm max-w-2xl leading-relaxed mx-auto text-center font-medium">
            This diagram illustrates how your data travels through the CipherLife ecosystem. At no point during this flow 
            is your information decrypted into plaintext outside of your own physical device.
         </p>
      </section>
    </div>
  );
};

const MetricBox = ({ label, value, color }) => (
  <GlassCard className="p-6 flex flex-col items-center text-center gap-2">
     <div style={{ fontSize: '11px', fontWeight: '700', textTransform: 'uppercase', letterSpacing: '0.1em', color: 'var(--text-muted)' }}>
        {label}
     </div>
     <div style={{
       fontSize: '48px',
       fontWeight: '900',
       color: color,
       lineHeight: 1
     }}>
       {value}
     </div>
     <div className="text-[10px] text-slate-600 font-bold uppercase mt-2">Verified Integrity</div>
  </GlassCard>
);

const TerminalEntry = ({ timestamp, module, action, status, color }) => (
  <div style={{
    borderLeft: `3px solid ${color}`,
    paddingLeft: '16px',
    background: 'rgba(255,255,255,0.02)',
    padding: '12px 16px',
    borderRadius: '8px'
  }}>
     <div className="flex justify-between items-center mb-2">
        <span className="text-slate-600">{timestamp}</span>
        <span style={{ 
          background: `${color}20`, 
          color: color, 
          padding: '2px 8px', 
          borderRadius: '4px',
          fontSize: '10px',
          fontWeight: '900'
        }}>
          {status}
        </span>
     </div>
     <div className="flex gap-4">
        <span className="text-slate-400 font-bold">[{module}]</span>
        <span className="text-white">{action}</span>
     </div>
  </div>
);

export default VaultPage;
