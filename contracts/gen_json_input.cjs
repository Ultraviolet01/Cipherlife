const fs = require('fs');
const path = require('path');

const projectRoot = 'c:/Users/USER/Downloads/Zama/contracts';

function readFile(relPath) {
  return fs.readFileSync(path.join(projectRoot, relPath), 'utf8');
}

const input = {
  language: "Solidity",
  sources: {
    "contracts/CipherLifeVault.sol": {
      content: readFile("contracts/CipherLifeVault.sol")
    },
    "@fhevm/solidity/lib/FHE.sol": {
      content: readFile("node_modules/@fhevm/solidity/lib/FHE.sol")
    },
    "@fhevm/solidity/config/ZamaConfig.sol": {
      content: readFile("node_modules/@fhevm/solidity/config/ZamaConfig.sol")
    },
    "@fhevm/solidity/lib/Impl.sol": {
      content: readFile("node_modules/@fhevm/solidity/lib/Impl.sol")
    },
    "@fhevm/solidity/lib/cryptography/FhevmECDSA.sol": {
      content: readFile("node_modules/@fhevm/solidity/lib/cryptography/FhevmECDSA.sol")
    },
    "@fhevm/solidity/lib/FheType.sol": {
      content: readFile("node_modules/@fhevm/solidity/lib/FheType.sol")
    },
    "encrypted-types/EncryptedTypes.sol": {
      content: readFile("node_modules/encrypted-types/EncryptedTypes.sol")
    }
  },
  settings: {
    optimizer: {
      enabled: true,
      runs: 200
    },
    outputSelection: {
      "*": {
        "*": ["*"]
      }
    }
  }
};

fs.writeFileSync(path.join(projectRoot, "standard_input.json"), JSON.stringify(input, null, 2));
console.log("standard_input.json generated successfully.");
