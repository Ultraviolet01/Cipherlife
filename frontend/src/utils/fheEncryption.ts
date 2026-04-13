// Lazy init: only started when explicitly called
export async function initFHEWhenReady() {
  if (fheInitPromise) return fheInitPromise;
  
  fheInitPromise = (async () => {
    try {
      if (typeof window === 'undefined' || !window.ethereum) {
        console.warn('FHE: MetaMask not found');
        return null;
      }

      const { createInstance } = await import('@zama-fhe/relayer-sdk/web');
      fheInstance = await createInstance({
        chainId: 11155111,
        network: window.ethereum,
        aclContractAddress: '0xf0Ffdc93b7E186bC2f8CB3dAA75D86d1930A433D',
        kmsContractAddress: '0xbE0E383937d564D7FF0BC3b46c51f0bF8d5C311A',
        inputVerifierContractAddress: '0xBBC1fFCdc7C316aAAd72E807D9b0272BE8F84DA0',
      });

      console.log('✅ FHE initialized successfully');
      return fheInstance;
    } catch (err) {
      fheInitError = err;
      console.warn('⚠️ FHE init failed:', err.message);
      return null;
    }
  })();

  return fheInitPromise;
}

// Export safe getter (waits for lazy init if already started)
export async function getFHEInstance() {
  if (fheInstance) return fheInstance;
  if (!fheInitPromise) return null; // Didn't start yet
  return fheInitPromise;
}

export async function initFHE() {
  return initFHEWhenReady();
}

export function isFHEReady() {
  return fheInstance !== null;
}

export function getFHEError() {
  return fheInitError;
}

/**
 * Encrypted data submission flow (Helper for backward compatibility if needed)
 */
export async function encryptUint8(value, contractAddress, userAddress) {
  try {
    const fhe = await getFHEInstance();
    if (!fhe) {
      console.warn('FHE not ready, skipping encryption');
      return null;
    }
    const input = fhe.createEncryptedInput(contractAddress, userAddress);
    input.add8(value);
    const encrypted = await input.encrypt();
    return encrypted;
  } catch (err) {
    console.warn('encryptUint8 failed:', err);
    return null;
  }
}

export async function encryptUint32(value, contractAddress, userAddress) {
  try {
    const fhe = await getFHEInstance();
    if (!fhe) {
      console.warn('FHE not ready, skipping encryption');
      return null;
    }
    const input = fhe.createEncryptedInput(contractAddress, userAddress);
    input.add32(value);
    const encrypted = await input.encrypt();
    return encrypted;
  } catch (err) {
    console.warn('encryptUint32 failed:', err);
    return null;
  }
}

// Audit hashing helper
export async function hashInputs(data) {
  try {
    const msgUint8 = new TextEncoder().encode(JSON.stringify(data));
    const hashBuffer = await crypto.subtle.digest('SHA-256', msgUint8);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    return '0x' + hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  } catch (err) {
    return '0xerror';
  }
}

// Vault Logging Helper (Mocked for front-end persistence)
export function addToVaultLog(module, inputHash, resultHandle) {
  const logs = JSON.parse(localStorage.getItem('cipherlife_vault_logs') || '[]');
  const newEntry = {
    timestamp: new Date().toLocaleTimeString(),
    module,
    action: 'ENCRYPT_MODULE',
    status: 'SUCCESS',
    details: `Hash: ${inputHash}... Result: ${resultHandle}`,
    color: module === 'Health' ? '#00D4FF' : module === 'Mind' ? '#7B2FFF' : '#FFB800'
  };
  localStorage.setItem('cipherlife_vault_logs', JSON.stringify([newEntry, ...logs].slice(0, 50)));
  console.log(`[VaultLog] Added entry for ${module}`);
}
