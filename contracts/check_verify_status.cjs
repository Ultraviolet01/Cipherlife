const axios = require('axios');

async function checkStatus() {
  const apiKey = "A55NCWJFK6AHB3VM8UUR1UU3AZ12PD25IK";
  const guid = "duxfx913ynr8dvn3k2akqfqej41rhfse1mf8";

  const url = `https://api.etherscan.io/v2/api?chainid=11155111&module=contract&action=checkverifystatus&guid=${guid}&apikey=${apiKey}`;

  try {
    const response = await axios.get(url);
    console.log("Status Response:", JSON.stringify(response.data, null, 2));
  } catch (error) {
    console.error("Error:", error.message);
  }
}

checkStatus();
