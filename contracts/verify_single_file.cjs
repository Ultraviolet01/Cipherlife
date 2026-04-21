const axios = require('axios');
const fs = require('fs');

async function verify() {
  const apiKey = "A55NCWJFK6AHB3VM8UUR1UU3AZ12PD25IK";
  const contractAddress = "0x26413e667a0a291EAb17C8364C88ECc50A93C9B0";
  const sourceCode = fs.readFileSync('CipherLifeVault_flattened_manual.sol', 'utf8');

  const params = new URLSearchParams();
  params.append('apikey', apiKey);
  params.append('module', 'contract');
  params.append('action', 'verifysourcecode');
  params.append('contractaddress', contractAddress);
  params.append('sourceCode', sourceCode);
  params.append('codeformat', 'solidity-single-file');
  params.append('contractname', 'CipherLifeVault');
  params.append('compilerversion', 'v0.8.24+commit.e11b9ed3');
  params.append('optimizationUsed', '1');
  params.append('runs', '200');

  try {
    const response = await axios.post('https://api.etherscan.io/v2/api?chainid=11155111', params);
    console.log("Response:", JSON.stringify(response.data, null, 2));
    if (response.data.status === '1') {
      console.log("Verification initiated! GUID:", response.data.result);
      fs.writeFileSync('verification_guid.txt', response.data.result);
    } else {
      console.log("Verification failed to initiate.");
    }
  } catch (error) {
    console.error("Error:", error.message);
  }
}

verify();
