// @ts-nocheck
import vaultArtifact from './vault';

export const SEPOLIA_CONFIG = {
  chainId: "0xaa36a7", // 11155111 in hex
  chainName: "Ethereum Sepolia Testnet",
  nativeCurrency: {
    name: "Sepolia ETH",
    symbol: "ETH",
    decimals: 18
  },
  rpcUrls: [
    import.meta.env.VITE_SEPOLIA_RPC_URL || 
    "https://rpc.sepolia.org"
  ],
  blockExplorerUrls: [
    "https://sepolia.etherscan.io"
  ]
};

export const VAULT_CONTRACT_ADDRESS = vaultArtifact.contractAddress;

export const getTxUrl = (hash) => 
  `https://sepolia.etherscan.io/tx/${hash}`;

export const getContractUrl = () =>
  `https://sepolia.etherscan.io/address/${VAULT_CONTRACT_ADDRESS}`;

export const switchToSepolia = async () => {
  if (!window.ethereum) return;
  try {
    await window.ethereum.request({
      method: "wallet_switchEthereumChain",
      params: [{ chainId: "0xaa36a7" }]
    });
  } catch (switchError) {
    // Network not in MetaMask yet — add it
    if (switchError.code === 4902) {
      try {
        await window.ethereum.request({
          method: "wallet_addEthereumChain",
          params: [SEPOLIA_CONFIG]
        });
      } catch (addError) {
        throw new Error(
          "Failed to add Sepolia network: " + 
          addError.message
        );
      }
    } else {
      throw switchError;
    }
  }
};

export const VAULT_ABI = vaultArtifact.abi;
