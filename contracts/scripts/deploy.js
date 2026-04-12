import hre from "hardhat";
import fs from "fs";
import path from "path";
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  
  console.log("Deploying with account:", deployer.address);
  
  const balance = await hre.ethers.provider.getBalance(deployer.address);
  console.log("Account balance:", hre.ethers.formatEther(balance), "ETH");
  
  if (balance < 10000000000000000n) { // 0.01 ETH
    throw new Error(
      "Insufficient Sepolia ETH. Get some from https://sepoliafaucet.com"
    );
  }

  console.log("Deploying CipherLifeVault to Sepolia...");
  
  const CipherLifeVault = await hre.ethers.getContractFactory("CipherLifeVault");
  
  const vault = await CipherLifeVault.deploy();
  await vault.waitForDeployment();
  
  const address = await vault.getAddress();
  const txHash = vault.deploymentTransaction().hash;
  
  console.log("✅ CipherLifeVault deployed!");
  console.log("   Address:", address);
  console.log("   Tx Hash:", txHash);
  console.log("   Explorer: https://sepolia.etherscan.io/address/" + address);

  // Save config for frontend
  const artifactPath = path.join(__dirname, "../../frontend/src/contracts");
  
  if (!fs.existsSync(artifactPath)) {
    fs.mkdirSync(artifactPath, { recursive: true });
  }

  // Note: Artifacts might be under 'artifacts' in the root or 'contracts/artifacts'
  // Hardhat usually puts them in a folder called 'artifacts' relative to the config
  const possibleArtifactPath = path.join(
    __dirname,
    "../artifacts/contracts/CipherLifeVault.sol/CipherLifeVault.json"
  );

  if (fs.existsSync(possibleArtifactPath)) {
     const artifactData = fs.readFileSync(possibleArtifactPath, 'utf8');
     const artifact = JSON.parse(artifactData);

     const config = {
       contractAddress: address,
       network: "sepolia",
       chainId: 11155111,
       txHash: txHash,
       deployedAt: new Date().toISOString(),
       deployer: deployer.address,
       explorer: "https://sepolia.etherscan.io/address/" + address,
       abi: artifact.abi
     };

     fs.writeFileSync(
       path.join(artifactPath, "CipherLifeVault.json"),
       JSON.stringify(config, null, 2)
     );
     console.log("✅ Contract config saved to frontend.");
  } else {
     console.log("⚠️ Artifact not found, skipping sync. Run build first.");
  }

  console.log("\nNext step: Verify contract with:\nnpm run verify:contract " + address);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
