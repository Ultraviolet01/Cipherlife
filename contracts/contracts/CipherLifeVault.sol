// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {FHE, euint8, euint32, externalEuint8, externalEuint32} from "@fhevm/solidity/lib/FHE.sol";
import {ZamaEthereumConfig} from "@fhevm/solidity/config/ZamaConfig.sol";

/**
 * @title CipherLifeVault
 * @dev Re-implemented for fhEVM Coprocessor on Sepolia
 */
contract CipherLifeVault is ZamaEthereumConfig {
  
  mapping(address => euint8) private healthScore;
  mapping(address => euint8) private mindScore;
  mapping(address => euint32) private financeScore;
  
  mapping(uint256 => address) private decryptionRequests;

  event HealthDataSubmitted(address indexed user);
  event MindDataSubmitted(address indexed user);
  event FinanceDataSubmitted(address indexed user);
  event ScoresDecrypted(address indexed user, uint8 health, uint8 mind);

  // Submit encrypted health data
  function submitHealthData(
    externalEuint8 encryptedScore,
    bytes calldata inputProof
  ) external {
    healthScore[msg.sender] = FHE.fromExternal(encryptedScore, inputProof);
    FHE.allowThis(healthScore[msg.sender]);
    FHE.allow(healthScore[msg.sender], msg.sender);
    emit HealthDataSubmitted(msg.sender);
  }

  // Submit encrypted mind data
  function submitMindData(
    externalEuint8 encryptedScore,
    bytes calldata inputProof
  ) external {
    mindScore[msg.sender] = FHE.fromExternal(encryptedScore, inputProof);
    FHE.allowThis(mindScore[msg.sender]);
    FHE.allow(mindScore[msg.sender], msg.sender);
    emit MindDataSubmitted(msg.sender);
  }

  // Submit encrypted finance data
  function submitFinanceData(
    externalEuint32 encryptedScore,
    bytes calldata inputProof
  ) external {
    financeScore[msg.sender] = FHE.fromExternal(encryptedScore, inputProof);
    FHE.allowThis(financeScore[msg.sender]);
    FHE.allow(financeScore[msg.sender], msg.sender);
    emit FinanceDataSubmitted(msg.sender);
  }

  // Helper for UI compatibility
  function getInsightScore() external view returns (uint256) {
    return 85; // Return a dummy score for UI progress
  }

  // Request decryption (Simplified for v0.11 compatibility)
  function requestMyScores() external {
    // In v0.11, decryption is often handled via the Gateway contract
    // or by making the handle publicly decryptable and using a relayer.
    FHE.makePubliclyDecryptable(healthScore[msg.sender]);
    FHE.makePubliclyDecryptable(mindScore[msg.sender]);
    
    emit HealthDataSubmitted(msg.sender); 
  }

  // Callback for decryption results
  function decryptionCallback(
    uint256 requestId,
    uint8 decryptedHealth,
    uint8 decryptedMind
  ) external returns (bool) {
    address user = decryptionRequests[requestId];
    emit ScoresDecrypted(user, decryptedHealth, decryptedMind);
    return true;
  }
}
