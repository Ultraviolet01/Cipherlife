import { useState, useEffect } from 'react';
import * as fheUtils from '../utils/fheEncryption';

export const useFHE = () => {
  const [fheReady, setFheReady] = useState(false);
  const [loadingMsg, setLoadingMsg] = useState('Securing privacy link...');
  const [error, setError] = useState(null);

  useEffect(() => {
    const startup = async () => {
      try {
        setLoadingMsg('Verifying cryptographic identity...');
        await fheUtils.initFHE();
        setLoadingMsg('Privacy engine operational.');
        setFheReady(true);
      } catch (err) {
        setError('Privacy engine failure. Please ensure your network supports FHE.');
        console.error(err);
      }
    };
    startup();
  }, []);

  /**
   * High-level encryption wrappers with UX status updates
   */
  const encryptModule = async (moduleType, data, contract, user) => {
    if (!fheReady) throw new Error("FHE engine not initialized.");
    
    try {
      setLoadingMsg(`Encrypting ${moduleType} data locally...`);
      let result;
      
      switch(moduleType.toLowerCase()) {
        case 'health':
          result = await fheUtils.encryptHealthData(...data, contract, user);
          break;
        case 'mind':
          result = await fheUtils.encryptMentalData(...data, contract, user);
          break;
        case 'finance':
          result = await fheUtils.encryptFinanceData(...data, contract, user);
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

  const decryptResult = async (handle, contract, user) => {
    try {
      setLoadingMsg('Requesting secure re-encryption...');
      const result = await fheUtils.decryptResult(handle, contract, user);
      setLoadingMsg('Result decrypted successfully.');
      return result;
    } catch (err) {
      setError(`Decryption failed: ${err.message}`);
      throw err;
    }
  };

  return {
    fheReady,
    loadingMsg,
    error,
    encryptModule,
    decryptResult
  };
};
