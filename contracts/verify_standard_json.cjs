const fs = require('fs');
const axios = require('axios');

async function verify() {
  const apiKey = "A55NCWJFK6AHB3VM8UUR1UU3AZ12PD25IK";
  const contractAddress = "0x26413e667a0a291EAb17C8364C88ECc50A93C9B0";
  const standardJsonInput = fs.readFileSync('standard_input_extracted.json', 'utf8');

  const params = new URLSearchParams();
  params.append('apikey', apiKey);
  params.append('module', 'contract');
  params.append('action', 'verifysourcecode');
  params.append('contractaddress', contractAddress);
  params.append('sourceCode', standardJsonInput);
  params.append('codeformat', 'solidity-standard-json-input');
  params.append('contractname', 'contracts/CipherLifeVault.sol:CipherLifeVault');
  params.append('compilerversion', 'v0.8.24+commit.e11b9ed9');

  try {
    console.log("Submitting standard JSON verification request for", contractAddress);
    const response = await axios.post('https://api-sepolia.etherscan.io/api', params);
    console.log("Response:", response.data);
    if (response.data.result) {
        fs.writeFileSync('verification_guid_standard.txt', response.data.result);
    }
  } catch (error) {
    console.error("Error:", error.message);
  }
}

verify();
