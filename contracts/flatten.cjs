const fs = require('fs');
const path = require('path');

function resolveImports(filePath, seen = new Set()) {
  if (seen.has(filePath)) return '';
  seen.add(filePath);

  let content = fs.readFileSync(filePath, 'utf8');
  
  // Remove pragma and license (we'll add them at the top once)
  content = content.replace(/pragma solidity[^;]+;/g, '');
  content = content.replace(/\/\/ SPDX-License-Identifier:[^\n]+/g, '');

  const importRegex = /import\s+(?:\{[^}]+\}\s+from\s+)?["']([^"']+)["']\s*;/g;
  let match;
  let result = content;

  while ((match = importRegex.exec(content)) !== null) {
    const importPath = match[1];
    let resolvedPath;
    
    if (importPath.startsWith('.')) {
      resolvedPath = path.resolve(path.dirname(filePath), importPath);
    } else {
      resolvedPath = path.resolve(__dirname, 'node_modules', importPath);
    }

    if (fs.existsSync(resolvedPath)) {
      const importedContent = resolveImports(resolvedPath, seen);
      result = result.replace(match[0], importedContent);
    } else {
      console.warn("Could not find import:", importPath);
    }
  }

  return result;
}

const mainFile = path.resolve(__dirname, 'contracts/CipherLifeVault.sol');
const flattened = resolveImports(mainFile);

const finalContent = `// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.24;

${flattened}`;

fs.writeFileSync('CipherLifeVault_flattened_manual.sol', finalContent);
console.log("Created CipherLifeVault_flattened_manual.sol");
