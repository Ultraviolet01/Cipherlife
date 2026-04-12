import React, { useEffect, useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Shield } from 'lucide-react';

const SplashScreen = ({ onFinish }) => {
  const [isVisible, setIsVisible] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsVisible(false);
      setTimeout(onFinish, 1000); // Wait for exit animation
    }, 3000);
    return () => clearTimeout(timer);
  }, [onFinish]);

  // Generate random constellation stars
  const stars = Array.from({ length: 50 }).map((_, i) => ({
    id: i,
    x: Math.random() * 100,
    y: Math.random() * 100,
    size: Math.random() * 2 + 1,
    duration: Math.random() * 3 + 2
  }));

  return (
    <AnimatePresence>
      {isVisible && (
        <motion.div
          initial={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-[100] bg-[#0A0F1E] flex flex-col items-center justify-center overflow-hidden"
        >
          {/* Constellation Background */}
          <div className="absolute inset-0 opacity-20 pointer-events-none">
            {stars.map((star) => (
              <motion.div
                key={star.id}
                initial={{ opacity: 0.2 }}
                animate={{ opacity: [0.2, 1, 0.2] }}
                transition={{ repeat: Infinity, duration: star.duration }}
                className="absolute bg-cipher-primary rounded-full shadow-[0_0_8px_#00D4FF]"
                style={{
                  left: `${star.x}%`,
                  top: `${star.y}%`,
                  width: star.size,
                  height: star.size,
                }}
              />
            ))}
          </div>

          {/* Logo Animation */}
          <motion.div
            initial={{ scale: 0.8, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 1, ease: "easeOut" }}
            className="relative z-10 flex flex-col items-center gap-8"
          >
            <div className="relative">
              <motion.div 
                animate={{ rotate: 360 }}
                transition={{ repeat: Infinity, duration: 20, ease: "linear" }}
                className="w-32 h-32 rounded-full border-2 border-dashed border-cipher-primary/30"
              />
              <div className="absolute inset-0 flex items-center justify-center">
                <Shield className="w-16 h-16 text-cipher-primary drop-shadow-[0_0_20px_#00D4FF]" />
              </div>
            </div>

            <div className="text-center space-y-4 px-6 max-w-lg">
              <h1 className="text-6xl font-black italic tracking-tighter uppercase gradient-text from-white via-cipher-primary to-cipher-secondary">
                CipherLife
              </h1>
              <motion.p 
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 1, duration: 1 }}
                className="text-slate-400 text-sm font-bold uppercase tracking-[0.4em] leading-loose"
              >
                The AI that knows everything about you. <br />
                <span className="text-cipher-success">Mathematically incapable of betrayal.</span>
              </motion.p>
            </div>
          </motion.div>

          <footer className="absolute bottom-12 text-[10px] font-black uppercase tracking-[0.5em] text-slate-800">
             System Initializing :: Protocol FHE-TFHE-01
          </footer>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default SplashScreen;
