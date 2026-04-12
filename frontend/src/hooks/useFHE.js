import { useState, useEffect } from 'react';
import * as fheUtils from '../utils/fheEncryption';
import { useWallet } from '../context/WalletContext';

export const useFHE = () => {
  const { provider } = useWallet();
  const [fheReady, setFheReady] = useState(false);
  const [loadingMsg, setLoadingMsg] = useState('Securing privacy link...');
  const [error, setError] = useState(null);

  useEffect(() => {
    const startup = async () => {
      // If we don't have a provider yet and window.ethereum is missing, we can't initialize
      if (!provider && !window.ethereum) {
        setLoadingMsg('Waiting for wallet connection...');
        return;
      }

      try {
        setLoadingMsg('Verifying cryptographic identity...');
        
        // Use the active provider or fallout to window.ethereum if provider is null
        const activeProvider = provider || (window.ethereum ? new (await import('ethers')).ethers.BrowserProvider(window.ethereum) : null);
        
        if (!activeProvider) {
            throw new Error("No provider available for cryptographic initialization.");
        }

        await fheUtils.initFHE(activeProvider);
        setLoadingMsg('Privacy engine operational.');
        setFheReady(true);
      } catch (err) {
        setError('Privacy engine failure. Please ensure your network supports FHE.');
        console.error("FHE Startup Error:", err);
      }
    };
    
    startup();
  }, [provider]);

  /**
   * High-level encryption wrappers
   */
  const encryptModule = async (moduleType, data) => {
    if (!fheReady) throw new Error("FHE engine not initialized.");
    
    try {
      setLoadingMsg(`Encrypting ${moduleType} data locally...`);
      let result;
      
      switch(moduleType.toLowerCase()) {
        case 'health':
          result = await fheUtils.encryptHealthData(...data);
          break;
        case 'mind':
          result = await fheUtils.encryptMentalData(...data);
          break;
        case 'finance':
          result = await fheUtils.encryptFinanceData(...data);
          break;
        default:
          throw new Error("Unknown module type.");
      }
      
      setLoadingMsg('Data blinded successfully.');
      return result;
    } catch (err) {
      setError(`Encryption failed: ${err.message}`);
      throw err;
    }
  };

  return {
    fheReady,
    loadingMsg,
    error,
    encryptModule
  };
};
