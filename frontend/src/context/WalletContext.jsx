import React, { createContext, useContext, useState, useEffect } from 'react';
import { ethers } from 'ethers';
import { SEPOLIA_CONFIG, switchToSepolia } from '../utils/web3';

const WalletContext = createContext();

export const WalletProvider = ({ children }) => {
  const [account, setAccount] = useState(null);
  const [signer, setSigner] = useState(null);
  const [provider, setProvider] = useState(null);
  const [isConnecting, setIsConnecting] = useState(false);
  const [networkError, setNetworkError] = useState(null);
  const [chainId, setChainId] = useState(null);
  const [showFaucetBanner, setShowFaucetBanner] = useState(false);

  const checkBalance = async (address, browserProvider) => {
    try {
      const balance = await browserProvider.getBalance(address);
      const balanceInEth = parseFloat(ethers.formatEther(balance));
      
      if (balanceInEth < 0.005) {
        setShowFaucetBanner(true);
      }
    } catch (err) {
      console.warn("Failed to check balance:", err);
    }
  };

  const connectWallet = async () => {
    if (!window.ethereum) {
      setNetworkError('Please install MetaMask');
      return;
    }

    setIsConnecting(true);
    try {
      const browserProvider = new ethers.BrowserProvider(window.ethereum);
      const accounts = await browserProvider.send("eth_requestAccounts", []);
      const network = await browserProvider.getNetwork();
      const currentChainId = Number(network.chainId);
      setChainId(currentChainId);

      if (currentChainId !== 11155111) {
        await switchToSepolia();
      }

      await checkBalance(accounts[0], browserProvider);

      const signerInstance = await browserProvider.getSigner();
      setAccount(accounts[0]);
      setSigner(signerInstance);
      setProvider(browserProvider);
      setNetworkError(null);
    } catch (error) {
      console.error("Connection failed:", error);
      setNetworkError('Connection rejected');
    } finally {
      setIsConnecting(false);
    }
  };

  const disconnectWallet = () => {
    setAccount(null);
    setSigner(null);
    setProvider(null);
    setChainId(null);
    setShowFaucetBanner(false);
  };

  useEffect(() => {
    if (window.ethereum) {
      window.ethereum.on('accountsChanged', (accounts) => {
        if (accounts.length > 0) {
          setAccount(accounts[0]);
          const bp = new ethers.BrowserProvider(window.ethereum);
          checkBalance(accounts[0], bp);
        } else {
          disconnectWallet();
        }
      });

      window.ethereum.on('chainChanged', (hexId) => {
        setChainId(Number(hexId));
        window.location.reload();
      });
    }
  }, []);

  return (
    <WalletContext.Provider value={{
      account,
      signer,
      provider,
      chainId,
      isConnecting,
      networkError,
      showFaucetBanner,
      setShowFaucetBanner,
      connectWallet,
      disconnectWallet,
      switchToSepolia
    }}>
      {children}
    </WalletContext.Provider>
  );
};

export const useWallet = () => useContext(WalletContext);
