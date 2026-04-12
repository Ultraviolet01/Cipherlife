import { initFhevm, createInstance } from 'fhevmjs';

/**
 * FHEManager Singleton
 * Manages the lifecycle of the fhevmjs engine and handles local encryption.
 */
class FHEManager {
  constructor() {
    this.instance = null;
    this.isInitialized = false;
  }

  async initialize(provider) {
    try {
      // Initialize FHEVM without gateway
      await initFhevm();

      // Get chainId from provider
      // Supports both Ethers v6 and EIP-1193 providers
      let chainId;
      if (provider.getNetwork) {
        const network = await provider.getNetwork();
        chainId = Number(network.chainId);
      } else {
        chainId = Number(await provider.request({ method: 'eth_chainId' }));
      }
      
      console.log(`FHEManager: Initializing for chainId ${chainId}`);

      // Create instance WITHOUT gateway - uses local parameters
      this.instance = await createInstance({
        chainId: chainId,
        // NO gatewayUrl - this makes it purely local
        // NO publicKey - will use default local params
      });

      this.isInitialized = true;
      console.log('FHEManager: Initialization successful');
      return this.instance;
      
    } catch (error) {
      console.error('FHEManager: Initialization failed:', error);
      throw error;
    }
  }

  getInstance() {
    if (!this.isInitialized) {
      throw new Error('FHE not initialized');
    }
    return this.instance;
  }

  // Direct encryption without gateway
  encrypt8(value) {
    if (!this.instance) throw new Error('Not initialized');
    return this.instance.encrypt8(value);
  }

  encrypt16(value) {
    if (!this.instance) throw new Error('Not initialized');
    return this.instance.encrypt16(value);
  }

  encrypt32(value) {
    if (!this.instance) throw new Error('Not initialized');
    return this.instance.encrypt32(value);
  }

  encrypt64(value) {
    if (!this.instance) throw new Error('Not initialized');
    return this.instance.encrypt64(value);
  }
}

export const fheManager = new FHEManager();
