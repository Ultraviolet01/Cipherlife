import { fheManager } from './fhe-init';

/**
 * Initializes the FHE Instance.
 * This is now bridged to the fheManager.
 */
export const initFHE = async (provider) => {
  return await fheManager.initialize(provider);
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
 * Encrypted data submission flow using fheManager
 */
const encryptData = async (value, bits) => {
  let encrypted;
  
  switch(bits) {
    case 8:
      encrypted = fheManager.encrypt8(value);
      break;
    case 16:
      encrypted = fheManager.encrypt16(value);
      break;
    case 32:
      encrypted = fheManager.encrypt32(value);
      break;
    case 64:
      encrypted = fheManager.encrypt64(value);
      break;
    default:
      throw new Error(`Unsupported bit size: ${bits}`);
  }

  const plaintextHash = await generateHash(value);

  return {
    handle: encrypted, // fhevmjs 0.6.x returns the handle directly
    inputProof: "0x",  // Local mode doesn't produce an input proof in the same way
    plaintextHash
  };
};

export const encryptHealthData = (score) => encryptData(score, 8);
export const encryptMentalData = (score) => encryptData(score, 8);
export const encryptFinanceData = (score) => encryptData(score, 32);

export const generatePrivacyProof = (ciphertext) => {
  return {
    algorithm: "TFHE-rs",
    mode: "Local Mock / Dev Mode",
    proof: "Local-Signed Handshake",
    gate: "Bypassed (Local Execution)",
    verifiedBy: "Client Engine"
  };
};
