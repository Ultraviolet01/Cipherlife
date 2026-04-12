// @ts-nocheck
const CipherLifeVault = {
  "contractAddress": "0x299C326476acd449D47Bef7a5Fbe542cF09F1DBb",
  "abi": [
    {
      "inputs": [
        { "internalType": "bytes32", "name": "handle", "type": "bytes32" },
        { "internalType": "address", "name": "sender", "type": "address" }
      ],
      "name": "SenderNotAllowedToUseHandle",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "ZamaProtocolUnsupported",
      "type": "error"
    },
    {
      "anonymous": false,
      "inputs": [
        { "indexed": true, "internalType": "address", "name": "user", "type": "address" }
      ],
      "name": "FinanceDataSubmitted",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        { "indexed": true, "internalType": "address", "name": "user", "type": "address" }
      ],
      "name": "HealthDataSubmitted",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        { "indexed": true, "internalType": "address", "name": "user", "type": "address" }
      ],
      "name": "MindDataSubmitted",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        { "indexed": true, "internalType": "address", "name": "user", "type": "address" },
        { "indexed": false, "internalType": "uint8", "name": "health", "type": "uint8" },
        { "indexed": false, "internalType": "uint8", "name": "mind", "type": "uint8" }
      ],
      "name": "ScoresDecrypted",
      "type": "event"
    },
    {
      "inputs": [],
      "name": "confidentialProtocolId",
      "outputs": [
        { "internalType": "uint256", "name": "", "type": "uint256" }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        { "internalType": "uint256", "name": "requestId", "type": "uint256" },
        { "internalType": "uint8", "name": "decryptedHealth", "type": "uint8" },
        { "internalType": "uint8", "name": "decryptedMind", "type": "uint8" }
      ],
      "name": "decryptionCallback",
      "outputs": [
        { "internalType": "bool", "name": "", "type": "bool" }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getInsightScore",
      "outputs": [
        { "internalType": "uint256", "name": "", "type": "uint256" }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "requestMyScores",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        { "internalType": "externalEuint32", "name": "encryptedScore", "type": "bytes32" },
        { "internalType": "bytes", "name": "inputProof", "type": "bytes" }
      ],
      "name": "submitFinanceData",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        { "internalType": "externalEuint8", "name": "encryptedScore", "type": "bytes32" },
        { "internalType": "bytes", "name": "inputProof", "type": "bytes" }
      ],
      "name": "submitHealthData",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        { "internalType": "externalEuint8", "name": "encryptedScore", "type": "bytes32" },
        { "internalType": "bytes", "name": "inputProof", "type": "bytes" }
      ],
      "name": "submitMindData",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]
};

export default CipherLifeVault;
