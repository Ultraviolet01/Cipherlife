import { motion } from 'framer-motion';

const WellnessRing = ({ score = 0, size = 160, color = null }) => {
  const strokeWidth = 12;
  const radius = (size - strokeWidth) / 2;
  const circumference = radius * 2 * Math.PI;
  const offset = circumference - (score / 100) * circumference;

  // Color gradient calculation (only if not overridden)
  const getSemanticColor = (s) => {
    if (s > 70) return '#00FF88'; // Success Green
    if (s > 40) return '#FFB800'; // Warning Amber
    return '#FF3366'; // Critical Red
  };

  const ringColor = color || getSemanticColor(score);

  return (
    <div className="relative flex items-center justify-center" style={{ width: size, height: size }}>
      <svg width={size} height={size} className="transform -rotate-90">
        <circle
          cx={size / 2}
          cy={size / 2}
          r={radius}
          stroke="rgba(255,255,255,0.05)"
          strokeWidth={strokeWidth}
          fill="transparent"
        />
        <motion.circle
          cx={size / 2}
          cy={size / 2}
          r={radius}
          stroke={ringColor}
          strokeWidth={strokeWidth}
          strokeDasharray={circumference}
          initial={{ strokeDashoffset: circumference }}
          animate={{ strokeDashoffset: offset }}
          transition={{ duration: 2, ease: "easeOut" }}
          strokeLinecap="round"
          fill="transparent"
          style={{ filter: `drop-shadow(0 0 8px ${ringColor}40)` }}
        />
      </svg>
      <div className="absolute inset-0 flex flex-col items-center justify-center">
        <motion.span 
          initial={{ scale: 0.5, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          className="font-extrabold text-white tracking-tighter"
          style={{ fontSize: size / 5 }}
        >
          {Math.round(score)}
        </motion.span>
      </div>
    </div>
  );
};

export default WellnessRing;
