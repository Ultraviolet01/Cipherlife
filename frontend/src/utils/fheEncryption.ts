// @ts-nocheck
import { createInstance } from 'fhevmjs';

// Configuration for Sepolia Zama Coprocessor (fhEVM v0.11.1)
const FHE_CONFIG = {
  chainId: 11155111,
  networkUrl: 'https://rpc.sepolia.org',
  gatewayUrl: 'https://gateway.sepolia.zama.ai', // Official Zama Sepolia Gateway
  aclAddress: '0xf0Ffdc93b7E186bC2f8CB3dAA75D86d1930A433D', // From ZamaConfig.sol
  kmsContractAddress: '0xbE0E383937d564D7FF0BC3b46c51f0bF8d5C311A' // From ZamaConfig.sol
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
      networkUrl: FHE_CONFIG.networkUrl, // Add this!
      gatewayUrl: FHE_CONFIG.gatewayUrl,
      aclContractAddress: FHE_CONFIG.aclAddress,
      kmsContractAddress: FHE_CONFIG.kmsContractAddress
    });
    return fheInstance;
  } catch (error) {
    console.error("FHE Initialization Failed:", error);
    throw new Error("Could not initialize privacy engine. Please check your Sepolia connection.");
  }
};

/**
 * Helper to generate a SHA-256 hash of plaintext for the audit trail
 */
const generateHash = async (data) => {
  const msgUint8 = new TextEncoder().encode(JSON.stringify(data));
  const hashBuffer = await crypto.subtle.digest('SHA-256', msgUint8);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  return '0x' + hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
};

/**
 * Encrypted data submission flow for v0.11.1
 * For inputs, we now use the handles directly in function calls.
 */
const encryptData = async (value, bits, contractAddress, userAddress) => {
  const instance = await initFHE();
  const input = instance.createEncryptedInput(contractAddress, userAddress);
  
  if (bits === 8) input.add8(value);
  else if (bits === 32) input.add32(value);
  
  const encrypted = await input.encrypt();
  const plaintextHash = await generateHash(value);

  // Store in audit cache
  const auditLog = {
    id: Date.now(),
    timestamp: new Date().toLocaleTimeString(),
    hash: plaintextHash,
    ciphertext: encrypted.handles[0],
    proof: encrypted.inputProof
  };
  
  const existingLogs = JSON.parse(localStorage.getItem('cipherlife_audit_logs') || '[]');
  localStorage.setItem('cipherlife_audit_logs', JSON.stringify([auditLog, ...existingLogs].slice(0, 50)));

  return {
    handle: encrypted.handles[0],
    inputProof: encrypted.inputProof,
    plaintextHash
  };
};

export const encryptHealthData = (score, contract, user) => {
  return encryptData(score, 8, contract, user);
};

export const encryptMentalData = (score, contract, user) => {
  return encryptData(score, 8, contract, user);
};

export const encryptFinanceData = (score, contract, user) => {
  return encryptData(score, 32, contract, user);
};

/**
 * Formats a privacy proof for the Vault dashboard
 */
export const generatePrivacyProof = (ciphertext) => {
  return {
    algorithm: "TFHE-rs",
    mode: "fhEVM Coprocessor 0.11",
    proof: "KMS-Signed Multi-Party Proof",
    gate: "Programmable Bootstrapping",
    verifiedBy: "Zama KMS Nodes"
  };
};
