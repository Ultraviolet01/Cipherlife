import { useState, useEffect } from 'react';
import * as fheUtils from '../utils/fheEncryption';
import { useWallet } from '../context/WalletContext';

export const useFHE = () => {
  const { provider } = useWallet();
  const [fheReady, setFheReady] = useState(false);
  const [loadingMsg, setLoadingMsg] = useState('Securing privacy link...');
  const [error, setError] = useState(null);

  useEffect(() => {
    let interval;
    let attempts = 0;

    const checkReadiness = () => {
      attempts++;
      if (fheUtils.isFHEReady()) {
        setFheReady(true);
        setLoadingMsg('Privacy engine operational.');
        setError(null);
        if (interval) clearInterval(interval);
      } else {
        const currentError = fheUtils.getFHEError();
        if (currentError) {
          setError(currentError.message || 'Privacy engine failure.');
          if (interval) clearInterval(interval);
        } else if (attempts > 20) {
          setLoadingMsg('Running in analysis-only mode');
          if (interval) clearInterval(interval);
        } else {
          setLoadingMsg('FHE engine loading...');
        }
      }
    };

    // Initial check
    checkReadiness();

    // Poll if not ready
    if (!fheUtils.isFHEReady() && !fheUtils.getFHEError()) {
      interval = setInterval(checkReadiness, 500);
    }

    return () => {
      if (interval) clearInterval(interval);
    };
  }, []);


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
