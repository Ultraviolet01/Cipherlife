import { useMemo, useState } from 'react';
import { ethers } from 'ethers';
import { useWallet } from '../context/WalletContext';
import { VAULT_CONTRACT_ADDRESS, VAULT_ABI } from '../utils/web3';

export const useCipherLifeContract = () => {
  const { signer, account } = useWallet();
  const [txStatus, setTxStatus] = useState({ loading: false, success: false, error: null });

  const contract = useMemo(() => {
    if (!signer) return null;
    return new ethers.Contract(VAULT_CONTRACT_ADDRESS, VAULT_ABI, signer);
  }, [signer]);

  const handleTx = async (txPromise) => {
    setTxStatus({ loading: true, success: false, error: null });
    try {
      const tx = await txPromise;
      await tx.wait();
      setTxStatus({ loading: false, success: true, error: null });
      return true;
    } catch (error) {
      console.error("Transaction failed:", error);
      setTxStatus({ loading: false, success: false, error: error.message || "Transaction failed" });
      return false;
    }
  };

  const submitHealth = (encryptedInputs, proof) => {
    if (!contract) return;
    // encryptedInputs is array of {handle, proof} or similar depending on fhevmjs output
    // Mapping for CipherLifeVault's expected format
    return handleTx(contract.submitHealthData(encryptedInputs, proof));
  };

  const submitMental = (encryptedInputs, proof) => {
    if (!contract) return;
    return handleTx(contract.submitMentalData(encryptedInputs, proof));
  };

  const submitFinance = (encryptedInputs, proof) => {
    if (!contract) return;
    return handleTx(contract.submitFinanceData(encryptedInputs, proof));
  };

  const requestDecryption = () => {
    if (!contract) return;
    return handleTx(contract.requestDecryption());
  };

  return {
    contract,
    txStatus,
    submitHealth,
    submitMental,
    submitFinance,
    requestDecryption
  };
};
