const fs = require('fs');
const path = require('path');

const buildInfoDir = path.join(__dirname, 'artifacts/build-info');
const files = fs.readdirSync(buildInfoDir);
const latestFile = files.filter(f => f.endsWith('.json'))[0]; // Assuming only one or take first

if (!latestFile) {
  console.error("No build info found");
  process.exit(1);
}

const buildInfo = JSON.parse(fs.readFileSync(path.join(buildInfoDir, latestFile), 'utf8'));
const input = buildInfo.input;

fs.writeFileSync('standard_input_extracted.json', JSON.stringify(input, null, 2));
console.log("Extracted standard input to standard_input_extracted.json");
