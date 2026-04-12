import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import { Toaster } from 'react-hot-toast';
import { WalletProvider } from './context/WalletContext';
import { DemoProvider } from './context/DemoContext';
import AppErrorBoundary from './components/AppErrorBoundary';
import SplashScreen from './components/SplashScreen';
import FHEOverlay from './components/FHEOverlay';
import Layout from './components/Layout';
import AnimatedRoutes from './components/AnimatedRoutes';
import DisclaimerBanner from './components/DisclaimerBanner';

const App = () => {
  const [showMain, setShowMain] = React.useState(false);

  return (
    <AppErrorBoundary>
      <DemoProvider>
        <WalletProvider>
          {!showMain && <SplashScreen onFinish={() => setShowMain(true)} />}
          
          <AnimatePresence>
            {showMain && (
              <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                className="contents"
              >
                <Router>
                  <DisclaimerBanner />
                  <Layout>
                    <FHEOverlay />
                    <AnimatedRoutes />
                  </Layout>
                </Router>
              </motion.div>
            )}
          </AnimatePresence>
          
          <Toaster 
            position="bottom-right"
            toastOptions={{
              style: {
                background: '#0F172A',
                color: '#fff',
                border: '1px solid rgba(255,255,255,0.05)',
                fontSize: '11px',
                fontWeight: 'bold',
                textTransform: 'uppercase',
                letterSpacing: '0.1em',
                borderRadius: '12px'
              }
            }}
          />
        </WalletProvider>
      </DemoProvider>
    </AppErrorBoundary>
  );
};

export default App;
