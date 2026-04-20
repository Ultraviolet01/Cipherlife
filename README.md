# Cipherlife 🔐

[![Built with Zama FHE](https://img.shields.io/badge/Built%20with-Zama%20FHE-yellow?style=for-the-badge&logo=zama)](https://zama.ai)

Cipherlife is a privacy-first assessment engine built on **Zama's Fully Homomorphic Encryption (FHE)**. It allows for the evaluation of sensitive user data (Health, Mind, and Finance) without ever exposing the raw information to the server.

By leveraging Zama's FHE technology, Cipherlife ensures that user computations happen entirely on encrypted data, providing high-fidelity assessments while maintaining absolute data sovereignty.

## 🏗 Project Architecture

The project is structured as a monorepo containing the following components:

- **`frontend/`**: A React application (built with Vite) that handles user inputs, local encryption, and visualizes the results.
- **`backend/`**: A Node.js Express server that orchestrates the assessment flows and communicates with the ML engine.
- **`ml/`**: Python-based machine learning engine using **Concrete ML**. It processes encrypted inputs to generate scores for Health, Mental Wellness, and Financial Liquidity.
- **`contracts/`**: Hardhat-based Ethereum smart contracts for logging assessment hashes and potentially managing decentralized identity/vaults.

## 🚀 Getting Started

### Prerequisites

- Node.js (v18+)
- Python (v3.9+)
- npm or yarn

### Quick Start (Full Stack)

To run the entire stack (Frontend + Backend) concurrently from the root directory:

```bash
npm install
npm start
```

### Component Details

#### Frontend
Contains the UI for the Health, Mind, and Finance modules. Uses `framer-motion` for animations and `lucide-react` for iconography.
```bash
cd frontend
npm install
npm run dev
```

#### Backend
Handles API requests and proxies data to the ML engine.
```bash
cd backend
npm install
node index.js
```

#### ML Engine
Python scripts that implement the FHE models.
```bash
cd ml
pip install -r requirements.txt
# Models: health_model.py, mental_model.py, finance_model.py
```

#### Smart Contracts
Blockchain components for secure logging.
```bash
cd contracts
npm install
npx hardhat compile
```

## 🛠 Tech Stack

- **FHE**: Zama Concrete ML
- **Frontend**: React, Vite, Framer Motion, TailwindCSS
- **Backend**: Node.js, Express
- **ML**: Python, NumPy, Scikit-learn
- **Blockchain**: Solidity, Hardhat

## 🔒 Privacy & Security

Cipherlife uses **Fully Homomorphic Encryption** to ensure:
1. **Server Blindness**: The server processes data it cannot see.
2. **Local Encryption**: All sensitive data is encrypted on the user's device before transmission.
3. **Verifiable Results**: Hashes of assessments are logged to a secure vault/blockchain for integrity.

---
Built with 🖤 for privacy.
