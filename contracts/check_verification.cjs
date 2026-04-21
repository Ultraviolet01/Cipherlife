const fs = require('fs');
const axios = require('axios');

const resultFile = 'verification_guid.txt';
const content = fs.readFileSync(resultFile, 'utf8').trim();
const guid = content;
console.log("Full GUID found:", guid);

async function checkStatus() {
  const url = `https://api.etherscan.io/v2/api?chainid=11155111&module=contract&action=checkverifystatus&guid=${guid}&apikey=A55NCWJFK6AHB3VM8UUR1UU3AZ12PD25IK`;
  try {
    const response = await axios.get(url);
    console.log("Status Response:", JSON.stringify(response.data, null, 2));
  } catch (error) {
    console.error("Error checking status:", error.message);
  }
}

checkStatus();
