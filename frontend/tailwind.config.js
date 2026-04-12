/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        cipher: {
          base: '#0A0F1E',
          primary: '#00D4FF',
          secondary: '#7B2FFF',
          success: '#00FF88',
          warning: '#FFB800',
          critical: '#FF3366',
          900: '#0a0a0c',
          800: '#141418',
          700: '#1f1f26',
        }
      },
      animation: {
        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'glow': 'glow 2s ease-in-out infinite alternate',
      },
      keyframes: {
        glow: {
          '0%': { boxShadow: '0 0 5px rgba(0, 212, 255, 0.2)' },
          '100%': { boxShadow: '0 0 20px rgba(0, 212, 255, 0.6)' },
        }
      }
    },
  },
  plugins: [],
}
