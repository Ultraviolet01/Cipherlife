// @ts-nocheck
import { createInstance } from 'fhevmjs';

// Configuration for Sepolia Zama Coprocessor (fhEVM v0.11.1)
const FHE_CONFIG = {
  chainId: 11155111,
  networkUrl: import.meta.env.VITE_SEPOLIA_RPC_URL || 'https://ethereum-sepolia-rpc.publicnode.com',
  gatewayUrl: 'https://gateway.sepolia-coprocessor.zama.ai/', 
  aclAddress: '0xf0Ffdc93b7E186bC2f8CB3dAA75D86d1930A433D', 
  kmsAddress: '0xbE0E383937d564D7FF0BC3b46c51f0bF8d5C311A' 
};

let fheInstance = null;

/**
 * Initializes the FHE Instance
 */
export const initFHE = async () => {
  if (fheInstance) return fheInstance;
  
  try {
    fheInstance = await createInstance({
      chainId: FHE_CONFIG.chainId,
      networkUrl: FHE_CONFIG.networkUrl,
      gatewayUrl: FHE_CONFIG.gatewayUrl,
      aclContractAddress: FHE_CONFIG.aclAddress,
      kmsContractAddress: FHE_CONFIG.kmsAddress
    });
    return fheInstance;
  } catch (error) {
    console.warn("Primary gateway failed, trying backup...", error);
    try {
      fheInstance = await createInstance({
        chainId: FHE_CONFIG.chainId,
        networkUrl: FHE_CONFIG.networkUrl,
        gatewayUrl: 'https://gateway.sepolia.zama.ai/',
        aclContractAddress: FHE_CONFIG.aclAddress,
        kmsContractAddress: FHE_CONFIG.kmsAddress
      });
      return fheInstance;
    } catch (fallbackError) {
      console.error("FHE Initialization Failed:", fallbackError);
      throw new Error("Privacy engine unreachable.");
    }
  }
};
// ... rest of the file ...
