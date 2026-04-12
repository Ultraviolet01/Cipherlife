// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.24;

import "@fhevm/solidity/lib/FHE.sol";
import "@fhevm/solidity/config/ZamaConfig.sol";

contract CipherLifeAccount is ZamaEthereumConfig {
    ebool private _isLocked;
    euint32 private _secureBalance;

    event BalanceUpdated();

    constructor() {
        _isLocked = FHE.asEbool(false);
        _secureBalance = FHE.asEuint32(0);
    }

    function deposit(externalEuint32 encryptedValue, bytes calldata inputProof) public {
        euint32 value = FHE.fromExternal(encryptedValue, inputProof);
        _secureBalance = FHE.add(_secureBalance, value);
        emit BalanceUpdated();
    }

    function getLockedState() public view returns (ebool) {
        return _isLocked;
    }

    // Example of a gateway call for decryption would go here
}
