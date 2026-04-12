// @ts-nocheck
import axios from 'axios';
import { toast } from 'react-hot-toast';
import { VAULT_CONTRACT_ADDRESS, VAULT_ABI } from './web3';
import { ethers } from 'ethers';

/**
 * Centrally manages the dual-submission pipeline for fhEVM v0.11.1:
 * 1. Local FHE Encryption
 * 2. FastAPI ML Inference
 * 3. Smart Contract Permanence
 */
export const executeUnifiedSubmission = async ({
  moduleName,
  rawData,
  encryptFn,
  apiEndpoint,
  walletAccount,
  onComplete
}) => {
  const loadingToast = toast.loading(`Initializing ${moduleName} Privacy Protocol...`);
  
  try {
    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();
    const contract = new ethers.Contract(VAULT_CONTRACT_ADDRESS, VAULT_ABI, signer);

    // 1. Local Blinding
    toast.loading("🔐 Blinding biological signals...", { id: loadingToast });
    const { handle, inputProof } = await encryptFn(
      rawData, // Passing raw data directly
      VAULT_CONTRACT_ADDRESS,
      walletAccount
    );

    // 2. Parallel ML & Chain submission
    toast.loading("🚀 Broadcasting ciphertext to ML & Chain...", { id: loadingToast });
    
    // ML submission (Mocked backend response)
    const mlPromise = axios.post(apiEndpoint, {
      handle: handle,
      inputProof: inputProof
    });

    // Smart Contract submission
    let contractTx;
    if (moduleName === 'health') {
        contractTx = await contract.submitHealthData(handle, inputProof);
    } else if (moduleName === 'mind') {
        contractTx = await contract.submitMindData(handle, inputProof);
    } else if (moduleName === 'finance') {
        contractTx = await contract.submitFinanceData(handle, inputProof);
    }

    const [mlResponse] = await Promise.all([
      mlPromise,
      contractTx ? contractTx.wait() : Promise.resolve(true)
    ]);

    // 3. Finalize
    toast.success(`${moduleName} Metrics Secured!`, { id: loadingToast });
    
    // Persist for Insights (In a real app, we would use the decrypted score from the ML response or contract)
    // For this demonstration, we'll use a mocked score derived from the raw data
    const score = parseInt(rawData) || 75;
    localStorage.setItem(`cipherlife_score_${moduleName}`, score);
    
    if (onComplete) onComplete(score);
    return score;

  } catch (error) {
    console.error(`Submission Failure (${moduleName}):`, error);
    toast.error(`${moduleName} Engine Desync: ${error.message || 'Unknown Error'}`, { id: loadingToast });
    throw error;
  }
};
