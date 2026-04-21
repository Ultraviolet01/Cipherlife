// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.24;













enum FheType {
    Bool,
    Uint4,
    Uint8,
    Uint16,
    Uint32,
    Uint64,
    Uint128,
    Uint160,
    Uint256,
    Uint512,
    Uint1024,
    Uint2048,
    Uint2,
    Uint6,
    Uint10,
    Uint12,
    Uint14,
    Int2,
    Int4,
    Int6,
    Int8,
    Int10,
    Int12,
    Int14,
    Int16,
    Int32,
    Int64,
    Int128,
    Int160,
    Int256,
    AsciiString,
    Int512,
    Int1024,
    Int2048,
    Uint24,
    Uint40,
    Uint48,
    Uint56,
    Uint72,
    Uint80,
    Uint88,
    Uint96,
    Uint104,
    Uint112,
    Uint120,
    Uint136,
    Uint144,
    Uint152,
    Uint168,
    Uint176,
    Uint184,
    Uint192,
    Uint200,
    Uint208,
    Uint216,
    Uint224,
    Uint232,
    Uint240,
    Uint248,
    Int24,
    Int40,
    Int48,
    Int56,
    Int72,
    Int80,
    Int88,
    Int96,
    Int104,
    Int112,
    Int120,
    Int136,
    Int144,
    Int152,
    Int168,
    Int176,
    Int184,
    Int192,
    Int200,
    Int208,
    Int216,
    Int224,
    Int232,
    Int240,
    Int248
}


/**
 * @title   CoprocessorConfig
 * @notice  This struct contains all addresses of core contracts, which are needed in a typical dApp.
 */
struct CoprocessorConfig {
    address ACLAddress;
    address CoprocessorAddress;
    address KMSVerifierAddress;
}

/**
 * @title   IFHEVMExecutor
 * @notice  This interface contains all functions to conduct FHE operations.
 */
interface IFHEVMExecutor {
    /**
     * @notice              Computes fheAdd operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheAdd(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheSub operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheSub(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheMul operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheMul(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheDiv operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheDiv(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheRem operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheRem(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheBitAnd operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheBitAnd(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheBitOr operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheBitOr(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheBitXor operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheBitXor(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheShl operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheShl(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheShr operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheShr(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheRotl operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheRotl(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheRotr operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheRotr(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheEq operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheEq(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheNe operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheNe(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheGe operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheGe(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheGt operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheGt(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheLe operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheLe(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheLt operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheLt(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheMin operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheMin(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheMax operation.
     * @param lhs           LHS.
     * @param rhs           RHS.
     * @param scalarByte    Scalar byte.
     * @return result       Result.
     */
    function fheMax(bytes32 lhs, bytes32 rhs, bytes1 scalarByte) external returns (bytes32 result);

    /**
     * @notice              Computes fheNeg operation.
     * @param ct            Ct
     * @return result       Result.
     */
    function fheNeg(bytes32 ct) external returns (bytes32 result);

    /**
     * @notice              Computes fheNot operation.
     * @param ct            Ct
     * @return result       Result.
     */
    function fheNot(bytes32 ct) external returns (bytes32 result);

    /**
     * @notice                Verifies the ciphertext.
     * @param inputHandle     Input handle.
     * @param callerAddress   Address of the caller.
     * @param inputProof      Input proof.
     * @param inputType       Input type.
     * @return result         Result.
     */
    function verifyInput(
        bytes32 inputHandle,
        address callerAddress,
        bytes memory inputProof,
        FheType inputType
    ) external returns (bytes32 result);

    /**
     * @notice          Performs the casting to a target type.
     * @param ct        Value to cast.
     * @param toType    Target type.
     * @return result   Result value of the target type.
     */
    function cast(bytes32 ct, FheType toType) external returns (bytes32 result);

    /**
     * @notice          Does trivial encryption.
     * @param ct        Value to encrypt.
     * @param toType    Target type.
     * @return result   Result value of the target type.
     */
    function trivialEncrypt(uint256 ct, FheType toType) external returns (bytes32 result);

    /**
     * @notice              Computes FHEIfThenElse operation.
     * @param control       Control value.
     * @param ifTrue        If true.
     * @param ifFalse       If false.
     * @return result       Result.
     */
    function fheIfThenElse(bytes32 control, bytes32 ifTrue, bytes32 ifFalse) external returns (bytes32 result);

    /**
     * @notice              Computes FHERand operation.
     * @param randType      Type for the random result.
     * @return result       Result.
     */
    function fheRand(FheType randType) external returns (bytes32 result);

    /**
     * @notice              Computes FHERandBounded operation.
     * @param upperBound    Upper bound value.
     * @param randType      Type for the random result.
     * @return result       Result.
     */
    function fheRandBounded(uint256 upperBound, FheType randType) external returns (bytes32 result);

    /**
     * @notice                      Returns the address of the InputVerifier contract used by the coprocessor.
     * @return inputVerifierAddress Address of the InputVerifier.
     */
    function getInputVerifierAddress() external view returns (address);
}

/**
 * @title   IACL.
 * @notice  This interface contains all functions that are used to conduct operations
 *          with the ACL contract.
 */
interface IACL {
    /**
     * @notice              Executes a batch of encoded calls on the ACL contract.
     * @param data          Array containing the ABI-encoded function calls.
     * @return results      Return payloads for each call in `data`.
     */
    function multicall(bytes[] calldata data) external payable returns (bytes[] memory results);

    /**
     * @notice              Allows the use of handle by address account for this transaction.
     * @dev                 The caller must be allowed to use handle for allowTransient() to succeed.
     *                      If not, allowTransient() reverts.
     *                      The Coprocessor contract can always allowTransient(), contrarily to allow().
     * @param ciphertext    Ciphertext.
     * @param account       Address of the account.
     */
    function allowTransient(bytes32 ciphertext, address account) external;

    /**
     * @notice              Allows the use of handle for the address account.
     * @dev                 The caller must be allowed to use handle for allow() to succeed. If not, allow() reverts.
     * @param handle        Handle.
     * @param account       Address of the account.
     */
    function allow(bytes32 handle, address account) external;

    /**
     * @dev This function removes the transient allowances, which could be useful for integration with
     *      Account Abstraction when bundling several UserOps calling the FHEVMExecutor Coprocessor.
     */
    function cleanTransientStorage() external;

    /**
     * @notice              Returns whether the account is allowed to use the handle, either due to
     *                      allowTransient() or allow().
     * @param handle        Handle.
     * @param account       Address of the account.
     * @return isAllowed    Whether the account can access the handle.
     */
    function isAllowed(bytes32 handle, address account) external view returns (bool);

    /**
     * @notice              Allows a list of handles to be decrypted.
     * @param handlesList   List of handles.
     */
    function allowForDecryption(bytes32[] memory handlesList) external;

    /**
     * @notice                  Returns wether a handle is allowed to be publicly decrypted.
     * @param handle            Handle.
     * @return isDecryptable    Whether the handle can be publicly decrypted.
     */
    function isAllowedForDecryption(bytes32 handle) external view returns (bool);

    /**
     * @notice              Returns whether the account is persistently allowed to use the handle.
     * @param handle        Handle.
     * @param account       Address of the account.
     */
    function persistAllowed(bytes32 handle, address account) external view returns (bool);

    /**
     * @notice                  Returns whether the account is on the deny list.
     * @param account           Address of the account.
     * @return isAccountDenied  Whether the account is on the deny list.
     */
    function isAccountDenied(address account) external view returns (bool);

    /**
     * @notice              Delegates user decryption rights to `delegate` for the specified `contractAddress`.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     * @param expirationDate UNIX timestamp when the delegation expires.
     */
    function delegateForUserDecryption(address delegate, address contractAddress, uint64 expirationDate) external;

    /**
     * @notice              Revokes previously delegated user decryption rights.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     */
    function revokeDelegationForUserDecryption(address delegate, address contractAddress) external;

    /**
     * @notice              Returns the expiration date for delegated user decryption rights.
     * @param delegator     The delegator account.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     */
    function getUserDecryptionDelegationExpirationDate(
        address delegator,
        address delegate,
        address contractAddress
    ) external view returns (uint64);

    /**
     * @notice Returns whether an account is delegated to access the handle for user decryption.
     * @param delegator The address of the account that delegates access to its handles.
     * @param delegate The address of the account that receives the delegation.
     * @param contractAddress The contract address to delegate access to.
     * @param handle The handle to check for delegated user decryption.
     * @return isDelegatedForUserDecryption Whether the handle can be accessed for delegated user decryption.
     */
    function isHandleDelegatedForUserDecryption(
        address delegator,
        address delegate,
        address contractAddress,
        bytes32 handle
    ) external view returns (bool);
}

/**
 * @title IInputVerifier
 * @notice This interface contains the only function required from InputVerifier.
 */
interface IInputVerifier {
    /**
     * @dev This function removes the transient allowances, which could be useful for integration with
     *      Account Abstraction when bundling several UserOps calling the FHEVMExecutor Coprocessor.
     */
    function cleanTransientStorage() external;
}

/**
 * @title   Impl
 * @notice  This library is the core implementation for computing FHE operations (e.g. add, sub, xor).
 */
library Impl {
    /// keccak256(abi.encode(uint256(keccak256("confidential.storage.config")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant CoprocessorConfigLocation =
        0x9e7b61f58c47dc699ac88507c4f5bb9f121c03808c5676a8078fe583e4649700;

    /**
     * @dev Returns the Coprocessor config.
     */
    function getCoprocessorConfig() internal pure returns (CoprocessorConfig storage $) {
        assembly {
            $.slot := CoprocessorConfigLocation
        }
    }

    /**
     * @notice                  Sets the coprocessor addresses.
     * @param coprocessorConfig Coprocessor config struct that contains contract addresses.
     */
    function setCoprocessor(CoprocessorConfig memory coprocessorConfig) internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        $.ACLAddress = coprocessorConfig.ACLAddress;
        $.CoprocessorAddress = coprocessorConfig.CoprocessorAddress;
        $.KMSVerifierAddress = coprocessorConfig.KMSVerifierAddress;
    }

    function add(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheAdd(lhs, rhs, scalarByte);
    }

    function sub(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheSub(lhs, rhs, scalarByte);
    }

    function mul(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheMul(lhs, rhs, scalarByte);
    }

    function div(bytes32 lhs, bytes32 rhs) internal returns (bytes32 result) {
        bytes1 scalarByte = 0x01;
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheDiv(lhs, rhs, scalarByte);
    }

    function rem(bytes32 lhs, bytes32 rhs) internal returns (bytes32 result) {
        bytes1 scalarByte = 0x01;
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheRem(lhs, rhs, scalarByte);
    }

    function and(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheBitAnd(lhs, rhs, scalarByte);
    }

    function or(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheBitOr(lhs, rhs, scalarByte);
    }

    function xor(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheBitXor(lhs, rhs, scalarByte);
    }

    function shl(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheShl(lhs, rhs, scalarByte);
    }

    function shr(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheShr(lhs, rhs, scalarByte);
    }

    function rotl(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheRotl(lhs, rhs, scalarByte);
    }

    function rotr(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheRotr(lhs, rhs, scalarByte);
    }

    function eq(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheEq(lhs, rhs, scalarByte);
    }

    function ne(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheNe(lhs, rhs, scalarByte);
    }

    function ge(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheGe(lhs, rhs, scalarByte);
    }

    function gt(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheGt(lhs, rhs, scalarByte);
    }

    function le(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheLe(lhs, rhs, scalarByte);
    }

    function lt(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheLt(lhs, rhs, scalarByte);
    }

    function min(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheMin(lhs, rhs, scalarByte);
    }

    function max(bytes32 lhs, bytes32 rhs, bool scalar) internal returns (bytes32 result) {
        bytes1 scalarByte;
        if (scalar) {
            scalarByte = 0x01;
        } else {
            scalarByte = 0x00;
        }
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheMax(lhs, rhs, scalarByte);
    }

    function neg(bytes32 ct) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheNeg(ct);
    }

    function not(bytes32 ct) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheNot(ct);
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(bytes32 control, bytes32 ifTrue, bytes32 ifFalse) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheIfThenElse(control, ifTrue, ifFalse);
    }

    /**
     * @notice              Verifies the ciphertext (FHEVMExecutor) and allows transient (ACL).
     * @param inputHandle   Input handle.
     * @param inputProof    Input proof.
     * @param toType        Input type.
     * @return result       Result.
     */
    function verify(bytes32 inputHandle, bytes memory inputProof, FheType toType) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).verifyInput(inputHandle, msg.sender, inputProof, toType);
        IACL($.ACLAddress).allowTransient(result, msg.sender);
    }

    /**
     * @notice            Performs the casting to a target type.
     * @param ciphertext  Ciphertext to cast.
     * @param toType      Target type.
     * @return result     Result value of the target type.
     */
    function cast(bytes32 ciphertext, FheType toType) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).cast(ciphertext, toType);
    }

    /**
     * @notice          Does trivial encryption.
     * @param value     Value to encrypt.
     * @param toType    Target type.
     * @return result   Result value of the target type.
     */
    function trivialEncrypt(uint256 value, FheType toType) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).trivialEncrypt(value, toType);
    }

    function rand(FheType randType) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheRand(randType);
    }

    function randBounded(uint256 upperBound, FheType randType) internal returns (bytes32 result) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        result = IFHEVMExecutor($.CoprocessorAddress).fheRandBounded(upperBound, randType);
    }

    /**
     * @notice              Allows the use of handle by address account for this transaction.
     * @dev                 The caller must be allowed to use handle for allowTransient() to succeed.
     *                      If not, allowTransient() reverts.
     *                      The Coprocessor contract can always allowTransient(), contrarily to allow().
     * @param handle        Handle.
     * @param account       Address of the account.
     */
    function allowTransient(bytes32 handle, address account) internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        IACL($.ACLAddress).allowTransient(handle, account);
    }

    /**
     * @notice              Allows the use of handle for the address account.
     * @dev                 The caller must be allowed to use handle for allow() to succeed. If not, allow() reverts.
     * @param handle        Handle.
     * @param account       Address of the account.
     */
    function allow(bytes32 handle, address account) internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        IACL($.ACLAddress).allow(handle, account);
    }

    /**
     * @notice              Allows the handle to be publicly decryptable.
     * @dev                 The caller must be allowed to use handle for makePubliclyDecryptable() to succeed.
     *                      If not, makePubliclyDecryptable() reverts.
     * @param handle        Handle.
     */
    function makePubliclyDecryptable(bytes32 handle) internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        bytes32[] memory handleArray = new bytes32[](1);
        handleArray[0] = handle;
        IACL($.ACLAddress).allowForDecryption(handleArray);
    }

    /**
     * @dev This function removes the transient allowances in the ACL, which could be useful for integration
     *      with Account Abstraction when bundling several UserOps calling the FHEVMExecutor Coprocessor.
     */
    function cleanTransientStorageACL() internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        IACL($.ACLAddress).cleanTransientStorage();
    }

    /**
     * @dev This function removes the transient proofs in the InputVerifier, which could be useful for integration
     *      with Account Abstraction when bundling several UserOps calling the FHEVMExecutor Coprocessor.
     */
    function cleanTransientStorageInputVerifier() internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        address inputVerifierAddress = IFHEVMExecutor($.CoprocessorAddress).getInputVerifierAddress();
        IInputVerifier(inputVerifierAddress).cleanTransientStorage();
    }

    /**
     * @notice              Returns whether the account is allowed to use the handle, either due to
     *                      allowTransient() or allow().
     * @param handle        Handle.
     * @param account       Address of the account.
     * @return isAllowed    Whether the account can access the handle.
     */
    function isAllowed(bytes32 handle, address account) internal view returns (bool) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        return IACL($.ACLAddress).isAllowed(handle, account);
    }

    /**
     * @notice              Returns whether the handle is allowed to be publicly decrypted.
     * @param handle        Handle.
     * @return isAllowed    Whether the handle can be publicly decrypted.
     */
    function isPubliclyDecryptable(bytes32 handle) internal view returns (bool) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        return IACL($.ACLAddress).isAllowedForDecryption(handle);
    }

    /**
     * @notice              Returns whether the account is persistently allowed to use the handle.
     * @param handle        Handle.
     * @param account       Address of the account.
     * @return isAllowed    Whether the account can access the handle persistently.
     */
    function persistAllowed(bytes32 handle, address account) internal view returns (bool) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        return IACL($.ACLAddress).persistAllowed(handle, account);
    }

    /**
     * @notice                  Returns whether the account is on the deny list.
     * @param account           Address of the account.
     * @return isAccountDenied  Whether the account is on the deny list.
     */
    function isAccountDenied(address account) internal view returns (bool) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        return IACL($.ACLAddress).isAccountDenied(account);
    }

    /**
     * @notice              Delegates user decryption rights to `delegate` for the specified `contractAddress`.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     * @param expirationDate UNIX timestamp when the delegation expires.
     */
    function delegateForUserDecryption(address delegate, address contractAddress, uint64 expirationDate) internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        IACL($.ACLAddress).delegateForUserDecryption(delegate, contractAddress, expirationDate);
    }

    /**
     * @notice              Delegates user decryption rights in batch leveraging the ACL multicall helper.
     * @param delegate      The delegate account.
     * @param contractAddresses Array of contract addresses forming the user decryption contexts.
     * @param expirationDate UNIX timestamp when the delegation expires.
     */
    function delegateForUserDecryptions(
        address delegate,
        address[] memory contractAddresses,
        uint64 expirationDate
    ) internal {
        uint256 length = contractAddresses.length;
        if (length == 0) {
            return;
        }

        CoprocessorConfig storage $ = getCoprocessorConfig();

        if (length == 1) {
            IACL($.ACLAddress).delegateForUserDecryption(delegate, contractAddresses[0], expirationDate);
            return;
        }

        bytes[] memory calls = new bytes[](length);
        for (uint256 i = 0; i < length; ++i) {
            calls[i] = abi.encodeCall(IACL.delegateForUserDecryption, (delegate, contractAddresses[i], expirationDate));
        }
        IACL($.ACLAddress).multicall(calls);
    }

    /**
     * @notice              Revokes previously delegated user decryption rights.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     */
    function revokeDelegationForUserDecryption(address delegate, address contractAddress) internal {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        IACL($.ACLAddress).revokeDelegationForUserDecryption(delegate, contractAddress);
    }

    /**
     * @notice              Revokes delegated user decryption rights in batch leveraging the ACL multicall helper.
     * @param delegate      The delegate account.
     * @param contractAddresses Array of contract addresses forming the user decryption contexts.
     */
    function revokeDelegationsForUserDecryption(address delegate, address[] memory contractAddresses) internal {
        uint256 length = contractAddresses.length;
        if (length == 0) {
            return;
        }

        CoprocessorConfig storage $ = getCoprocessorConfig();

        if (length == 1) {
            IACL($.ACLAddress).revokeDelegationForUserDecryption(delegate, contractAddresses[0]);
            return;
        }

        bytes[] memory calls = new bytes[](length);
        for (uint256 i = 0; i < length; ++i) {
            calls[i] = abi.encodeCall(IACL.revokeDelegationForUserDecryption, (delegate, contractAddresses[i]));
        }
        IACL($.ACLAddress).multicall(calls);
    }

    /**
     * @notice              Returns the expiration date for delegated user decryption rights.
     * @param delegator     The delegator account.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     * @return expirationDate The UNIX timestamp when the delegation expires.
     */
    function getUserDecryptionDelegationExpirationDate(
        address delegator,
        address delegate,
        address contractAddress
    ) internal view returns (uint64) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        return IACL($.ACLAddress).getUserDecryptionDelegationExpirationDate(delegator, delegate, contractAddress);
    }

    /**
     * @notice              Returns whether the handle is delegated for user decryption.
     * @param delegator     The delegator account.
     * @param delegate      The delegate account.
     * @param contractAddress The contract address forming the user decryption context.
     * @param handle          The handle.
     * @return isDelegated    Whether the handle is delegated for user decryption.
     */
    function isDelegatedForUserDecryption(
        address delegator,
        address delegate,
        address contractAddress,
        bytes32 handle
    ) internal view returns (bool) {
        CoprocessorConfig storage $ = getCoprocessorConfig();
        return IACL($.ACLAddress).isHandleDelegatedForUserDecryption(delegator, delegate, contractAddress, handle);
    }
}


// OpenZeppelin Contracts (last updated v5.5.0) (utils/cryptography/ECDSA.sol)



/**
 * @dev Elliptic Curve Digital Signature Algorithm (ECDSA) operations.
 *
 * These functions can be used to verify that a message was signed by the holder
 * of the private keys of a given address.
 *
 * @dev This library is forked from OpenZeppelin's ECDSA and renamed to FhevmECDSA
 * to avoid naming conflicts with the original when both are used in the same project.
 */
library FhevmECDSA {
    enum RecoverError {
        NoError,
        InvalidSignature,
        InvalidSignatureLength,
        InvalidSignatureS
    }

    /**
     * @dev The signature is invalid.
     */
    error ECDSAInvalidSignature();

    /**
     * @dev The signature has an invalid length.
     */
    error ECDSAInvalidSignatureLength(uint256 length);

    /**
     * @dev The signature has an S value that is in the upper half order.
     */
    error ECDSAInvalidSignatureS(bytes32 s);

    /**
     * @dev Returns the address that signed a hashed message (`hash`) with `signature` or an error. This will not
     * return address(0) without also returning an error description. Errors are documented using an enum (error type)
     * and a bytes32 providing additional information about the error.
     *
     * If no error is returned, then the address can be used for verification purposes.
     *
     * The `ecrecover` EVM precompile allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * NOTE: This function only supports 65-byte signatures. ERC-2098 short signatures are rejected. This restriction
     * is DEPRECATED and will be removed in v6.0. Developers SHOULD NOT use signatures as unique identifiers; use hash
     * invalidation or nonces for replay protection.
     *
     * IMPORTANT: `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise
     * be too long), and then calling {MessageHashUtils-toEthSignedMessageHash} on it.
     *
     * Documentation for signature generation:
     *
     * - with https://web3js.readthedocs.io/en/v1.3.4/web3-eth-accounts.html#sign[Web3.js]
     * - with https://docs.ethers.io/v5/api/signer/#Signer-signMessage[ethers]
     */
    function tryRecover(
        bytes32 hash,
        bytes memory signature
    ) internal pure returns (address recovered, RecoverError err, bytes32 errArg) {
        if (signature.length == 65) {
            bytes32 r;
            bytes32 s;
            uint8 v;
            // ecrecover takes the signature parameters, and the only way to get them
            // currently is to use assembly.
            assembly ("memory-safe") {
                r := mload(add(signature, 0x20))
                s := mload(add(signature, 0x40))
                v := byte(0, mload(add(signature, 0x60)))
            }
            return tryRecover(hash, v, r, s);
        } else {
            return (address(0), RecoverError.InvalidSignatureLength, bytes32(signature.length));
        }
    }

    /**
     * @dev Variant of {tryRecover} that takes a signature in calldata
     */
    function tryRecoverCalldata(
        bytes32 hash,
        bytes calldata signature
    ) internal pure returns (address recovered, RecoverError err, bytes32 errArg) {
        if (signature.length == 65) {
            bytes32 r;
            bytes32 s;
            uint8 v;
            // ecrecover takes the signature parameters, calldata slices would work here, but are
            // significantly more expensive (length check) than using calldataload in assembly.
            assembly ("memory-safe") {
                r := calldataload(signature.offset)
                s := calldataload(add(signature.offset, 0x20))
                v := byte(0, calldataload(add(signature.offset, 0x40)))
            }
            return tryRecover(hash, v, r, s);
        } else {
            return (address(0), RecoverError.InvalidSignatureLength, bytes32(signature.length));
        }
    }

    /**
     * @dev Returns the address that signed a hashed message (`hash`) with
     * `signature`. This address can then be used for verification purposes.
     *
     * The `ecrecover` EVM precompile allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * NOTE: This function only supports 65-byte signatures. ERC-2098 short signatures are rejected. This restriction
     * is DEPRECATED and will be removed in v6.0. Developers SHOULD NOT use signatures as unique identifiers; use hash
     * invalidation or nonces for replay protection.
     *
     * IMPORTANT: `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise
     * be too long), and then calling {MessageHashUtils-toEthSignedMessageHash} on it.
     */
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        (address recovered, RecoverError error, bytes32 errorArg) = tryRecover(hash, signature);
        _throwError(error, errorArg);
        return recovered;
    }

    /**
     * @dev Variant of {recover} that takes a signature in calldata
     */
    function recoverCalldata(bytes32 hash, bytes calldata signature) internal pure returns (address) {
        (address recovered, RecoverError error, bytes32 errorArg) = tryRecoverCalldata(hash, signature);
        _throwError(error, errorArg);
        return recovered;
    }

    /**
     * @dev Overload of {ECDSA-tryRecover} that receives the `r` and `vs` short-signature fields separately.
     *
     * See https://eips.ethereum.org/EIPS/eip-2098[ERC-2098 short signatures]
     */
    function tryRecover(
        bytes32 hash,
        bytes32 r,
        bytes32 vs
    ) internal pure returns (address recovered, RecoverError err, bytes32 errArg) {
        unchecked {
            bytes32 s = vs & bytes32(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
            // We do not check for an overflow here since the shift operation results in 0 or 1.
            uint8 v = uint8((uint256(vs) >> 255) + 27);
            return tryRecover(hash, v, r, s);
        }
    }

    /**
     * @dev Overload of {ECDSA-recover} that receives the `r` and `vs` short-signature fields separately.
     */
    function recover(bytes32 hash, bytes32 r, bytes32 vs) internal pure returns (address) {
        (address recovered, RecoverError error, bytes32 errorArg) = tryRecover(hash, r, vs);
        _throwError(error, errorArg);
        return recovered;
    }

    /**
     * @dev Overload of {ECDSA-tryRecover} that receives the `v`,
     * `r` and `s` signature fields separately.
     */
    function tryRecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal pure returns (address recovered, RecoverError err, bytes32 errArg) {
        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (301): 0 < s < secp256k1n ÷ 2 + 1, and for v in (302): v ∈ {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return (address(0), RecoverError.InvalidSignatureS, s);
        }

        // If the signature is valid (and not malleable), return the signer address
        address signer = ecrecover(hash, v, r, s);
        if (signer == address(0)) {
            return (address(0), RecoverError.InvalidSignature, bytes32(0));
        }

        return (signer, RecoverError.NoError, bytes32(0));
    }

    /**
     * @dev Overload of {ECDSA-recover} that receives the `v`,
     * `r` and `s` signature fields separately.
     */
    function recover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {
        (address recovered, RecoverError error, bytes32 errorArg) = tryRecover(hash, v, r, s);
        _throwError(error, errorArg);
        return recovered;
    }

    /**
     * @dev Parse a signature into its `v`, `r` and `s` components. Supports 65-byte and 64-byte (ERC-2098)
     * formats. Returns (0,0,0) for invalid signatures.
     *
     * For 64-byte signatures, `v` is automatically normalized to 27 or 28.
     * For 65-byte signatures, `v` is returned as-is and MUST already be 27 or 28 for use with ecrecover.
     *
     * Consider validating the result before use, or use {tryRecover}/{recover} which perform full validation.
     */
    function parse(bytes memory signature) internal pure returns (uint8 v, bytes32 r, bytes32 s) {
        assembly ("memory-safe") {
            // Check the signature length
            switch mload(signature)
            // - case 65: r,s,v signature (standard)
            case 65 {
                r := mload(add(signature, 0x20))
                s := mload(add(signature, 0x40))
                v := byte(0, mload(add(signature, 0x60)))
            }
            // - case 64: r,vs signature (cf https://eips.ethereum.org/EIPS/eip-2098)
            case 64 {
                let vs := mload(add(signature, 0x40))
                r := mload(add(signature, 0x20))
                s := and(vs, shr(1, not(0)))
                v := add(shr(255, vs), 27)
            }
            default {
                r := 0
                s := 0
                v := 0
            }
        }
    }

    /**
     * @dev Variant of {parse} that takes a signature in calldata
     */
    function parseCalldata(bytes calldata signature) internal pure returns (uint8 v, bytes32 r, bytes32 s) {
        assembly ("memory-safe") {
            // Check the signature length
            switch signature.length
            // - case 65: r,s,v signature (standard)
            case 65 {
                r := calldataload(signature.offset)
                s := calldataload(add(signature.offset, 0x20))
                v := byte(0, calldataload(add(signature.offset, 0x40)))
            }
            // - case 64: r,vs signature (cf https://eips.ethereum.org/EIPS/eip-2098)
            case 64 {
                let vs := calldataload(add(signature.offset, 0x20))
                r := calldataload(signature.offset)
                s := and(vs, shr(1, not(0)))
                v := add(shr(255, vs), 27)
            }
            default {
                r := 0
                s := 0
                v := 0
            }
        }
    }

    /**
     * @dev Optionally reverts with the corresponding custom error according to the `error` argument provided.
     */
    function _throwError(RecoverError error, bytes32 errorArg) private pure {
        if (error == RecoverError.NoError) {
            return; // no error: do nothing
        } else if (error == RecoverError.InvalidSignature) {
            revert ECDSAInvalidSignature();
        } else if (error == RecoverError.InvalidSignatureLength) {
            revert ECDSAInvalidSignatureLength(uint256(errorArg));
        } else if (error == RecoverError.InvalidSignatureS) {
            revert ECDSAInvalidSignatureS(errorArg);
        }
    }
}






type ebool is bytes32;

type euint8 is bytes32;
type euint16 is bytes32;
type euint24 is bytes32;
type euint32 is bytes32;
type euint40 is bytes32;
type euint48 is bytes32;
type euint56 is bytes32;
type euint64 is bytes32;
type euint72 is bytes32;
type euint80 is bytes32;
type euint88 is bytes32;
type euint96 is bytes32;
type euint104 is bytes32;
type euint112 is bytes32;
type euint120 is bytes32;
type euint128 is bytes32;
type euint136 is bytes32;
type euint144 is bytes32;
type euint152 is bytes32;
type euint160 is bytes32;
type euint168 is bytes32;
type euint176 is bytes32;
type euint184 is bytes32;
type euint192 is bytes32;
type euint200 is bytes32;
type euint208 is bytes32;
type euint216 is bytes32;
type euint224 is bytes32;
type euint232 is bytes32;
type euint240 is bytes32;
type euint248 is bytes32;
type euint256 is bytes32;

type eint8 is bytes32;
type eint16 is bytes32;
type eint24 is bytes32;
type eint32 is bytes32;
type eint40 is bytes32;
type eint48 is bytes32;
type eint56 is bytes32;
type eint64 is bytes32;
type eint72 is bytes32;
type eint80 is bytes32;
type eint88 is bytes32;
type eint96 is bytes32;
type eint104 is bytes32;
type eint112 is bytes32;
type eint120 is bytes32;
type eint128 is bytes32;
type eint136 is bytes32;
type eint144 is bytes32;
type eint152 is bytes32;
type eint160 is bytes32;
type eint168 is bytes32;
type eint176 is bytes32;
type eint184 is bytes32;
type eint192 is bytes32;
type eint200 is bytes32;
type eint208 is bytes32;
type eint216 is bytes32;
type eint224 is bytes32;
type eint232 is bytes32;
type eint240 is bytes32;
type eint248 is bytes32;
type eint256 is bytes32;

type eaddress is bytes32;

type ebytes1 is bytes32;
type ebytes2 is bytes32;
type ebytes3 is bytes32;
type ebytes4 is bytes32;
type ebytes5 is bytes32;
type ebytes6 is bytes32;
type ebytes7 is bytes32;
type ebytes8 is bytes32;
type ebytes9 is bytes32;
type ebytes10 is bytes32;
type ebytes11 is bytes32;
type ebytes12 is bytes32;
type ebytes13 is bytes32;
type ebytes14 is bytes32;
type ebytes15 is bytes32;
type ebytes16 is bytes32;
type ebytes17 is bytes32;
type ebytes18 is bytes32;
type ebytes19 is bytes32;
type ebytes20 is bytes32;
type ebytes21 is bytes32;
type ebytes22 is bytes32;
type ebytes23 is bytes32;
type ebytes24 is bytes32;
type ebytes25 is bytes32;
type ebytes26 is bytes32;
type ebytes27 is bytes32;
type ebytes28 is bytes32;
type ebytes29 is bytes32;
type ebytes30 is bytes32;
type ebytes31 is bytes32;
type ebytes32 is bytes32;

type externalEbool is bytes32;

type externalEuint8 is bytes32;
type externalEuint16 is bytes32;
type externalEuint24 is bytes32;
type externalEuint32 is bytes32;
type externalEuint40 is bytes32;
type externalEuint48 is bytes32;
type externalEuint56 is bytes32;
type externalEuint64 is bytes32;
type externalEuint72 is bytes32;
type externalEuint80 is bytes32;
type externalEuint88 is bytes32;
type externalEuint96 is bytes32;
type externalEuint104 is bytes32;
type externalEuint112 is bytes32;
type externalEuint120 is bytes32;
type externalEuint128 is bytes32;
type externalEuint136 is bytes32;
type externalEuint144 is bytes32;
type externalEuint152 is bytes32;
type externalEuint160 is bytes32;
type externalEuint168 is bytes32;
type externalEuint176 is bytes32;
type externalEuint184 is bytes32;
type externalEuint192 is bytes32;
type externalEuint200 is bytes32;
type externalEuint208 is bytes32;
type externalEuint216 is bytes32;
type externalEuint224 is bytes32;
type externalEuint232 is bytes32;
type externalEuint240 is bytes32;
type externalEuint248 is bytes32;
type externalEuint256 is bytes32;

type externalEint8 is bytes32;
type externalEint16 is bytes32;
type externalEint24 is bytes32;
type externalEint32 is bytes32;
type externalEint40 is bytes32;
type externalEint48 is bytes32;
type externalEint56 is bytes32;
type externalEint64 is bytes32;
type externalEint72 is bytes32;
type externalEint80 is bytes32;
type externalEint88 is bytes32;
type externalEint96 is bytes32;
type externalEint104 is bytes32;
type externalEint112 is bytes32;
type externalEint120 is bytes32;
type externalEint128 is bytes32;
type externalEint136 is bytes32;
type externalEint144 is bytes32;
type externalEint152 is bytes32;
type externalEint160 is bytes32;
type externalEint168 is bytes32;
type externalEint176 is bytes32;
type externalEint184 is bytes32;
type externalEint192 is bytes32;
type externalEint200 is bytes32;
type externalEint208 is bytes32;
type externalEint216 is bytes32;
type externalEint224 is bytes32;
type externalEint232 is bytes32;
type externalEint240 is bytes32;
type externalEint248 is bytes32;
type externalEint256 is bytes32;

type externalEaddress is bytes32;

type externalEbytes1 is bytes32;
type externalEbytes2 is bytes32;
type externalEbytes3 is bytes32;
type externalEbytes4 is bytes32;
type externalEbytes5 is bytes32;
type externalEbytes6 is bytes32;
type externalEbytes7 is bytes32;
type externalEbytes8 is bytes32;
type externalEbytes9 is bytes32;
type externalEbytes10 is bytes32;
type externalEbytes11 is bytes32;
type externalEbytes12 is bytes32;
type externalEbytes13 is bytes32;
type externalEbytes14 is bytes32;
type externalEbytes15 is bytes32;
type externalEbytes16 is bytes32;
type externalEbytes17 is bytes32;
type externalEbytes18 is bytes32;
type externalEbytes19 is bytes32;
type externalEbytes20 is bytes32;
type externalEbytes21 is bytes32;
type externalEbytes22 is bytes32;
type externalEbytes23 is bytes32;
type externalEbytes24 is bytes32;
type externalEbytes25 is bytes32;
type externalEbytes26 is bytes32;
type externalEbytes27 is bytes32;
type externalEbytes28 is bytes32;
type externalEbytes29 is bytes32;
type externalEbytes30 is bytes32;
type externalEbytes31 is bytes32;
type externalEbytes32 is bytes32;


/**
 * @title IKMSVerifier
 * @notice This interface contains the only function required from KMSVerifier.
 */
interface IKMSVerifier {
    function verifyDecryptionEIP712KMSSignatures(
        bytes32[] memory handlesList,
        bytes memory decryptedResult,
        bytes memory decryptionProof
    ) external returns (bool);

    function eip712Domain()
        external
        view
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        );

    function getThreshold() external view returns (uint256);

    function getKmsSigners() external view returns (address[] memory);
}

/**
 * @title   FHE
 * @notice  This library is the interaction point for all smart contract developers
 *          that interact with the FHEVM protocol.
 */
library FHE {
    /// @notice Decryption result typehash.
    bytes32 private constant DECRYPTION_RESULT_TYPEHASH =
        keccak256("PublicDecryptVerification(bytes32[] ctHandles,bytes decryptedResult,bytes extraData)");

    /// @notice EIP-712 domain  typehash.
    bytes32 private constant EIP712_DOMAIN_TYPEHASH =
        keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)");

    /// @notice Returned if the deserializing of the decryption proof fails.
    error DeserializingDecryptionProofFail();

    /// @notice Returned if the decryption proof is empty.
    error EmptyDecryptionProof();

    /// @notice Returned if the recovered KMS signer is not a valid KMS signer.
    /// @param invalidSigner Address of the invalid signer.
    error KMSInvalidSigner(address invalidSigner);

    /// @notice                 Returned if the number of signatures is inferior to the threshold.
    /// @param numSignatures    Number of signatures.
    error KMSSignatureThresholdNotReached(uint256 numSignatures);

    /// @notice Returned if the number of signatures is equal to 0.
    error KMSZeroSignature();

    /// @notice Returned if the returned KMS signatures are not valid.
    error InvalidKMSSignatures();

    /// @notice Returned if the sender is not allowed to use the handle.
    error SenderNotAllowedToUseHandle(bytes32 handle, address sender);

    /// @notice This event is emitted when public decryption has been successfully verified.
    event PublicDecryptionVerified(bytes32[] handlesList, bytes abiEncodedCleartexts);

    /**
     * @notice                  Sets the coprocessor addresses.
     * @param coprocessorConfig Coprocessor config struct that contains contract addresses.
     */
    function setCoprocessor(CoprocessorConfig memory coprocessorConfig) internal {
        Impl.setCoprocessor(coprocessorConfig);
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(ebool v) internal pure returns (bool) {
        return ebool.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(euint8 v) internal pure returns (bool) {
        return euint8.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(euint16 v) internal pure returns (bool) {
        return euint16.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(euint32 v) internal pure returns (bool) {
        return euint32.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(euint64 v) internal pure returns (bool) {
        return euint64.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(euint128 v) internal pure returns (bool) {
        return euint128.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(eaddress v) internal pure returns (bool) {
        return eaddress.unwrap(v) != 0;
    }

    /**
     * @dev Returns true if the encrypted integer is initialized and false otherwise.
     */
    function isInitialized(euint256 v) internal pure returns (bool) {
        return euint256.unwrap(v) != 0;
    }

    /**
     * @dev Evaluates and(ebool a, ebool b) and returns the result.
     */
    function and(ebool a, ebool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.and(ebool.unwrap(a), ebool.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(ebool a, ebool b) and returns the result.
     */
    function or(ebool a, ebool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.or(ebool.unwrap(a), ebool.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(ebool a, ebool b) and returns the result.
     */
    function xor(ebool a, ebool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.xor(ebool.unwrap(a), ebool.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(ebool a, ebool b) and returns the result.
     */
    function eq(ebool a, ebool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.eq(ebool.unwrap(a), ebool.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(ebool a, ebool b) and returns the result.
     */
    function ne(ebool a, ebool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.ne(ebool.unwrap(a), ebool.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint8 a, euint8 b)  and returns the result.
     */
    function add(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.add(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint8 a, euint8 b)  and returns the result.
     */
    function sub(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.sub(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint8 a, euint8 b)  and returns the result.
     */
    function mul(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.mul(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint8 a, euint8 b)  and returns the result.
     */
    function and(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.and(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint8 a, euint8 b)  and returns the result.
     */
    function or(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.or(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint8 a, euint8 b)  and returns the result.
     */
    function xor(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.xor(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint8 a, euint8 b)  and returns the result.
     */
    function eq(euint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint8 a, euint8 b)  and returns the result.
     */
    function ne(euint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint8 a, euint8 b)  and returns the result.
     */
    function ge(euint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint8 a, euint8 b)  and returns the result.
     */
    function gt(euint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint8 a, euint8 b)  and returns the result.
     */
    function le(euint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint8 a, euint8 b)  and returns the result.
     */
    function lt(euint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint8 a, euint8 b)  and returns the result.
     */
    function min(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.min(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint8 a, euint8 b)  and returns the result.
     */
    function max(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.max(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint8 a, euint16 b)  and returns the result.
     */
    function add(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.add(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint8 a, euint16 b)  and returns the result.
     */
    function sub(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.sub(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint8 a, euint16 b)  and returns the result.
     */
    function mul(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.mul(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint8 a, euint16 b)  and returns the result.
     */
    function and(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.and(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint8 a, euint16 b)  and returns the result.
     */
    function or(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.or(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint8 a, euint16 b)  and returns the result.
     */
    function xor(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.xor(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint8 a, euint16 b)  and returns the result.
     */
    function eq(euint8 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint8 a, euint16 b)  and returns the result.
     */
    function ne(euint8 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint8 a, euint16 b)  and returns the result.
     */
    function ge(euint8 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint8 a, euint16 b)  and returns the result.
     */
    function gt(euint8 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint8 a, euint16 b)  and returns the result.
     */
    function le(euint8 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint8 a, euint16 b)  and returns the result.
     */
    function lt(euint8 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint8 a, euint16 b)  and returns the result.
     */
    function min(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.min(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint8 a, euint16 b)  and returns the result.
     */
    function max(euint8 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.max(euint16.unwrap(asEuint16(a)), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint8 a, euint32 b)  and returns the result.
     */
    function add(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint8 a, euint32 b)  and returns the result.
     */
    function sub(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint8 a, euint32 b)  and returns the result.
     */
    function mul(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint8 a, euint32 b)  and returns the result.
     */
    function and(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint8 a, euint32 b)  and returns the result.
     */
    function or(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint8 a, euint32 b)  and returns the result.
     */
    function xor(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint8 a, euint32 b)  and returns the result.
     */
    function eq(euint8 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint8 a, euint32 b)  and returns the result.
     */
    function ne(euint8 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint8 a, euint32 b)  and returns the result.
     */
    function ge(euint8 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint8 a, euint32 b)  and returns the result.
     */
    function gt(euint8 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint8 a, euint32 b)  and returns the result.
     */
    function le(euint8 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint8 a, euint32 b)  and returns the result.
     */
    function lt(euint8 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint8 a, euint32 b)  and returns the result.
     */
    function min(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint8 a, euint32 b)  and returns the result.
     */
    function max(euint8 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint8 a, euint64 b)  and returns the result.
     */
    function add(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint8 a, euint64 b)  and returns the result.
     */
    function sub(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint8 a, euint64 b)  and returns the result.
     */
    function mul(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint8 a, euint64 b)  and returns the result.
     */
    function and(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint8 a, euint64 b)  and returns the result.
     */
    function or(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint8 a, euint64 b)  and returns the result.
     */
    function xor(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint8 a, euint64 b)  and returns the result.
     */
    function eq(euint8 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint8 a, euint64 b)  and returns the result.
     */
    function ne(euint8 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint8 a, euint64 b)  and returns the result.
     */
    function ge(euint8 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint8 a, euint64 b)  and returns the result.
     */
    function gt(euint8 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint8 a, euint64 b)  and returns the result.
     */
    function le(euint8 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint8 a, euint64 b)  and returns the result.
     */
    function lt(euint8 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint8 a, euint64 b)  and returns the result.
     */
    function min(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint8 a, euint64 b)  and returns the result.
     */
    function max(euint8 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint8 a, euint128 b)  and returns the result.
     */
    function add(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint8 a, euint128 b)  and returns the result.
     */
    function sub(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint8 a, euint128 b)  and returns the result.
     */
    function mul(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint8 a, euint128 b)  and returns the result.
     */
    function and(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint8 a, euint128 b)  and returns the result.
     */
    function or(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint8 a, euint128 b)  and returns the result.
     */
    function xor(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint8 a, euint128 b)  and returns the result.
     */
    function eq(euint8 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint8 a, euint128 b)  and returns the result.
     */
    function ne(euint8 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint8 a, euint128 b)  and returns the result.
     */
    function ge(euint8 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint8 a, euint128 b)  and returns the result.
     */
    function gt(euint8 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint8 a, euint128 b)  and returns the result.
     */
    function le(euint8 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint8 a, euint128 b)  and returns the result.
     */
    function lt(euint8 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint8 a, euint128 b)  and returns the result.
     */
    function min(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint8 a, euint128 b)  and returns the result.
     */
    function max(euint8 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint8 a, euint256 b)  and returns the result.
     */
    function and(euint8 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint8 a, euint256 b)  and returns the result.
     */
    function or(euint8 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint8 a, euint256 b)  and returns the result.
     */
    function xor(euint8 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint8 a, euint256 b)  and returns the result.
     */
    function eq(euint8 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint8 a, euint256 b)  and returns the result.
     */
    function ne(euint8 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint16 a, euint8 b)  and returns the result.
     */
    function add(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.add(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates sub(euint16 a, euint8 b)  and returns the result.
     */
    function sub(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.sub(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates mul(euint16 a, euint8 b)  and returns the result.
     */
    function mul(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.mul(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates and(euint16 a, euint8 b)  and returns the result.
     */
    function and(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.and(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates or(euint16 a, euint8 b)  and returns the result.
     */
    function or(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.or(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates xor(euint16 a, euint8 b)  and returns the result.
     */
    function xor(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.xor(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates eq(euint16 a, euint8 b)  and returns the result.
     */
    function eq(euint16 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates ne(euint16 a, euint8 b)  and returns the result.
     */
    function ne(euint16 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates ge(euint16 a, euint8 b)  and returns the result.
     */
    function ge(euint16 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates gt(euint16 a, euint8 b)  and returns the result.
     */
    function gt(euint16 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates le(euint16 a, euint8 b)  and returns the result.
     */
    function le(euint16 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates lt(euint16 a, euint8 b)  and returns the result.
     */
    function lt(euint16 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates min(euint16 a, euint8 b)  and returns the result.
     */
    function min(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.min(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates max(euint16 a, euint8 b)  and returns the result.
     */
    function max(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.max(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates add(euint16 a, euint16 b)  and returns the result.
     */
    function add(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.add(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint16 a, euint16 b)  and returns the result.
     */
    function sub(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.sub(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint16 a, euint16 b)  and returns the result.
     */
    function mul(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.mul(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint16 a, euint16 b)  and returns the result.
     */
    function and(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.and(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint16 a, euint16 b)  and returns the result.
     */
    function or(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.or(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint16 a, euint16 b)  and returns the result.
     */
    function xor(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.xor(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint16 a, euint16 b)  and returns the result.
     */
    function eq(euint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint16 a, euint16 b)  and returns the result.
     */
    function ne(euint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint16 a, euint16 b)  and returns the result.
     */
    function ge(euint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint16 a, euint16 b)  and returns the result.
     */
    function gt(euint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint16 a, euint16 b)  and returns the result.
     */
    function le(euint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint16 a, euint16 b)  and returns the result.
     */
    function lt(euint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint16 a, euint16 b)  and returns the result.
     */
    function min(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.min(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint16 a, euint16 b)  and returns the result.
     */
    function max(euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.max(euint16.unwrap(a), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint16 a, euint32 b)  and returns the result.
     */
    function add(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint16 a, euint32 b)  and returns the result.
     */
    function sub(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint16 a, euint32 b)  and returns the result.
     */
    function mul(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint16 a, euint32 b)  and returns the result.
     */
    function and(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint16 a, euint32 b)  and returns the result.
     */
    function or(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint16 a, euint32 b)  and returns the result.
     */
    function xor(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint16 a, euint32 b)  and returns the result.
     */
    function eq(euint16 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint16 a, euint32 b)  and returns the result.
     */
    function ne(euint16 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint16 a, euint32 b)  and returns the result.
     */
    function ge(euint16 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint16 a, euint32 b)  and returns the result.
     */
    function gt(euint16 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint16 a, euint32 b)  and returns the result.
     */
    function le(euint16 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint16 a, euint32 b)  and returns the result.
     */
    function lt(euint16 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint16 a, euint32 b)  and returns the result.
     */
    function min(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint16 a, euint32 b)  and returns the result.
     */
    function max(euint16 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(asEuint32(a)), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint16 a, euint64 b)  and returns the result.
     */
    function add(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint16 a, euint64 b)  and returns the result.
     */
    function sub(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint16 a, euint64 b)  and returns the result.
     */
    function mul(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint16 a, euint64 b)  and returns the result.
     */
    function and(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint16 a, euint64 b)  and returns the result.
     */
    function or(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint16 a, euint64 b)  and returns the result.
     */
    function xor(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint16 a, euint64 b)  and returns the result.
     */
    function eq(euint16 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint16 a, euint64 b)  and returns the result.
     */
    function ne(euint16 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint16 a, euint64 b)  and returns the result.
     */
    function ge(euint16 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint16 a, euint64 b)  and returns the result.
     */
    function gt(euint16 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint16 a, euint64 b)  and returns the result.
     */
    function le(euint16 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint16 a, euint64 b)  and returns the result.
     */
    function lt(euint16 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint16 a, euint64 b)  and returns the result.
     */
    function min(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint16 a, euint64 b)  and returns the result.
     */
    function max(euint16 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint16 a, euint128 b)  and returns the result.
     */
    function add(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint16 a, euint128 b)  and returns the result.
     */
    function sub(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint16 a, euint128 b)  and returns the result.
     */
    function mul(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint16 a, euint128 b)  and returns the result.
     */
    function and(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint16 a, euint128 b)  and returns the result.
     */
    function or(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint16 a, euint128 b)  and returns the result.
     */
    function xor(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint16 a, euint128 b)  and returns the result.
     */
    function eq(euint16 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint16 a, euint128 b)  and returns the result.
     */
    function ne(euint16 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint16 a, euint128 b)  and returns the result.
     */
    function ge(euint16 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint16 a, euint128 b)  and returns the result.
     */
    function gt(euint16 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint16 a, euint128 b)  and returns the result.
     */
    function le(euint16 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint16 a, euint128 b)  and returns the result.
     */
    function lt(euint16 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint16 a, euint128 b)  and returns the result.
     */
    function min(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint16 a, euint128 b)  and returns the result.
     */
    function max(euint16 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint16 a, euint256 b)  and returns the result.
     */
    function and(euint16 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint16 a, euint256 b)  and returns the result.
     */
    function or(euint16 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint16 a, euint256 b)  and returns the result.
     */
    function xor(euint16 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint16 a, euint256 b)  and returns the result.
     */
    function eq(euint16 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint16 a, euint256 b)  and returns the result.
     */
    function ne(euint16 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint32 a, euint8 b)  and returns the result.
     */
    function add(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates sub(euint32 a, euint8 b)  and returns the result.
     */
    function sub(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates mul(euint32 a, euint8 b)  and returns the result.
     */
    function mul(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates and(euint32 a, euint8 b)  and returns the result.
     */
    function and(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates or(euint32 a, euint8 b)  and returns the result.
     */
    function or(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates xor(euint32 a, euint8 b)  and returns the result.
     */
    function xor(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates eq(euint32 a, euint8 b)  and returns the result.
     */
    function eq(euint32 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates ne(euint32 a, euint8 b)  and returns the result.
     */
    function ne(euint32 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates ge(euint32 a, euint8 b)  and returns the result.
     */
    function ge(euint32 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates gt(euint32 a, euint8 b)  and returns the result.
     */
    function gt(euint32 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates le(euint32 a, euint8 b)  and returns the result.
     */
    function le(euint32 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates lt(euint32 a, euint8 b)  and returns the result.
     */
    function lt(euint32 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates min(euint32 a, euint8 b)  and returns the result.
     */
    function min(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates max(euint32 a, euint8 b)  and returns the result.
     */
    function max(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates add(euint32 a, euint16 b)  and returns the result.
     */
    function add(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates sub(euint32 a, euint16 b)  and returns the result.
     */
    function sub(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates mul(euint32 a, euint16 b)  and returns the result.
     */
    function mul(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates and(euint32 a, euint16 b)  and returns the result.
     */
    function and(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates or(euint32 a, euint16 b)  and returns the result.
     */
    function or(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates xor(euint32 a, euint16 b)  and returns the result.
     */
    function xor(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates eq(euint32 a, euint16 b)  and returns the result.
     */
    function eq(euint32 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates ne(euint32 a, euint16 b)  and returns the result.
     */
    function ne(euint32 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates ge(euint32 a, euint16 b)  and returns the result.
     */
    function ge(euint32 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates gt(euint32 a, euint16 b)  and returns the result.
     */
    function gt(euint32 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates le(euint32 a, euint16 b)  and returns the result.
     */
    function le(euint32 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates lt(euint32 a, euint16 b)  and returns the result.
     */
    function lt(euint32 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates min(euint32 a, euint16 b)  and returns the result.
     */
    function min(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates max(euint32 a, euint16 b)  and returns the result.
     */
    function max(euint32 a, euint16 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates add(euint32 a, euint32 b)  and returns the result.
     */
    function add(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint32 a, euint32 b)  and returns the result.
     */
    function sub(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint32 a, euint32 b)  and returns the result.
     */
    function mul(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint32 a, euint32 b)  and returns the result.
     */
    function and(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint32 a, euint32 b)  and returns the result.
     */
    function or(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint32 a, euint32 b)  and returns the result.
     */
    function xor(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint32 a, euint32 b)  and returns the result.
     */
    function eq(euint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint32 a, euint32 b)  and returns the result.
     */
    function ne(euint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint32 a, euint32 b)  and returns the result.
     */
    function ge(euint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint32 a, euint32 b)  and returns the result.
     */
    function gt(euint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint32 a, euint32 b)  and returns the result.
     */
    function le(euint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint32 a, euint32 b)  and returns the result.
     */
    function lt(euint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint32 a, euint32 b)  and returns the result.
     */
    function min(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint32 a, euint32 b)  and returns the result.
     */
    function max(euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(a), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint32 a, euint64 b)  and returns the result.
     */
    function add(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint32 a, euint64 b)  and returns the result.
     */
    function sub(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint32 a, euint64 b)  and returns the result.
     */
    function mul(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint32 a, euint64 b)  and returns the result.
     */
    function and(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint32 a, euint64 b)  and returns the result.
     */
    function or(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint32 a, euint64 b)  and returns the result.
     */
    function xor(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint32 a, euint64 b)  and returns the result.
     */
    function eq(euint32 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint32 a, euint64 b)  and returns the result.
     */
    function ne(euint32 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint32 a, euint64 b)  and returns the result.
     */
    function ge(euint32 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint32 a, euint64 b)  and returns the result.
     */
    function gt(euint32 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint32 a, euint64 b)  and returns the result.
     */
    function le(euint32 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint32 a, euint64 b)  and returns the result.
     */
    function lt(euint32 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint32 a, euint64 b)  and returns the result.
     */
    function min(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint32 a, euint64 b)  and returns the result.
     */
    function max(euint32 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(asEuint64(a)), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint32 a, euint128 b)  and returns the result.
     */
    function add(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint32 a, euint128 b)  and returns the result.
     */
    function sub(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint32 a, euint128 b)  and returns the result.
     */
    function mul(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint32 a, euint128 b)  and returns the result.
     */
    function and(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint32 a, euint128 b)  and returns the result.
     */
    function or(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint32 a, euint128 b)  and returns the result.
     */
    function xor(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint32 a, euint128 b)  and returns the result.
     */
    function eq(euint32 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint32 a, euint128 b)  and returns the result.
     */
    function ne(euint32 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint32 a, euint128 b)  and returns the result.
     */
    function ge(euint32 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint32 a, euint128 b)  and returns the result.
     */
    function gt(euint32 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint32 a, euint128 b)  and returns the result.
     */
    function le(euint32 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint32 a, euint128 b)  and returns the result.
     */
    function lt(euint32 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint32 a, euint128 b)  and returns the result.
     */
    function min(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint32 a, euint128 b)  and returns the result.
     */
    function max(euint32 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint32 a, euint256 b)  and returns the result.
     */
    function and(euint32 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint32 a, euint256 b)  and returns the result.
     */
    function or(euint32 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint32 a, euint256 b)  and returns the result.
     */
    function xor(euint32 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint32 a, euint256 b)  and returns the result.
     */
    function eq(euint32 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint32 a, euint256 b)  and returns the result.
     */
    function ne(euint32 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint64 a, euint8 b)  and returns the result.
     */
    function add(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates sub(euint64 a, euint8 b)  and returns the result.
     */
    function sub(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates mul(euint64 a, euint8 b)  and returns the result.
     */
    function mul(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates and(euint64 a, euint8 b)  and returns the result.
     */
    function and(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates or(euint64 a, euint8 b)  and returns the result.
     */
    function or(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates xor(euint64 a, euint8 b)  and returns the result.
     */
    function xor(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates eq(euint64 a, euint8 b)  and returns the result.
     */
    function eq(euint64 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates ne(euint64 a, euint8 b)  and returns the result.
     */
    function ne(euint64 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates ge(euint64 a, euint8 b)  and returns the result.
     */
    function ge(euint64 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates gt(euint64 a, euint8 b)  and returns the result.
     */
    function gt(euint64 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates le(euint64 a, euint8 b)  and returns the result.
     */
    function le(euint64 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates lt(euint64 a, euint8 b)  and returns the result.
     */
    function lt(euint64 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates min(euint64 a, euint8 b)  and returns the result.
     */
    function min(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates max(euint64 a, euint8 b)  and returns the result.
     */
    function max(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates add(euint64 a, euint16 b)  and returns the result.
     */
    function add(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates sub(euint64 a, euint16 b)  and returns the result.
     */
    function sub(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates mul(euint64 a, euint16 b)  and returns the result.
     */
    function mul(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates and(euint64 a, euint16 b)  and returns the result.
     */
    function and(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates or(euint64 a, euint16 b)  and returns the result.
     */
    function or(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates xor(euint64 a, euint16 b)  and returns the result.
     */
    function xor(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates eq(euint64 a, euint16 b)  and returns the result.
     */
    function eq(euint64 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates ne(euint64 a, euint16 b)  and returns the result.
     */
    function ne(euint64 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates ge(euint64 a, euint16 b)  and returns the result.
     */
    function ge(euint64 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates gt(euint64 a, euint16 b)  and returns the result.
     */
    function gt(euint64 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates le(euint64 a, euint16 b)  and returns the result.
     */
    function le(euint64 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates lt(euint64 a, euint16 b)  and returns the result.
     */
    function lt(euint64 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates min(euint64 a, euint16 b)  and returns the result.
     */
    function min(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates max(euint64 a, euint16 b)  and returns the result.
     */
    function max(euint64 a, euint16 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates add(euint64 a, euint32 b)  and returns the result.
     */
    function add(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates sub(euint64 a, euint32 b)  and returns the result.
     */
    function sub(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates mul(euint64 a, euint32 b)  and returns the result.
     */
    function mul(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates and(euint64 a, euint32 b)  and returns the result.
     */
    function and(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates or(euint64 a, euint32 b)  and returns the result.
     */
    function or(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates xor(euint64 a, euint32 b)  and returns the result.
     */
    function xor(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates eq(euint64 a, euint32 b)  and returns the result.
     */
    function eq(euint64 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates ne(euint64 a, euint32 b)  and returns the result.
     */
    function ne(euint64 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates ge(euint64 a, euint32 b)  and returns the result.
     */
    function ge(euint64 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates gt(euint64 a, euint32 b)  and returns the result.
     */
    function gt(euint64 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates le(euint64 a, euint32 b)  and returns the result.
     */
    function le(euint64 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates lt(euint64 a, euint32 b)  and returns the result.
     */
    function lt(euint64 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates min(euint64 a, euint32 b)  and returns the result.
     */
    function min(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates max(euint64 a, euint32 b)  and returns the result.
     */
    function max(euint64 a, euint32 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates add(euint64 a, euint64 b)  and returns the result.
     */
    function add(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint64 a, euint64 b)  and returns the result.
     */
    function sub(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint64 a, euint64 b)  and returns the result.
     */
    function mul(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint64 a, euint64 b)  and returns the result.
     */
    function and(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint64 a, euint64 b)  and returns the result.
     */
    function or(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint64 a, euint64 b)  and returns the result.
     */
    function xor(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint64 a, euint64 b)  and returns the result.
     */
    function eq(euint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint64 a, euint64 b)  and returns the result.
     */
    function ne(euint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint64 a, euint64 b)  and returns the result.
     */
    function ge(euint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint64 a, euint64 b)  and returns the result.
     */
    function gt(euint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint64 a, euint64 b)  and returns the result.
     */
    function le(euint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint64 a, euint64 b)  and returns the result.
     */
    function lt(euint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint64 a, euint64 b)  and returns the result.
     */
    function min(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint64 a, euint64 b)  and returns the result.
     */
    function max(euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(a), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint64 a, euint128 b)  and returns the result.
     */
    function add(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint64 a, euint128 b)  and returns the result.
     */
    function sub(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint64 a, euint128 b)  and returns the result.
     */
    function mul(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint64 a, euint128 b)  and returns the result.
     */
    function and(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint64 a, euint128 b)  and returns the result.
     */
    function or(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint64 a, euint128 b)  and returns the result.
     */
    function xor(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint64 a, euint128 b)  and returns the result.
     */
    function eq(euint64 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint64 a, euint128 b)  and returns the result.
     */
    function ne(euint64 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint64 a, euint128 b)  and returns the result.
     */
    function ge(euint64 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint64 a, euint128 b)  and returns the result.
     */
    function gt(euint64 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint64 a, euint128 b)  and returns the result.
     */
    function le(euint64 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint64 a, euint128 b)  and returns the result.
     */
    function lt(euint64 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint64 a, euint128 b)  and returns the result.
     */
    function min(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint64 a, euint128 b)  and returns the result.
     */
    function max(euint64 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(asEuint128(a)), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint64 a, euint256 b)  and returns the result.
     */
    function and(euint64 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint64 a, euint256 b)  and returns the result.
     */
    function or(euint64 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint64 a, euint256 b)  and returns the result.
     */
    function xor(euint64 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint64 a, euint256 b)  and returns the result.
     */
    function eq(euint64 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint64 a, euint256 b)  and returns the result.
     */
    function ne(euint64 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates add(euint128 a, euint8 b)  and returns the result.
     */
    function add(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates sub(euint128 a, euint8 b)  and returns the result.
     */
    function sub(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates mul(euint128 a, euint8 b)  and returns the result.
     */
    function mul(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates and(euint128 a, euint8 b)  and returns the result.
     */
    function and(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates or(euint128 a, euint8 b)  and returns the result.
     */
    function or(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates xor(euint128 a, euint8 b)  and returns the result.
     */
    function xor(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates eq(euint128 a, euint8 b)  and returns the result.
     */
    function eq(euint128 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ne(euint128 a, euint8 b)  and returns the result.
     */
    function ne(euint128 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ge(euint128 a, euint8 b)  and returns the result.
     */
    function ge(euint128 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates gt(euint128 a, euint8 b)  and returns the result.
     */
    function gt(euint128 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates le(euint128 a, euint8 b)  and returns the result.
     */
    function le(euint128 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates lt(euint128 a, euint8 b)  and returns the result.
     */
    function lt(euint128 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates min(euint128 a, euint8 b)  and returns the result.
     */
    function min(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates max(euint128 a, euint8 b)  and returns the result.
     */
    function max(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates add(euint128 a, euint16 b)  and returns the result.
     */
    function add(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates sub(euint128 a, euint16 b)  and returns the result.
     */
    function sub(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates mul(euint128 a, euint16 b)  and returns the result.
     */
    function mul(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates and(euint128 a, euint16 b)  and returns the result.
     */
    function and(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates or(euint128 a, euint16 b)  and returns the result.
     */
    function or(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates xor(euint128 a, euint16 b)  and returns the result.
     */
    function xor(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates eq(euint128 a, euint16 b)  and returns the result.
     */
    function eq(euint128 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ne(euint128 a, euint16 b)  and returns the result.
     */
    function ne(euint128 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ge(euint128 a, euint16 b)  and returns the result.
     */
    function ge(euint128 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates gt(euint128 a, euint16 b)  and returns the result.
     */
    function gt(euint128 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates le(euint128 a, euint16 b)  and returns the result.
     */
    function le(euint128 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates lt(euint128 a, euint16 b)  and returns the result.
     */
    function lt(euint128 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates min(euint128 a, euint16 b)  and returns the result.
     */
    function min(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates max(euint128 a, euint16 b)  and returns the result.
     */
    function max(euint128 a, euint16 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates add(euint128 a, euint32 b)  and returns the result.
     */
    function add(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates sub(euint128 a, euint32 b)  and returns the result.
     */
    function sub(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates mul(euint128 a, euint32 b)  and returns the result.
     */
    function mul(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates and(euint128 a, euint32 b)  and returns the result.
     */
    function and(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates or(euint128 a, euint32 b)  and returns the result.
     */
    function or(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates xor(euint128 a, euint32 b)  and returns the result.
     */
    function xor(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates eq(euint128 a, euint32 b)  and returns the result.
     */
    function eq(euint128 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ne(euint128 a, euint32 b)  and returns the result.
     */
    function ne(euint128 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ge(euint128 a, euint32 b)  and returns the result.
     */
    function ge(euint128 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates gt(euint128 a, euint32 b)  and returns the result.
     */
    function gt(euint128 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates le(euint128 a, euint32 b)  and returns the result.
     */
    function le(euint128 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates lt(euint128 a, euint32 b)  and returns the result.
     */
    function lt(euint128 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates min(euint128 a, euint32 b)  and returns the result.
     */
    function min(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates max(euint128 a, euint32 b)  and returns the result.
     */
    function max(euint128 a, euint32 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates add(euint128 a, euint64 b)  and returns the result.
     */
    function add(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates sub(euint128 a, euint64 b)  and returns the result.
     */
    function sub(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates mul(euint128 a, euint64 b)  and returns the result.
     */
    function mul(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates and(euint128 a, euint64 b)  and returns the result.
     */
    function and(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates or(euint128 a, euint64 b)  and returns the result.
     */
    function or(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates xor(euint128 a, euint64 b)  and returns the result.
     */
    function xor(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates eq(euint128 a, euint64 b)  and returns the result.
     */
    function eq(euint128 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ne(euint128 a, euint64 b)  and returns the result.
     */
    function ne(euint128 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates ge(euint128 a, euint64 b)  and returns the result.
     */
    function ge(euint128 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates gt(euint128 a, euint64 b)  and returns the result.
     */
    function gt(euint128 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates le(euint128 a, euint64 b)  and returns the result.
     */
    function le(euint128 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates lt(euint128 a, euint64 b)  and returns the result.
     */
    function lt(euint128 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates min(euint128 a, euint64 b)  and returns the result.
     */
    function min(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates max(euint128 a, euint64 b)  and returns the result.
     */
    function max(euint128 a, euint64 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates add(euint128 a, euint128 b)  and returns the result.
     */
    function add(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates sub(euint128 a, euint128 b)  and returns the result.
     */
    function sub(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint128 a, euint128 b)  and returns the result.
     */
    function mul(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint128 a, euint128 b)  and returns the result.
     */
    function and(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint128 a, euint128 b)  and returns the result.
     */
    function or(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint128 a, euint128 b)  and returns the result.
     */
    function xor(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint128 a, euint128 b)  and returns the result.
     */
    function eq(euint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint128 a, euint128 b)  and returns the result.
     */
    function ne(euint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates ge(euint128 a, euint128 b)  and returns the result.
     */
    function ge(euint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates gt(euint128 a, euint128 b)  and returns the result.
     */
    function gt(euint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates le(euint128 a, euint128 b)  and returns the result.
     */
    function le(euint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates lt(euint128 a, euint128 b)  and returns the result.
     */
    function lt(euint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates min(euint128 a, euint128 b)  and returns the result.
     */
    function min(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates max(euint128 a, euint128 b)  and returns the result.
     */
    function max(euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(a), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint128 a, euint256 b)  and returns the result.
     */
    function and(euint128 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint128 a, euint256 b)  and returns the result.
     */
    function or(euint128 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint128 a, euint256 b)  and returns the result.
     */
    function xor(euint128 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint128 a, euint256 b)  and returns the result.
     */
    function eq(euint128 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint128 a, euint256 b)  and returns the result.
     */
    function ne(euint128 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(asEuint256(a)), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(eaddress a, eaddress b) and returns the result.
     */
    function eq(eaddress a, eaddress b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEaddress(address(0));
        }
        if (!isInitialized(b)) {
            b = asEaddress(address(0));
        }
        return ebool.wrap(Impl.eq(eaddress.unwrap(a), eaddress.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(eaddress a, eaddress b) and returns the result.
     */
    function ne(eaddress a, eaddress b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEaddress(address(0));
        }
        if (!isInitialized(b)) {
            b = asEaddress(address(0));
        }
        return ebool.wrap(Impl.ne(eaddress.unwrap(a), eaddress.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(euint256 a, euint8 b)  and returns the result.
     */
    function and(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates or(euint256 a, euint8 b)  and returns the result.
     */
    function or(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates xor(euint256 a, euint8 b)  and returns the result.
     */
    function xor(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates eq(euint256 a, euint8 b)  and returns the result.
     */
    function eq(euint256 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates ne(euint256 a, euint8 b)  and returns the result.
     */
    function ne(euint256 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates and(euint256 a, euint16 b)  and returns the result.
     */
    function and(euint256 a, euint16 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates or(euint256 a, euint16 b)  and returns the result.
     */
    function or(euint256 a, euint16 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates xor(euint256 a, euint16 b)  and returns the result.
     */
    function xor(euint256 a, euint16 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates eq(euint256 a, euint16 b)  and returns the result.
     */
    function eq(euint256 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates ne(euint256 a, euint16 b)  and returns the result.
     */
    function ne(euint256 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates and(euint256 a, euint32 b)  and returns the result.
     */
    function and(euint256 a, euint32 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates or(euint256 a, euint32 b)  and returns the result.
     */
    function or(euint256 a, euint32 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates xor(euint256 a, euint32 b)  and returns the result.
     */
    function xor(euint256 a, euint32 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates eq(euint256 a, euint32 b)  and returns the result.
     */
    function eq(euint256 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates ne(euint256 a, euint32 b)  and returns the result.
     */
    function ne(euint256 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates and(euint256 a, euint64 b)  and returns the result.
     */
    function and(euint256 a, euint64 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates or(euint256 a, euint64 b)  and returns the result.
     */
    function or(euint256 a, euint64 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates xor(euint256 a, euint64 b)  and returns the result.
     */
    function xor(euint256 a, euint64 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates eq(euint256 a, euint64 b)  and returns the result.
     */
    function eq(euint256 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates ne(euint256 a, euint64 b)  and returns the result.
     */
    function ne(euint256 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates and(euint256 a, euint128 b)  and returns the result.
     */
    function and(euint256 a, euint128 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates or(euint256 a, euint128 b)  and returns the result.
     */
    function or(euint256 a, euint128 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates xor(euint256 a, euint128 b)  and returns the result.
     */
    function xor(euint256 a, euint128 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates eq(euint256 a, euint128 b)  and returns the result.
     */
    function eq(euint256 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates ne(euint256 a, euint128 b)  and returns the result.
     */
    function ne(euint256 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates and(euint256 a, euint256 b)  and returns the result.
     */
    function and(euint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates or(euint256 a, euint256 b)  and returns the result.
     */
    function or(euint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates xor(euint256 a, euint256 b)  and returns the result.
     */
    function xor(euint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates eq(euint256 a, euint256 b)  and returns the result.
     */
    function eq(euint256 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates ne(euint256 a, euint256 b)  and returns the result.
     */
    function ne(euint256 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), euint256.unwrap(b), false));
    }

    /**
     * @dev Evaluates and(ebool a, bool b) and returns the result.
     */
    function and(ebool a, bool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        return ebool.wrap(Impl.and(ebool.unwrap(a), bytes32(uint256(b ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates and(bool a, ebool b) and returns the result.
     */
    function and(bool a, ebool b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.and(ebool.unwrap(b), bytes32(uint256(a ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates or(ebool a, bool b) and returns the result.
     */
    function or(ebool a, bool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        return ebool.wrap(Impl.or(ebool.unwrap(a), bytes32(uint256(b ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates or(bool a, ebool b) and returns the result.
     */
    function or(bool a, ebool b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.or(ebool.unwrap(b), bytes32(uint256(a ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates xor(ebool a, bool b) and returns the result.
     */
    function xor(ebool a, bool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        return ebool.wrap(Impl.xor(ebool.unwrap(a), bytes32(uint256(b ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates xor(bool a, ebool b) and returns the result.
     */
    function xor(bool a, ebool b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.xor(ebool.unwrap(b), bytes32(uint256(a ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates eq(ebool a, bool b) and returns the result.
     */
    function eq(ebool a, bool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        return ebool.wrap(Impl.eq(ebool.unwrap(a), bytes32(uint256(b ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates eq(bool a, ebool b) and returns the result.
     */
    function eq(bool a, ebool b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.eq(ebool.unwrap(b), bytes32(uint256(a ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates ne(ebool a, bool b) and returns the result.
     */
    function ne(ebool a, bool b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        return ebool.wrap(Impl.ne(ebool.unwrap(a), bytes32(uint256(b ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates ne(bool a, ebool b) and returns the result.
     */
    function ne(bool a, ebool b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.ne(ebool.unwrap(b), bytes32(uint256(a ? 1 : 0)), true));
    }

    /**
     * @dev Evaluates add(euint8 a, uint8 b) and returns the result.
     */
    function add(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.add(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates add(uint8 a, euint8 b) and returns the result.
     */
    function add(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.add(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates sub(euint8 a, uint8 b) and returns the result.
     */
    function sub(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.sub(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates sub(uint8 a, euint8 b) and returns the result.
     */
    function sub(uint8 a, euint8 b) internal returns (euint8) {
        euint8 aEnc = asEuint8(a);
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.sub(euint8.unwrap(aEnc), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint8 a, uint8 b) and returns the result.
     */
    function mul(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.mul(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates mul(uint8 a, euint8 b) and returns the result.
     */
    function mul(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.mul(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates div(euint8 a, uint8 b) and returns the result.
     */
    function div(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.div(euint8.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates rem(euint8 a, uint8 b) and returns the result.
     */
    function rem(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.rem(euint8.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates and(euint8 a, uint8 b) and returns the result.
     */
    function and(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.and(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates and(uint8 a, euint8 b) and returns the result.
     */
    function and(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.and(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates or(euint8 a, uint8 b) and returns the result.
     */
    function or(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.or(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates or(uint8 a, euint8 b) and returns the result.
     */
    function or(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.or(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates xor(euint8 a, uint8 b) and returns the result.
     */
    function xor(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.xor(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates xor(uint8 a, euint8 b) and returns the result.
     */
    function xor(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.xor(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(euint8 a, uint8 b) and returns the result.
     */
    function eq(euint8 a, uint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates eq(uint8 a, euint8 b) and returns the result.
     */
    function eq(uint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.eq(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ne(euint8 a, uint8 b) and returns the result.
     */
    function ne(euint8 a, uint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ne(uint8 a, euint8 b) and returns the result.
     */
    function ne(uint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ne(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ge(euint8 a, uint8 b) and returns the result.
     */
    function ge(euint8 a, uint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ge(uint8 a, euint8 b) and returns the result.
     */
    function ge(uint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates gt(euint8 a, uint8 b) and returns the result.
     */
    function gt(euint8 a, uint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates gt(uint8 a, euint8 b) and returns the result.
     */
    function gt(uint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates le(euint8 a, uint8 b) and returns the result.
     */
    function le(euint8 a, uint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return ebool.wrap(Impl.le(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates le(uint8 a, euint8 b) and returns the result.
     */
    function le(uint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.ge(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates lt(euint8 a, uint8 b) and returns the result.
     */
    function lt(euint8 a, uint8 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return ebool.wrap(Impl.lt(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates lt(uint8 a, euint8 b) and returns the result.
     */
    function lt(uint8 a, euint8 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return ebool.wrap(Impl.gt(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates min(euint8 a, uint8 b) and returns the result.
     */
    function min(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.min(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates min(uint8 a, euint8 b) and returns the result.
     */
    function min(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.min(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates max(euint8 a, uint8 b) and returns the result.
     */
    function max(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.max(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates max(uint8 a, euint8 b) and returns the result.
     */
    function max(uint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.max(euint8.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates add(euint16 a, uint16 b) and returns the result.
     */
    function add(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.add(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates add(uint16 a, euint16 b) and returns the result.
     */
    function add(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.add(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates sub(euint16 a, uint16 b) and returns the result.
     */
    function sub(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.sub(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates sub(uint16 a, euint16 b) and returns the result.
     */
    function sub(uint16 a, euint16 b) internal returns (euint16) {
        euint16 aEnc = asEuint16(a);
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.sub(euint16.unwrap(aEnc), euint16.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint16 a, uint16 b) and returns the result.
     */
    function mul(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.mul(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates mul(uint16 a, euint16 b) and returns the result.
     */
    function mul(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.mul(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates div(euint16 a, uint16 b) and returns the result.
     */
    function div(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.div(euint16.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates rem(euint16 a, uint16 b) and returns the result.
     */
    function rem(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.rem(euint16.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates and(euint16 a, uint16 b) and returns the result.
     */
    function and(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.and(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates and(uint16 a, euint16 b) and returns the result.
     */
    function and(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.and(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates or(euint16 a, uint16 b) and returns the result.
     */
    function or(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.or(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates or(uint16 a, euint16 b) and returns the result.
     */
    function or(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.or(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates xor(euint16 a, uint16 b) and returns the result.
     */
    function xor(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.xor(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates xor(uint16 a, euint16 b) and returns the result.
     */
    function xor(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.xor(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(euint16 a, uint16 b) and returns the result.
     */
    function eq(euint16 a, uint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates eq(uint16 a, euint16 b) and returns the result.
     */
    function eq(uint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.eq(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ne(euint16 a, uint16 b) and returns the result.
     */
    function ne(euint16 a, uint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ne(uint16 a, euint16 b) and returns the result.
     */
    function ne(uint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ne(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ge(euint16 a, uint16 b) and returns the result.
     */
    function ge(euint16 a, uint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ge(uint16 a, euint16 b) and returns the result.
     */
    function ge(uint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates gt(euint16 a, uint16 b) and returns the result.
     */
    function gt(euint16 a, uint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates gt(uint16 a, euint16 b) and returns the result.
     */
    function gt(uint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates le(euint16 a, uint16 b) and returns the result.
     */
    function le(euint16 a, uint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return ebool.wrap(Impl.le(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates le(uint16 a, euint16 b) and returns the result.
     */
    function le(uint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.ge(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates lt(euint16 a, uint16 b) and returns the result.
     */
    function lt(euint16 a, uint16 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return ebool.wrap(Impl.lt(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates lt(uint16 a, euint16 b) and returns the result.
     */
    function lt(uint16 a, euint16 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return ebool.wrap(Impl.gt(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates min(euint16 a, uint16 b) and returns the result.
     */
    function min(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.min(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates min(uint16 a, euint16 b) and returns the result.
     */
    function min(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.min(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates max(euint16 a, uint16 b) and returns the result.
     */
    function max(euint16 a, uint16 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.max(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates max(uint16 a, euint16 b) and returns the result.
     */
    function max(uint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.max(euint16.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates add(euint32 a, uint32 b) and returns the result.
     */
    function add(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates add(uint32 a, euint32 b) and returns the result.
     */
    function add(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.add(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates sub(euint32 a, uint32 b) and returns the result.
     */
    function sub(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates sub(uint32 a, euint32 b) and returns the result.
     */
    function sub(uint32 a, euint32 b) internal returns (euint32) {
        euint32 aEnc = asEuint32(a);
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.sub(euint32.unwrap(aEnc), euint32.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint32 a, uint32 b) and returns the result.
     */
    function mul(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates mul(uint32 a, euint32 b) and returns the result.
     */
    function mul(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.mul(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates div(euint32 a, uint32 b) and returns the result.
     */
    function div(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.div(euint32.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates rem(euint32 a, uint32 b) and returns the result.
     */
    function rem(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.rem(euint32.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates and(euint32 a, uint32 b) and returns the result.
     */
    function and(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates and(uint32 a, euint32 b) and returns the result.
     */
    function and(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.and(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates or(euint32 a, uint32 b) and returns the result.
     */
    function or(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates or(uint32 a, euint32 b) and returns the result.
     */
    function or(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.or(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates xor(euint32 a, uint32 b) and returns the result.
     */
    function xor(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates xor(uint32 a, euint32 b) and returns the result.
     */
    function xor(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.xor(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(euint32 a, uint32 b) and returns the result.
     */
    function eq(euint32 a, uint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates eq(uint32 a, euint32 b) and returns the result.
     */
    function eq(uint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.eq(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ne(euint32 a, uint32 b) and returns the result.
     */
    function ne(euint32 a, uint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ne(uint32 a, euint32 b) and returns the result.
     */
    function ne(uint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ne(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ge(euint32 a, uint32 b) and returns the result.
     */
    function ge(euint32 a, uint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ge(uint32 a, euint32 b) and returns the result.
     */
    function ge(uint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates gt(euint32 a, uint32 b) and returns the result.
     */
    function gt(euint32 a, uint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates gt(uint32 a, euint32 b) and returns the result.
     */
    function gt(uint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates le(euint32 a, uint32 b) and returns the result.
     */
    function le(euint32 a, uint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return ebool.wrap(Impl.le(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates le(uint32 a, euint32 b) and returns the result.
     */
    function le(uint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.ge(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates lt(euint32 a, uint32 b) and returns the result.
     */
    function lt(euint32 a, uint32 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return ebool.wrap(Impl.lt(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates lt(uint32 a, euint32 b) and returns the result.
     */
    function lt(uint32 a, euint32 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return ebool.wrap(Impl.gt(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates min(euint32 a, uint32 b) and returns the result.
     */
    function min(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates min(uint32 a, euint32 b) and returns the result.
     */
    function min(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.min(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates max(euint32 a, uint32 b) and returns the result.
     */
    function max(euint32 a, uint32 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates max(uint32 a, euint32 b) and returns the result.
     */
    function max(uint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.max(euint32.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates add(euint64 a, uint64 b) and returns the result.
     */
    function add(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates add(uint64 a, euint64 b) and returns the result.
     */
    function add(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.add(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates sub(euint64 a, uint64 b) and returns the result.
     */
    function sub(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates sub(uint64 a, euint64 b) and returns the result.
     */
    function sub(uint64 a, euint64 b) internal returns (euint64) {
        euint64 aEnc = asEuint64(a);
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.sub(euint64.unwrap(aEnc), euint64.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint64 a, uint64 b) and returns the result.
     */
    function mul(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates mul(uint64 a, euint64 b) and returns the result.
     */
    function mul(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.mul(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates div(euint64 a, uint64 b) and returns the result.
     */
    function div(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.div(euint64.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates rem(euint64 a, uint64 b) and returns the result.
     */
    function rem(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.rem(euint64.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates and(euint64 a, uint64 b) and returns the result.
     */
    function and(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates and(uint64 a, euint64 b) and returns the result.
     */
    function and(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.and(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates or(euint64 a, uint64 b) and returns the result.
     */
    function or(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates or(uint64 a, euint64 b) and returns the result.
     */
    function or(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.or(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates xor(euint64 a, uint64 b) and returns the result.
     */
    function xor(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates xor(uint64 a, euint64 b) and returns the result.
     */
    function xor(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.xor(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(euint64 a, uint64 b) and returns the result.
     */
    function eq(euint64 a, uint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates eq(uint64 a, euint64 b) and returns the result.
     */
    function eq(uint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.eq(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ne(euint64 a, uint64 b) and returns the result.
     */
    function ne(euint64 a, uint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ne(uint64 a, euint64 b) and returns the result.
     */
    function ne(uint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ne(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ge(euint64 a, uint64 b) and returns the result.
     */
    function ge(euint64 a, uint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ge(uint64 a, euint64 b) and returns the result.
     */
    function ge(uint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates gt(euint64 a, uint64 b) and returns the result.
     */
    function gt(euint64 a, uint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates gt(uint64 a, euint64 b) and returns the result.
     */
    function gt(uint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates le(euint64 a, uint64 b) and returns the result.
     */
    function le(euint64 a, uint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return ebool.wrap(Impl.le(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates le(uint64 a, euint64 b) and returns the result.
     */
    function le(uint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.ge(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates lt(euint64 a, uint64 b) and returns the result.
     */
    function lt(euint64 a, uint64 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return ebool.wrap(Impl.lt(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates lt(uint64 a, euint64 b) and returns the result.
     */
    function lt(uint64 a, euint64 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return ebool.wrap(Impl.gt(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates min(euint64 a, uint64 b) and returns the result.
     */
    function min(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates min(uint64 a, euint64 b) and returns the result.
     */
    function min(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.min(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates max(euint64 a, uint64 b) and returns the result.
     */
    function max(euint64 a, uint64 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates max(uint64 a, euint64 b) and returns the result.
     */
    function max(uint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.max(euint64.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates add(euint128 a, uint128 b) and returns the result.
     */
    function add(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates add(uint128 a, euint128 b) and returns the result.
     */
    function add(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.add(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates sub(euint128 a, uint128 b) and returns the result.
     */
    function sub(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates sub(uint128 a, euint128 b) and returns the result.
     */
    function sub(uint128 a, euint128 b) internal returns (euint128) {
        euint128 aEnc = asEuint128(a);
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.sub(euint128.unwrap(aEnc), euint128.unwrap(b), false));
    }

    /**
     * @dev Evaluates mul(euint128 a, uint128 b) and returns the result.
     */
    function mul(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates mul(uint128 a, euint128 b) and returns the result.
     */
    function mul(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.mul(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates div(euint128 a, uint128 b) and returns the result.
     */
    function div(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.div(euint128.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates rem(euint128 a, uint128 b) and returns the result.
     */
    function rem(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.rem(euint128.unwrap(a), bytes32(uint256(b))));
    }

    /**
     * @dev Evaluates and(euint128 a, uint128 b) and returns the result.
     */
    function and(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates and(uint128 a, euint128 b) and returns the result.
     */
    function and(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.and(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates or(euint128 a, uint128 b) and returns the result.
     */
    function or(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates or(uint128 a, euint128 b) and returns the result.
     */
    function or(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.or(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates xor(euint128 a, uint128 b) and returns the result.
     */
    function xor(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates xor(uint128 a, euint128 b) and returns the result.
     */
    function xor(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.xor(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(euint128 a, uint128 b) and returns the result.
     */
    function eq(euint128 a, uint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates eq(uint128 a, euint128 b) and returns the result.
     */
    function eq(uint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.eq(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ne(euint128 a, uint128 b) and returns the result.
     */
    function ne(euint128 a, uint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ne(uint128 a, euint128 b) and returns the result.
     */
    function ne(uint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ne(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ge(euint128 a, uint128 b) and returns the result.
     */
    function ge(euint128 a, uint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ge(uint128 a, euint128 b) and returns the result.
     */
    function ge(uint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates gt(euint128 a, uint128 b) and returns the result.
     */
    function gt(euint128 a, uint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates gt(uint128 a, euint128 b) and returns the result.
     */
    function gt(uint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates le(euint128 a, uint128 b) and returns the result.
     */
    function le(euint128 a, uint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return ebool.wrap(Impl.le(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates le(uint128 a, euint128 b) and returns the result.
     */
    function le(uint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.ge(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates lt(euint128 a, uint128 b) and returns the result.
     */
    function lt(euint128 a, uint128 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return ebool.wrap(Impl.lt(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates lt(uint128 a, euint128 b) and returns the result.
     */
    function lt(uint128 a, euint128 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return ebool.wrap(Impl.gt(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates min(euint128 a, uint128 b) and returns the result.
     */
    function min(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates min(uint128 a, euint128 b) and returns the result.
     */
    function min(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.min(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates max(euint128 a, uint128 b) and returns the result.
     */
    function max(euint128 a, uint128 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates max(uint128 a, euint128 b) and returns the result.
     */
    function max(uint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.max(euint128.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(eaddress a, address b) and returns the result.
     */
    function eq(eaddress a, address b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEaddress(address(0));
        }
        return ebool.wrap(Impl.eq(eaddress.unwrap(a), bytes32(uint256(uint160(b))), true));
    }

    /**
     * @dev Evaluates eq(address a, eaddress b) and returns the result.
     */
    function eq(address a, eaddress b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEaddress(address(0));
        }
        return ebool.wrap(Impl.eq(eaddress.unwrap(b), bytes32(uint256(uint160(a))), true));
    }

    /**
     * @dev Evaluates ne(eaddress a, address b) and returns the result.
     */
    function ne(eaddress a, address b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEaddress(address(0));
        }
        return ebool.wrap(Impl.ne(eaddress.unwrap(a), bytes32(uint256(uint160(b))), true));
    }

    /**
     * @dev Evaluates ne(address a, eaddress b) and returns the result.
     */
    function ne(address a, eaddress b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEaddress(address(0));
        }
        return ebool.wrap(Impl.ne(eaddress.unwrap(b), bytes32(uint256(uint160(a))), true));
    }

    /**
     * @dev Evaluates and(euint256 a, uint256 b) and returns the result.
     */
    function and(euint256 a, uint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates and(uint256 a, euint256 b) and returns the result.
     */
    function and(uint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.and(euint256.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates or(euint256 a, uint256 b) and returns the result.
     */
    function or(euint256 a, uint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates or(uint256 a, euint256 b) and returns the result.
     */
    function or(uint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.or(euint256.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates xor(euint256 a, uint256 b) and returns the result.
     */
    function xor(euint256 a, uint256 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates xor(uint256 a, euint256 b) and returns the result.
     */
    function xor(uint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.xor(euint256.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates eq(euint256 a, uint256 b) and returns the result.
     */
    function eq(euint256 a, uint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates eq(uint256 a, euint256 b) and returns the result.
     */
    function eq(uint256 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.eq(euint256.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates ne(euint256 a, uint256 b) and returns the result.
     */
    function ne(euint256 a, uint256 b) internal returns (ebool) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates ne(uint256 a, euint256 b) and returns the result.
     */
    function ne(uint256 a, euint256 b) internal returns (ebool) {
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return ebool.wrap(Impl.ne(euint256.unwrap(b), bytes32(uint256(a)), true));
    }

    /**
     * @dev Evaluates shl(euint8 a, euint8 b) and returns the result.
     */
    function shl(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.shl(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates shl(euint8 a, uint8) and returns the result.
     */
    function shl(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.shl(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shr(euint8 a, euint8 b) and returns the result.
     */
    function shr(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.shr(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates shr(euint8 a, uint8) and returns the result.
     */
    function shr(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.shr(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotl(euint8 a, euint8 b) and returns the result.
     */
    function rotl(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.rotl(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates rotl(euint8 a, uint8) and returns the result.
     */
    function rotl(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.rotl(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotr(euint8 a, euint8 b) and returns the result.
     */
    function rotr(euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.rotr(euint8.unwrap(a), euint8.unwrap(b), false));
    }

    /**
     * @dev Evaluates rotr(euint8 a, uint8) and returns the result.
     */
    function rotr(euint8 a, uint8 b) internal returns (euint8) {
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        return euint8.wrap(Impl.rotr(euint8.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shl(euint16 a, euint8 b) and returns the result.
     */
    function shl(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.shl(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates shl(euint16 a, uint8) and returns the result.
     */
    function shl(euint16 a, uint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.shl(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shr(euint16 a, euint8 b) and returns the result.
     */
    function shr(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.shr(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates shr(euint16 a, uint8) and returns the result.
     */
    function shr(euint16 a, uint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.shr(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotl(euint16 a, euint8 b) and returns the result.
     */
    function rotl(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.rotl(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates rotl(euint16 a, uint8) and returns the result.
     */
    function rotl(euint16 a, uint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.rotl(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotr(euint16 a, euint8 b) and returns the result.
     */
    function rotr(euint16 a, euint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint16.wrap(Impl.rotr(euint16.unwrap(a), euint16.unwrap(asEuint16(b)), false));
    }

    /**
     * @dev Evaluates rotr(euint16 a, uint8) and returns the result.
     */
    function rotr(euint16 a, uint8 b) internal returns (euint16) {
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        return euint16.wrap(Impl.rotr(euint16.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shl(euint32 a, euint8 b) and returns the result.
     */
    function shl(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.shl(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates shl(euint32 a, uint8) and returns the result.
     */
    function shl(euint32 a, uint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.shl(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shr(euint32 a, euint8 b) and returns the result.
     */
    function shr(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.shr(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates shr(euint32 a, uint8) and returns the result.
     */
    function shr(euint32 a, uint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.shr(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotl(euint32 a, euint8 b) and returns the result.
     */
    function rotl(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.rotl(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates rotl(euint32 a, uint8) and returns the result.
     */
    function rotl(euint32 a, uint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.rotl(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotr(euint32 a, euint8 b) and returns the result.
     */
    function rotr(euint32 a, euint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint32.wrap(Impl.rotr(euint32.unwrap(a), euint32.unwrap(asEuint32(b)), false));
    }

    /**
     * @dev Evaluates rotr(euint32 a, uint8) and returns the result.
     */
    function rotr(euint32 a, uint8 b) internal returns (euint32) {
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        return euint32.wrap(Impl.rotr(euint32.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shl(euint64 a, euint8 b) and returns the result.
     */
    function shl(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.shl(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates shl(euint64 a, uint8) and returns the result.
     */
    function shl(euint64 a, uint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.shl(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shr(euint64 a, euint8 b) and returns the result.
     */
    function shr(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.shr(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates shr(euint64 a, uint8) and returns the result.
     */
    function shr(euint64 a, uint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.shr(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotl(euint64 a, euint8 b) and returns the result.
     */
    function rotl(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.rotl(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates rotl(euint64 a, uint8) and returns the result.
     */
    function rotl(euint64 a, uint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.rotl(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotr(euint64 a, euint8 b) and returns the result.
     */
    function rotr(euint64 a, euint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint64.wrap(Impl.rotr(euint64.unwrap(a), euint64.unwrap(asEuint64(b)), false));
    }

    /**
     * @dev Evaluates rotr(euint64 a, uint8) and returns the result.
     */
    function rotr(euint64 a, uint8 b) internal returns (euint64) {
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        return euint64.wrap(Impl.rotr(euint64.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shl(euint128 a, euint8 b) and returns the result.
     */
    function shl(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.shl(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates shl(euint128 a, uint8) and returns the result.
     */
    function shl(euint128 a, uint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.shl(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shr(euint128 a, euint8 b) and returns the result.
     */
    function shr(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.shr(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates shr(euint128 a, uint8) and returns the result.
     */
    function shr(euint128 a, uint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.shr(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotl(euint128 a, euint8 b) and returns the result.
     */
    function rotl(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.rotl(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates rotl(euint128 a, uint8) and returns the result.
     */
    function rotl(euint128 a, uint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.rotl(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotr(euint128 a, euint8 b) and returns the result.
     */
    function rotr(euint128 a, euint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint128.wrap(Impl.rotr(euint128.unwrap(a), euint128.unwrap(asEuint128(b)), false));
    }

    /**
     * @dev Evaluates rotr(euint128 a, uint8) and returns the result.
     */
    function rotr(euint128 a, uint8 b) internal returns (euint128) {
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        return euint128.wrap(Impl.rotr(euint128.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shl(euint256 a, euint8 b) and returns the result.
     */
    function shl(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.shl(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates shl(euint256 a, uint8) and returns the result.
     */
    function shl(euint256 a, uint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.shl(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates shr(euint256 a, euint8 b) and returns the result.
     */
    function shr(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.shr(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates shr(euint256 a, uint8) and returns the result.
     */
    function shr(euint256 a, uint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.shr(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotl(euint256 a, euint8 b) and returns the result.
     */
    function rotl(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.rotl(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates rotl(euint256 a, uint8) and returns the result.
     */
    function rotl(euint256 a, uint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.rotl(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev Evaluates rotr(euint256 a, euint8 b) and returns the result.
     */
    function rotr(euint256 a, euint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint256.wrap(Impl.rotr(euint256.unwrap(a), euint256.unwrap(asEuint256(b)), false));
    }

    /**
     * @dev Evaluates rotr(euint256 a, uint8) and returns the result.
     */
    function rotr(euint256 a, uint8 b) internal returns (euint256) {
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        return euint256.wrap(Impl.rotr(euint256.unwrap(a), bytes32(uint256(b)), true));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, ebool a, ebool b) internal returns (ebool) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEbool(false);
        }
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return ebool.wrap(Impl.select(ebool.unwrap(control), ebool.unwrap(a), ebool.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, euint8 a, euint8 b) internal returns (euint8) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEuint8(0);
        }
        if (!isInitialized(b)) {
            b = asEuint8(0);
        }
        return euint8.wrap(Impl.select(ebool.unwrap(control), euint8.unwrap(a), euint8.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, euint16 a, euint16 b) internal returns (euint16) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEuint16(0);
        }
        if (!isInitialized(b)) {
            b = asEuint16(0);
        }
        return euint16.wrap(Impl.select(ebool.unwrap(control), euint16.unwrap(a), euint16.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, euint32 a, euint32 b) internal returns (euint32) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEuint32(0);
        }
        if (!isInitialized(b)) {
            b = asEuint32(0);
        }
        return euint32.wrap(Impl.select(ebool.unwrap(control), euint32.unwrap(a), euint32.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, euint64 a, euint64 b) internal returns (euint64) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEuint64(0);
        }
        if (!isInitialized(b)) {
            b = asEuint64(0);
        }
        return euint64.wrap(Impl.select(ebool.unwrap(control), euint64.unwrap(a), euint64.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, euint128 a, euint128 b) internal returns (euint128) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEuint128(0);
        }
        if (!isInitialized(b)) {
            b = asEuint128(0);
        }
        return euint128.wrap(Impl.select(ebool.unwrap(control), euint128.unwrap(a), euint128.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, eaddress a, eaddress b) internal returns (eaddress) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEaddress(address(0));
        }
        if (!isInitialized(b)) {
            b = asEaddress(address(0));
        }
        return eaddress.wrap(Impl.select(ebool.unwrap(control), eaddress.unwrap(a), eaddress.unwrap(b)));
    }

    /**
     * @dev If 'control's value is 'true', the result has the same value as 'ifTrue'.
     *      If 'control's value is 'false', the result has the same value as 'ifFalse'.
     */
    function select(ebool control, euint256 a, euint256 b) internal returns (euint256) {
        if (!isInitialized(control)) {
            control = asEbool(false);
        }
        if (!isInitialized(a)) {
            a = asEuint256(0);
        }
        if (!isInitialized(b)) {
            b = asEuint256(0);
        }
        return euint256.wrap(Impl.select(ebool.unwrap(control), euint256.unwrap(a), euint256.unwrap(b)));
    }

    /**
     * @dev Casts an encrypted integer from 'euint16' to 'euint8'.
     */
    function asEuint8(euint16 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint8.wrap(Impl.cast(euint16.unwrap(value), FheType.Uint8));
    }

    /**
     * @dev Casts an encrypted integer from 'euint32' to 'euint8'.
     */
    function asEuint8(euint32 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint8.wrap(Impl.cast(euint32.unwrap(value), FheType.Uint8));
    }

    /**
     * @dev Casts an encrypted integer from 'euint64' to 'euint8'.
     */
    function asEuint8(euint64 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint8.wrap(Impl.cast(euint64.unwrap(value), FheType.Uint8));
    }

    /**
     * @dev Casts an encrypted integer from 'euint128' to 'euint8'.
     */
    function asEuint8(euint128 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint8.wrap(Impl.cast(euint128.unwrap(value), FheType.Uint8));
    }

    /**
     * @dev Casts an encrypted integer from 'euint256' to 'euint8'.
     */
    function asEuint8(euint256 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint8.wrap(Impl.cast(euint256.unwrap(value), FheType.Uint8));
    }

    /**
    /** 
     * @dev Converts an 'ebool' to an 'euint8'.
     */
    function asEuint8(ebool b) internal returns (euint8) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return euint8.wrap(Impl.cast(ebool.unwrap(b), FheType.Uint8));
    }

    /**
     * @dev Casts an encrypted integer from 'euint8' to 'ebool'.
     */
    function asEbool(euint8 value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return ne(value, 0);
    }

    /**
     * @dev Casts an encrypted integer from 'euint8' to 'euint16'.
     */
    function asEuint16(euint8 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint16.wrap(Impl.cast(euint8.unwrap(value), FheType.Uint16));
    }

    /**
     * @dev Casts an encrypted integer from 'euint32' to 'euint16'.
     */
    function asEuint16(euint32 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint16.wrap(Impl.cast(euint32.unwrap(value), FheType.Uint16));
    }

    /**
     * @dev Casts an encrypted integer from 'euint64' to 'euint16'.
     */
    function asEuint16(euint64 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint16.wrap(Impl.cast(euint64.unwrap(value), FheType.Uint16));
    }

    /**
     * @dev Casts an encrypted integer from 'euint128' to 'euint16'.
     */
    function asEuint16(euint128 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint16.wrap(Impl.cast(euint128.unwrap(value), FheType.Uint16));
    }

    /**
     * @dev Casts an encrypted integer from 'euint256' to 'euint16'.
     */
    function asEuint16(euint256 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint16.wrap(Impl.cast(euint256.unwrap(value), FheType.Uint16));
    }

    /**
    /** 
     * @dev Converts an 'ebool' to an 'euint16'.
     */
    function asEuint16(ebool b) internal returns (euint16) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return euint16.wrap(Impl.cast(ebool.unwrap(b), FheType.Uint16));
    }

    /**
     * @dev Casts an encrypted integer from 'euint16' to 'ebool'.
     */
    function asEbool(euint16 value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return ne(value, 0);
    }

    /**
     * @dev Casts an encrypted integer from 'euint8' to 'euint32'.
     */
    function asEuint32(euint8 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint32.wrap(Impl.cast(euint8.unwrap(value), FheType.Uint32));
    }

    /**
     * @dev Casts an encrypted integer from 'euint16' to 'euint32'.
     */
    function asEuint32(euint16 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint32.wrap(Impl.cast(euint16.unwrap(value), FheType.Uint32));
    }

    /**
     * @dev Casts an encrypted integer from 'euint64' to 'euint32'.
     */
    function asEuint32(euint64 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint32.wrap(Impl.cast(euint64.unwrap(value), FheType.Uint32));
    }

    /**
     * @dev Casts an encrypted integer from 'euint128' to 'euint32'.
     */
    function asEuint32(euint128 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint32.wrap(Impl.cast(euint128.unwrap(value), FheType.Uint32));
    }

    /**
     * @dev Casts an encrypted integer from 'euint256' to 'euint32'.
     */
    function asEuint32(euint256 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint32.wrap(Impl.cast(euint256.unwrap(value), FheType.Uint32));
    }

    /**
    /** 
     * @dev Converts an 'ebool' to an 'euint32'.
     */
    function asEuint32(ebool b) internal returns (euint32) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return euint32.wrap(Impl.cast(ebool.unwrap(b), FheType.Uint32));
    }

    /**
     * @dev Casts an encrypted integer from 'euint32' to 'ebool'.
     */
    function asEbool(euint32 value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return ne(value, 0);
    }

    /**
     * @dev Casts an encrypted integer from 'euint8' to 'euint64'.
     */
    function asEuint64(euint8 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint64.wrap(Impl.cast(euint8.unwrap(value), FheType.Uint64));
    }

    /**
     * @dev Casts an encrypted integer from 'euint16' to 'euint64'.
     */
    function asEuint64(euint16 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint64.wrap(Impl.cast(euint16.unwrap(value), FheType.Uint64));
    }

    /**
     * @dev Casts an encrypted integer from 'euint32' to 'euint64'.
     */
    function asEuint64(euint32 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint64.wrap(Impl.cast(euint32.unwrap(value), FheType.Uint64));
    }

    /**
     * @dev Casts an encrypted integer from 'euint128' to 'euint64'.
     */
    function asEuint64(euint128 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint64.wrap(Impl.cast(euint128.unwrap(value), FheType.Uint64));
    }

    /**
     * @dev Casts an encrypted integer from 'euint256' to 'euint64'.
     */
    function asEuint64(euint256 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint64.wrap(Impl.cast(euint256.unwrap(value), FheType.Uint64));
    }

    /**
    /** 
     * @dev Converts an 'ebool' to an 'euint64'.
     */
    function asEuint64(ebool b) internal returns (euint64) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return euint64.wrap(Impl.cast(ebool.unwrap(b), FheType.Uint64));
    }

    /**
     * @dev Casts an encrypted integer from 'euint64' to 'ebool'.
     */
    function asEbool(euint64 value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return ne(value, 0);
    }

    /**
     * @dev Casts an encrypted integer from 'euint8' to 'euint128'.
     */
    function asEuint128(euint8 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint128.wrap(Impl.cast(euint8.unwrap(value), FheType.Uint128));
    }

    /**
     * @dev Casts an encrypted integer from 'euint16' to 'euint128'.
     */
    function asEuint128(euint16 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint128.wrap(Impl.cast(euint16.unwrap(value), FheType.Uint128));
    }

    /**
     * @dev Casts an encrypted integer from 'euint32' to 'euint128'.
     */
    function asEuint128(euint32 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint128.wrap(Impl.cast(euint32.unwrap(value), FheType.Uint128));
    }

    /**
     * @dev Casts an encrypted integer from 'euint64' to 'euint128'.
     */
    function asEuint128(euint64 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint128.wrap(Impl.cast(euint64.unwrap(value), FheType.Uint128));
    }

    /**
     * @dev Casts an encrypted integer from 'euint256' to 'euint128'.
     */
    function asEuint128(euint256 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint128.wrap(Impl.cast(euint256.unwrap(value), FheType.Uint128));
    }

    /**
    /** 
     * @dev Converts an 'ebool' to an 'euint128'.
     */
    function asEuint128(ebool b) internal returns (euint128) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return euint128.wrap(Impl.cast(ebool.unwrap(b), FheType.Uint128));
    }

    /**
     * @dev Casts an encrypted integer from 'euint128' to 'ebool'.
     */
    function asEbool(euint128 value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return ne(value, 0);
    }

    /**
     * @dev Casts an encrypted integer from 'euint8' to 'euint256'.
     */
    function asEuint256(euint8 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint256.wrap(Impl.cast(euint8.unwrap(value), FheType.Uint256));
    }

    /**
     * @dev Casts an encrypted integer from 'euint16' to 'euint256'.
     */
    function asEuint256(euint16 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint256.wrap(Impl.cast(euint16.unwrap(value), FheType.Uint256));
    }

    /**
     * @dev Casts an encrypted integer from 'euint32' to 'euint256'.
     */
    function asEuint256(euint32 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint256.wrap(Impl.cast(euint32.unwrap(value), FheType.Uint256));
    }

    /**
     * @dev Casts an encrypted integer from 'euint64' to 'euint256'.
     */
    function asEuint256(euint64 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint256.wrap(Impl.cast(euint64.unwrap(value), FheType.Uint256));
    }

    /**
     * @dev Casts an encrypted integer from 'euint128' to 'euint256'.
     */
    function asEuint256(euint128 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint256.wrap(Impl.cast(euint128.unwrap(value), FheType.Uint256));
    }

    /**
    /** 
     * @dev Converts an 'ebool' to an 'euint256'.
     */
    function asEuint256(ebool b) internal returns (euint256) {
        if (!isInitialized(b)) {
            b = asEbool(false);
        }
        return euint256.wrap(Impl.cast(ebool.unwrap(b), FheType.Uint256));
    }

    /**
     * @dev Casts an encrypted integer from 'euint256' to 'ebool'.
     */
    function asEbool(euint256 value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return ne(value, 0);
    }

    /**
     * @dev Evaluates not(ebool value) and returns the result.
     */
    function not(ebool value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEbool(false);
        }
        return ebool.wrap(Impl.not(ebool.unwrap(value)));
    }

    /**
     * @dev Evaluates neg(euint8 value) and returns the result.
     */
    function neg(euint8 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint8.wrap(Impl.neg(euint8.unwrap(value)));
    }

    /**
     * @dev Evaluates not(euint8 value) and returns the result.
     */
    function not(euint8 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        return euint8.wrap(Impl.not(euint8.unwrap(value)));
    }

    /**
     * @dev Evaluates neg(euint16 value) and returns the result.
     */
    function neg(euint16 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint16.wrap(Impl.neg(euint16.unwrap(value)));
    }

    /**
     * @dev Evaluates not(euint16 value) and returns the result.
     */
    function not(euint16 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        return euint16.wrap(Impl.not(euint16.unwrap(value)));
    }

    /**
     * @dev Evaluates neg(euint32 value) and returns the result.
     */
    function neg(euint32 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint32.wrap(Impl.neg(euint32.unwrap(value)));
    }

    /**
     * @dev Evaluates not(euint32 value) and returns the result.
     */
    function not(euint32 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        return euint32.wrap(Impl.not(euint32.unwrap(value)));
    }

    /**
     * @dev Evaluates neg(euint64 value) and returns the result.
     */
    function neg(euint64 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint64.wrap(Impl.neg(euint64.unwrap(value)));
    }

    /**
     * @dev Evaluates not(euint64 value) and returns the result.
     */
    function not(euint64 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        return euint64.wrap(Impl.not(euint64.unwrap(value)));
    }

    /**
     * @dev Evaluates neg(euint128 value) and returns the result.
     */
    function neg(euint128 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint128.wrap(Impl.neg(euint128.unwrap(value)));
    }

    /**
     * @dev Evaluates not(euint128 value) and returns the result.
     */
    function not(euint128 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        return euint128.wrap(Impl.not(euint128.unwrap(value)));
    }

    /**
     * @dev Evaluates neg(euint256 value) and returns the result.
     */
    function neg(euint256 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint256.wrap(Impl.neg(euint256.unwrap(value)));
    }

    /**
     * @dev Evaluates not(euint256 value) and returns the result.
     */
    function not(euint256 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        return euint256.wrap(Impl.not(euint256.unwrap(value)));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted ebool integer.
     * @dev If inputProof is empty, the externalEbool inputHandle can be used as a regular ebool handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEbool inputHandle, bytes memory inputProof) internal returns (ebool) {
        if (inputProof.length != 0) {
            return ebool.wrap(Impl.verify(externalEbool.unwrap(inputHandle), inputProof, FheType.Bool));
        } else {
            bytes32 inputBytes32 = externalEbool.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEbool(false);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return ebool.wrap(inputBytes32);
        }
    }

    /**
     * @dev Converts a plaintext boolean to an encrypted boolean.
     */
    function asEbool(bool value) internal returns (ebool) {
        return ebool.wrap(Impl.trivialEncrypt(value ? 1 : 0, FheType.Bool));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted euint8 integer.
     * @dev If inputProof is empty, the externalEuint8 inputHandle can be used as a regular euint8 handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEuint8 inputHandle, bytes memory inputProof) internal returns (euint8) {
        if (inputProof.length != 0) {
            return euint8.wrap(Impl.verify(externalEuint8.unwrap(inputHandle), inputProof, FheType.Uint8));
        } else {
            bytes32 inputBytes32 = externalEuint8.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEuint8(0);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return euint8.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted euint8 value.
     */
    function asEuint8(uint8 value) internal returns (euint8) {
        return euint8.wrap(Impl.trivialEncrypt(uint256(value), FheType.Uint8));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted euint16 integer.
     * @dev If inputProof is empty, the externalEuint16 inputHandle can be used as a regular euint16 handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEuint16 inputHandle, bytes memory inputProof) internal returns (euint16) {
        if (inputProof.length != 0) {
            return euint16.wrap(Impl.verify(externalEuint16.unwrap(inputHandle), inputProof, FheType.Uint16));
        } else {
            bytes32 inputBytes32 = externalEuint16.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEuint16(0);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return euint16.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted euint16 value.
     */
    function asEuint16(uint16 value) internal returns (euint16) {
        return euint16.wrap(Impl.trivialEncrypt(uint256(value), FheType.Uint16));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted euint32 integer.
     * @dev If inputProof is empty, the externalEuint32 inputHandle can be used as a regular euint32 handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEuint32 inputHandle, bytes memory inputProof) internal returns (euint32) {
        if (inputProof.length != 0) {
            return euint32.wrap(Impl.verify(externalEuint32.unwrap(inputHandle), inputProof, FheType.Uint32));
        } else {
            bytes32 inputBytes32 = externalEuint32.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEuint32(0);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return euint32.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted euint32 value.
     */
    function asEuint32(uint32 value) internal returns (euint32) {
        return euint32.wrap(Impl.trivialEncrypt(uint256(value), FheType.Uint32));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted euint64 integer.
     * @dev If inputProof is empty, the externalEuint64 inputHandle can be used as a regular euint64 handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEuint64 inputHandle, bytes memory inputProof) internal returns (euint64) {
        if (inputProof.length != 0) {
            return euint64.wrap(Impl.verify(externalEuint64.unwrap(inputHandle), inputProof, FheType.Uint64));
        } else {
            bytes32 inputBytes32 = externalEuint64.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEuint64(0);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return euint64.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted euint64 value.
     */
    function asEuint64(uint64 value) internal returns (euint64) {
        return euint64.wrap(Impl.trivialEncrypt(uint256(value), FheType.Uint64));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted euint128 integer.
     * @dev If inputProof is empty, the externalEuint128 inputHandle can be used as a regular euint128 handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEuint128 inputHandle, bytes memory inputProof) internal returns (euint128) {
        if (inputProof.length != 0) {
            return euint128.wrap(Impl.verify(externalEuint128.unwrap(inputHandle), inputProof, FheType.Uint128));
        } else {
            bytes32 inputBytes32 = externalEuint128.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEuint128(0);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return euint128.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted euint128 value.
     */
    function asEuint128(uint128 value) internal returns (euint128) {
        return euint128.wrap(Impl.trivialEncrypt(uint256(value), FheType.Uint128));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted eaddress integer.
     * @dev If inputProof is empty, the externalEaddress inputHandle can be used as a regular eaddress handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEaddress inputHandle, bytes memory inputProof) internal returns (eaddress) {
        if (inputProof.length != 0) {
            return eaddress.wrap(Impl.verify(externalEaddress.unwrap(inputHandle), inputProof, FheType.Uint160));
        } else {
            bytes32 inputBytes32 = externalEaddress.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEaddress(address(0));
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return eaddress.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted eaddress value.
     */
    function asEaddress(address value) internal returns (eaddress) {
        return eaddress.wrap(Impl.trivialEncrypt(uint256(uint160(value)), FheType.Uint160));
    }

    /**
     * @dev Convert an inputHandle with corresponding inputProof to an encrypted euint256 integer.
     * @dev If inputProof is empty, the externalEuint256 inputHandle can be used as a regular euint256 handle if it
     *      has already been verified and allowed to the sender.
     *      This could facilitate integrating smart contract accounts with fhevm.
     */
    function fromExternal(externalEuint256 inputHandle, bytes memory inputProof) internal returns (euint256) {
        if (inputProof.length != 0) {
            return euint256.wrap(Impl.verify(externalEuint256.unwrap(inputHandle), inputProof, FheType.Uint256));
        } else {
            bytes32 inputBytes32 = externalEuint256.unwrap(inputHandle);
            if (inputBytes32 == 0) {
                return asEuint256(0);
            }
            if (!Impl.isAllowed(inputBytes32, msg.sender)) revert SenderNotAllowedToUseHandle(inputBytes32, msg.sender);
            return euint256.wrap(inputBytes32);
        }
    }

    /**
     * @dev Convert a plaintext value to an encrypted euint256 value.
     */
    function asEuint256(uint256 value) internal returns (euint256) {
        return euint256.wrap(Impl.trivialEncrypt(uint256(value), FheType.Uint256));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEbool() internal returns (ebool) {
        return ebool.wrap(Impl.rand(FheType.Bool));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEuint8() internal returns (euint8) {
        return euint8.wrap(Impl.rand(FheType.Uint8));
    }

    /**
     * @dev Generates a random encrypted 8-bit unsigned integer in the [0, upperBound) range.
     *      The upperBound must be a power of 2.
     */
    function randEuint8(uint8 upperBound) internal returns (euint8) {
        return euint8.wrap(Impl.randBounded(upperBound, FheType.Uint8));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEuint16() internal returns (euint16) {
        return euint16.wrap(Impl.rand(FheType.Uint16));
    }

    /**
     * @dev Generates a random encrypted 16-bit unsigned integer in the [0, upperBound) range.
     *      The upperBound must be a power of 2.
     */
    function randEuint16(uint16 upperBound) internal returns (euint16) {
        return euint16.wrap(Impl.randBounded(upperBound, FheType.Uint16));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEuint32() internal returns (euint32) {
        return euint32.wrap(Impl.rand(FheType.Uint32));
    }

    /**
     * @dev Generates a random encrypted 32-bit unsigned integer in the [0, upperBound) range.
     *      The upperBound must be a power of 2.
     */
    function randEuint32(uint32 upperBound) internal returns (euint32) {
        return euint32.wrap(Impl.randBounded(upperBound, FheType.Uint32));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEuint64() internal returns (euint64) {
        return euint64.wrap(Impl.rand(FheType.Uint64));
    }

    /**
     * @dev Generates a random encrypted 64-bit unsigned integer in the [0, upperBound) range.
     *      The upperBound must be a power of 2.
     */
    function randEuint64(uint64 upperBound) internal returns (euint64) {
        return euint64.wrap(Impl.randBounded(upperBound, FheType.Uint64));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEuint128() internal returns (euint128) {
        return euint128.wrap(Impl.rand(FheType.Uint128));
    }

    /**
     * @dev Generates a random encrypted 128-bit unsigned integer in the [0, upperBound) range.
     *      The upperBound must be a power of 2.
     */
    function randEuint128(uint128 upperBound) internal returns (euint128) {
        return euint128.wrap(Impl.randBounded(upperBound, FheType.Uint128));
    }

    /**
     * @dev Generates a random encrypted value.
     */
    function randEuint256() internal returns (euint256) {
        return euint256.wrap(Impl.rand(FheType.Uint256));
    }

    /**
     * @dev Generates a random encrypted 256-bit unsigned integer in the [0, upperBound) range.
     *      The upperBound must be a power of 2.
     */
    function randEuint256(uint256 upperBound) internal returns (euint256) {
        return euint256.wrap(Impl.randBounded(upperBound, FheType.Uint256));
    }

    /**
     * @dev This function cleans the transient storage for the ACL (accounts) and the InputVerifier
     *      (input proofs).
     *      This could be useful for integration with Account Abstraction when bundling several
     *      UserOps calling the FHEVMExecutor.
     */
    function cleanTransientStorage() internal {
        Impl.cleanTransientStorageACL();
        Impl.cleanTransientStorageInputVerifier();
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(ebool value, address account) internal view returns (bool) {
        return Impl.isAllowed(ebool.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(ebool value) internal view returns (bool) {
        return Impl.isAllowed(ebool.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(ebool value, address account) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEbool(false);
        }
        Impl.allow(ebool.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(ebool value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEbool(false);
        }
        Impl.allow(ebool.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(ebool value, address account) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEbool(false);
        }
        Impl.allowTransient(ebool.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(ebool value) internal returns (ebool) {
        if (!isInitialized(value)) {
            value = asEbool(false);
        }
        Impl.makePubliclyDecryptable(ebool.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(ebool value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(ebool.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(euint8 value, address account) internal view returns (bool) {
        return Impl.isAllowed(euint8.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(euint8 value) internal view returns (bool) {
        return Impl.isAllowed(euint8.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(euint8 value, address account) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        Impl.allow(euint8.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(euint8 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        Impl.allow(euint8.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(euint8 value, address account) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        Impl.allowTransient(euint8.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(euint8 value) internal returns (euint8) {
        if (!isInitialized(value)) {
            value = asEuint8(0);
        }
        Impl.makePubliclyDecryptable(euint8.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(euint8 value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(euint8.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(euint16 value, address account) internal view returns (bool) {
        return Impl.isAllowed(euint16.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(euint16 value) internal view returns (bool) {
        return Impl.isAllowed(euint16.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(euint16 value, address account) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        Impl.allow(euint16.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(euint16 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        Impl.allow(euint16.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(euint16 value, address account) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        Impl.allowTransient(euint16.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(euint16 value) internal returns (euint16) {
        if (!isInitialized(value)) {
            value = asEuint16(0);
        }
        Impl.makePubliclyDecryptable(euint16.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(euint16 value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(euint16.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(euint32 value, address account) internal view returns (bool) {
        return Impl.isAllowed(euint32.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(euint32 value) internal view returns (bool) {
        return Impl.isAllowed(euint32.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(euint32 value, address account) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        Impl.allow(euint32.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(euint32 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        Impl.allow(euint32.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(euint32 value, address account) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        Impl.allowTransient(euint32.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(euint32 value) internal returns (euint32) {
        if (!isInitialized(value)) {
            value = asEuint32(0);
        }
        Impl.makePubliclyDecryptable(euint32.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(euint32 value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(euint32.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(euint64 value, address account) internal view returns (bool) {
        return Impl.isAllowed(euint64.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(euint64 value) internal view returns (bool) {
        return Impl.isAllowed(euint64.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(euint64 value, address account) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        Impl.allow(euint64.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(euint64 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        Impl.allow(euint64.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(euint64 value, address account) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        Impl.allowTransient(euint64.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(euint64 value) internal returns (euint64) {
        if (!isInitialized(value)) {
            value = asEuint64(0);
        }
        Impl.makePubliclyDecryptable(euint64.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(euint64 value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(euint64.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(euint128 value, address account) internal view returns (bool) {
        return Impl.isAllowed(euint128.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(euint128 value) internal view returns (bool) {
        return Impl.isAllowed(euint128.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(euint128 value, address account) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        Impl.allow(euint128.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(euint128 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        Impl.allow(euint128.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(euint128 value, address account) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        Impl.allowTransient(euint128.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(euint128 value) internal returns (euint128) {
        if (!isInitialized(value)) {
            value = asEuint128(0);
        }
        Impl.makePubliclyDecryptable(euint128.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(euint128 value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(euint128.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(eaddress value, address account) internal view returns (bool) {
        return Impl.isAllowed(eaddress.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(eaddress value) internal view returns (bool) {
        return Impl.isAllowed(eaddress.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(eaddress value, address account) internal returns (eaddress) {
        if (!isInitialized(value)) {
            value = asEaddress(address(0));
        }
        Impl.allow(eaddress.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(eaddress value) internal returns (eaddress) {
        if (!isInitialized(value)) {
            value = asEaddress(address(0));
        }
        Impl.allow(eaddress.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(eaddress value, address account) internal returns (eaddress) {
        if (!isInitialized(value)) {
            value = asEaddress(address(0));
        }
        Impl.allowTransient(eaddress.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(eaddress value) internal returns (eaddress) {
        if (!isInitialized(value)) {
            value = asEaddress(address(0));
        }
        Impl.makePubliclyDecryptable(eaddress.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(eaddress value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(eaddress.unwrap(value));
    }

    /**
     * @dev Returns whether the account is allowed to use the value.
     */
    function isAllowed(euint256 value, address account) internal view returns (bool) {
        return Impl.isAllowed(euint256.unwrap(value), account);
    }

    /**
     * @dev Returns whether the sender is allowed to use the value.
     */
    function isSenderAllowed(euint256 value) internal view returns (bool) {
        return Impl.isAllowed(euint256.unwrap(value), msg.sender);
    }

    /**
     * @dev Allows the use of value for the address account.
     */
    function allow(euint256 value, address account) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        Impl.allow(euint256.unwrap(value), account);
        return value;
    }

    /**
     * @dev Allows the use of value for this address (address(this)).
     */
    function allowThis(euint256 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        Impl.allow(euint256.unwrap(value), address(this));
        return value;
    }

    /**
     * @dev Allows the use of value by address account for this transaction.
     */
    function allowTransient(euint256 value, address account) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        Impl.allowTransient(euint256.unwrap(value), account);
        return value;
    }

    /**
     * @dev Makes the value publicly decryptable.
     */
    function makePubliclyDecryptable(euint256 value) internal returns (euint256) {
        if (!isInitialized(value)) {
            value = asEuint256(0);
        }
        Impl.makePubliclyDecryptable(euint256.unwrap(value));
        return value;
    }

    /**
     * @dev Returns whether the the value is publicly decryptable.
     */
    function isPubliclyDecryptable(euint256 value) internal view returns (bool) {
        return Impl.isPubliclyDecryptable(euint256.unwrap(value));
    }

    /**
     * @dev Returns whether the account is on the deny list.
     */
    function isAccountDenied(address account) internal view returns (bool) {
        return Impl.isAccountDenied(account);
    }

    /// @notice Checks if the `handle` can be decrypted in the given context (`user`, `contractAddress`).
    /// @param handle The handle as a bytes32.
    /// @param user The account address that is part of the user decryption context.
    /// @param contractAddress The address of the contract that is part of the user decryption context.
    /// @return False if `user` has not (user, contractAddress) context.
    function isUserDecryptable(bytes32 handle, address user, address contractAddress) internal view returns (bool) {
        if (user == contractAddress) {
            return false;
        }
        return Impl.persistAllowed(handle, user) && Impl.persistAllowed(handle, contractAddress);
    }

    /// @notice Checks if the user decryption rights have been delegated by `delegator` to `delegate`
    ///         in the context of the given `contractAddress`.
    /// @param delegator The delegator address
    /// @param delegate The account authorized to request user decryptions on behalf of `delegator`
    /// @param contractAddress The address of the contract that is part of the user decryption context
    /// @param handle The handle as a bytes32
    /// @return False if no active delegation exists for the (delegate, contractAddress) context, or if it has expired.
    function isDelegatedForUserDecryption(
        address delegator,
        address delegate,
        address contractAddress,
        bytes32 handle
    ) internal view returns (bool) {
        return Impl.isDelegatedForUserDecryption(delegator, delegate, contractAddress, handle);
    }

    /// @notice Delegates the user decryption rights that caller contract (`address(this)`) holds in the context
    ///         of the given `contractAddress` to a new `delegate` account for a limited amount of time.
    /// @dev The ACL grants user decryption permission based on a (User, Contract) pair. If the pair
    ///      (`address(this)`, `contractAddress`) has permission to decrypt a handle, calling this function grants
    ///      the temporary permission to the new pair (`delegate`, `contractAddress`) to decrypt the same handle.
    /// @param delegate The account that will request a user decryption on behalf of delegator (`address(this)`).
    /// @param contractAddress The address of the contract that is part of the user decryption context.
    /// @param expirationDate UNIX timestamp when the delegation expires.
    ///
    /// @dev Requirements:
    ///      - the ACL contract must not be paused.
    ///        Reverts via an {PausableUpgradeable-EnforcedPause} error otherwise.
    ///
    ///      - `expirationDate` must be at least 1 hour in the future.
    ///        i.e. `expirationDate >= block.timestamp + 1 hours`
    ///        Reverts with an {IACL-ExpirationDateBeforeOneHour} error otherwise.
    ///
    ///      - `expirationDate` must differ from the current value.
    ///        Reverts with an {IACL-ExpirationDateAlreadySetToSameValue} error otherwise.
    ///
    ///      - at most one delegate OR revoke per block for this
    ///        (address(this), delegate, contractAddress) tuple to avoid racey
    ///        state updates.
    ///        Reverts with an {IACL-AlreadyDelegatedOrRevokedInSameBlock} error
    ///        if a delegate OR revoke operation already occurred in the current
    ///        block. See {canDelegateOrRevokeNow}
    ///
    ///      - The `contractAddress` cannot be the caller contract (`address(this)`).
    ///        Reverts with an {IACL-SenderCannotBeContractAddress} error if
    ///        `contractAddress == address(this)`.
    ///
    ///      - The `delegate` address cannot be the caller contract (`address(this)`).
    ///        Reverts with an {IACL-SenderCannotBeDelegate} error if
    ///        `delegate == address(this)`.
    ///
    ///      - The `delegate` address cannot be the `contractAddress`.
    ///        Reverts with an {IACL-DelegateCannotBeContractAddress} error if
    ///        `delegate == contractAddress`.
    function delegateUserDecryption(address delegate, address contractAddress, uint64 expirationDate) internal {
        Impl.delegateForUserDecryption(delegate, contractAddress, expirationDate);
    }

    /// @notice Permanently delegates the user decryption rights that the caller contract (`address(this)`) holds in the
    ///         context of the given `contractAddress` to a new `delegate` account.
    /// @dev This is the version without expiration of {delegateUserDecryption}. The permission remains active until explicitly
    ///      revoked by the delegator using {revokeUserDecryptionDelegation}.
    /// @param delegate The account that will request a user decryption on behalf of delegator (`address(this)`).
    /// @param contractAddress The address of the contract that is part of the user decryption context.
    function delegateUserDecryptionWithoutExpiration(address delegate, address contractAddress) internal {
        Impl.delegateForUserDecryption(delegate, contractAddress, type(uint64).max);
    }

    /// @notice Batch delegates the user decryption rights that the caller contract (`address(this)`) holds in the context of the
    ///         given `contractAddresses[i]` to a new `delegate` account for a limited amount of time.
    /// @param delegate The account that will request a user decryption on behalf of delegator (`address(this)`)..
    /// @param contractAddresses The array of contract addresses that form the user decryption context tuples
    ///                          (`address(this)`, `contractAddresses[i]`).
    /// @param expirationDate UNIX timestamp when the delegation expires.
    function delegateUserDecryptions(
        address delegate,
        address[] memory contractAddresses,
        uint64 expirationDate
    ) internal {
        Impl.delegateForUserDecryptions(delegate, contractAddresses, expirationDate);
    }

    /// @notice Batch delegates user decryption rights without expiration that the caller contract (`address(this)`) holds in the context of
    ///         the given `contractAddresses[i]` to a new `delegate` account.
    /// @param delegate The account that will request a user decryption on behalf of delegator (`address(this)`)..
    /// @param contractAddresses The array of contract addresses that form the user decryption context tuples
    ///                          (`address(this)`, `contractAddresses[i]`).
    function delegateUserDecryptionsWithoutExpiration(address delegate, address[] memory contractAddresses) internal {
        Impl.delegateForUserDecryptions(delegate, contractAddresses, type(uint64).max);
    }

    /// @notice Revoke an existing delegation from delegator `address(this)` to a (delegate, contractAddress) user
    ///         decryption context.
    /// @param delegate The account that was authorized to request user decryptions on behalf of the caller contract `address(this)`
    /// @param contractAddress The address of the contract that is part of the user decryption context
    /// @dev Requirements:
    ///      - the ACL contract must not be paused.
    ///        Reverts with an {PausableUpgradeable-EnforcedPause} error otherwise.
    ///
    ///      - at most one delegate OR revoke per block for this
    ///        (address(this), delegate, contractAddress) tuple to avoid racey
    ///        state updates.
    ///        Reverts with an {IACL-AlreadyDelegatedOrRevokedInSameBlock} error
    ///        if a delegate OR revoke operation already occurred in the current
    ///        block.
    ///
    ///     -  An active delegation must exist for the (delegate, contractAddress)
    ///        context.
    ///        Reverts with an {IACL-NotDelegatedYet} error otherwise.
    function revokeUserDecryptionDelegation(address delegate, address contractAddress) internal {
        Impl.revokeDelegationForUserDecryption(delegate, contractAddress);
    }

    /// @notice Batch revoke existing delegations from delegator `address(this)` to the given
    ///         (delegate, contractAddresses[i]) pairs.
    /// @param delegate The account that was authorized to request user decryptions on behalf of the caller contract `address(this)`
    /// @param contractAddresses The array of contract addresses that form the user decryption context tuples
    ///                          (`address(this)`, `contractAddresses[i]`).
    function revokeUserDecryptionDelegations(address delegate, address[] memory contractAddresses) internal {
        Impl.revokeDelegationsForUserDecryption(delegate, contractAddresses);
    }

    /// @notice Get the expiry date of the delegation from delegator to a (delegate, contractAddress) pair.
    /// @param delegator The delegator address
    /// @param delegate The account authorized to request user decryptions on behalf of delegator
    /// @param contractAddress The address of the contract that is part of the user decryption context
    /// @return expirationDate The delegation's expiration limit, which can be one of:
    ///         - 0 :  If no delegation is currently active for the (delegate, contractAddress) context.
    ///         - type(uint64).max : If the delegation is permanent (no expiry).
    ///         - A strictly positive UNIX timestamp when this delegation expires.
    function getDelegatedUserDecryptionExpirationDate(
        address delegator,
        address delegate,
        address contractAddress
    ) internal view returns (uint64 expirationDate) {
        expirationDate = Impl.getUserDecryptionDelegationExpirationDate(delegator, delegate, contractAddress);
    }

    /// @notice Reverts if the KMS signatures verification against the provided handles and public decryption data
    ///         fails.
    /// @dev The function MUST be called inside a public decryption callback function of a dApp contract
    ///      to verify the signatures and prevent fake decryption results for being submitted.
    /// @param handlesList The list of handles as an array of bytes32 to check
    /// @param abiEncodedCleartexts The ABI-encoded list of decrypted values associated with each handle in the `handlesList`.
    ///                             The ABI-encoded list order must match the `handlesList` order.
    /// @param decryptionProof The KMS public decryption proof. It includes the KMS signatures, associated metadata,
    ///                        and the context needed for verification.
    /// @dev Reverts if any of the following conditions are met:
    ///      - The `decryptionProof` is empty or has an invalid length.
    ///      - The number of valid signatures is zero or less than the configured KMS signers threshold.
    ///      - Any signature is produced by an address that is not a registered KMS signer.
    ///      - The signatures verification returns false.
    function checkSignatures(
        bytes32[] memory handlesList,
        bytes memory abiEncodedCleartexts,
        bytes memory decryptionProof
    ) internal {
        bool isVerified = _verifySignatures(handlesList, abiEncodedCleartexts, decryptionProof);
        if (!isVerified) {
            revert InvalidKMSSignatures();
        }
        emit PublicDecryptionVerified(handlesList, abiEncodedCleartexts);
    }

    /// @notice Returns false or reverts if the KMS signatures verification against the provided handles and public decryption data
    ///         fails. Returns true only if KMS signatures verification pass. This is the `view` variant of `checkSignatures`.
    /// @dev **WARNING**: Prefer using `checkSignatures` (non-view) over this function whenever possible, for several reasons:
    ///      1. **Safety** – `checkSignatures` automatically reverts when signatures are invalid, making misuse impossible.
    ///         In contrast, `isPublicDecryptionResultValid` returns a boolean: if the caller forgets to `require` the returned
    ///         value, invalid signatures will silently pass, leaving the contract vulnerable to forged decryption results.
    ///      2. **Front-end integration** – `checkSignatures` emits a `PublicDecryptionVerified` event upon successful
    ///         verification, which is critical for front-end applications that need to detect when a public decrypt result
    ///         has been verified on-chain. This view function does not emit any event.
    ///      3. **Gas efficiency** – `checkSignatures` leverages a transient-storage mapping to cache verification results,
    ///         making decryption result verification cheaper.
    ///      Use this view variant only when you explicitly need a read-only call (e.g. off-chain simulation or static call).
    /// @param handlesList The list of handles as an array of bytes32 to check
    /// @param abiEncodedCleartexts The ABI-encoded list of decrypted values associated with each handle in the `handlesList`.
    ///                             The ABI-encoded list order must match the `handlesList` order.
    /// @param decryptionProof The KMS public decryption proof. It includes the KMS signatures, associated metadata,
    ///                        and the context needed for verification.
    /// @dev Reverts if any of the following conditions are met:
    ///      - The `decryptionProof` is empty or has an invalid length.
    ///      - The number of valid signatures is zero or less than the configured KMS signers threshold.
    ///      - Any signature is produced by an address that is not a registered KMS signer.
    /// @dev Returns false if there are enough signatures to reach threshold, but some recovered signer is duplicated.
    /// @return true if the signatures verification succeeds, false or reverts otherwise.
    function isPublicDecryptionResultValid(
        bytes32[] memory handlesList,
        bytes memory abiEncodedCleartexts,
        bytes memory decryptionProof
    ) internal view returns (bool) {
        if (decryptionProof.length == 0) {
            revert EmptyDecryptionProof();
        }

        /// @dev The decryptionProof is the numSigners + kmsSignatures + extraData (1 + 65*numSigners + extraData bytes)
        uint256 numSigners = uint256(uint8(decryptionProof[0]));

        /// @dev The extraData is the rest of the decryptionProof bytes after the numSigners + signatures.
        uint256 extraDataOffset = 1 + 65 * numSigners;

        /// @dev Check that the decryptionProof is long enough to contain at least the numSigners + kmsSignatures.
        if (decryptionProof.length < extraDataOffset) {
            revert DeserializingDecryptionProofFail();
        }

        bytes[] memory signatures = new bytes[](numSigners);
        for (uint256 j = 0; j < numSigners; j++) {
            signatures[j] = new bytes(65);
            for (uint256 i = 0; i < 65; i++) {
                signatures[j][i] = decryptionProof[1 + 65 * j + i];
            }
        }

        /// @dev Extract the extraData from the decryptionProof.
        uint256 extraDataSize = decryptionProof.length - extraDataOffset;
        bytes memory extraData = new bytes(extraDataSize);
        for (uint i = 0; i < extraDataSize; i++) {
            extraData[i] = decryptionProof[extraDataOffset + i];
        }
        bytes32 digest = _hashDecryptionResult(handlesList, abiEncodedCleartexts, extraData);

        return _verifySignaturesDigest(digest, signatures);
    }

    /*
     * @notice                  Hashes the decryption result.
     * @param ctHandles         The list of handles as an array of bytes32 to check.
     * @param decryptedResult   ABI-encoded list of decrypted values
     * @param extraData         Extra data.
     * @return hashTypedData    Hash typed data.
     */
    function _hashDecryptionResult(
        bytes32[] memory ctHandles,
        bytes memory decryptedResult,
        bytes memory extraData
    ) private view returns (bytes32) {
        CoprocessorConfig storage $ = Impl.getCoprocessorConfig();
        (
            ,
            string memory name,
            string memory version,
            uint256 gatewayCahinId,
            address verifyingContract,
            ,

        ) = IKMSVerifier($.KMSVerifierAddress).eip712Domain();

        bytes32 domainHash = keccak256(
            abi.encode(
                EIP712_DOMAIN_TYPEHASH,
                keccak256(bytes(name)),
                keccak256(bytes(version)),
                gatewayCahinId,
                verifyingContract
            )
        );

        bytes32 structHash = keccak256(
            abi.encode(
                DECRYPTION_RESULT_TYPEHASH,
                keccak256(abi.encodePacked(ctHandles)),
                keccak256(decryptedResult),
                keccak256(abi.encodePacked(extraData))
            )
        );

        bytes32 typedDataHash;
        assembly ("memory-safe") {
            let ptr := mload(0x40)
            mstore(ptr, hex"19_01")
            mstore(add(ptr, 0x02), domainHash)
            mstore(add(ptr, 0x22), structHash)
            typedDataHash := keccak256(ptr, 0x42)
        }

        return typedDataHash;
    }

    /**
     * @notice              View function that verifies multiple signatures for a given message at a certain threshold.
     * @param digest        The hash of the message that was signed by all signers.
     * @param signatures    An array of signatures to verify.
     * @return isVerified   true if enough provided signatures are valid, false otherwise.
     */
    function _verifySignaturesDigest(bytes32 digest, bytes[] memory signatures) private view returns (bool) {
        uint256 numSignatures = signatures.length;

        if (numSignatures == 0) {
            revert KMSZeroSignature();
        }

        CoprocessorConfig storage $ = Impl.getCoprocessorConfig();

        uint256 threshold = IKMSVerifier($.KMSVerifierAddress).getThreshold();

        if (numSignatures < threshold) {
            revert KMSSignatureThresholdNotReached(numSignatures);
        }

        address[] memory KMSSigners = IKMSVerifier($.KMSVerifierAddress).getKmsSigners();

        address[] memory recoveredSigners = new address[](numSignatures);
        uint256 uniqueValidCount;
        for (uint256 i = 0; i < numSignatures; i++) {
            address signerRecovered = FhevmECDSA.recover(digest, signatures[i]);
            if (!_isSigner(signerRecovered, KMSSigners)) {
                revert KMSInvalidSigner(signerRecovered);
            }
            if (!_isSigner(signerRecovered, recoveredSigners)) {
                recoveredSigners[uniqueValidCount] = signerRecovered;
                uniqueValidCount++;
            }
            if (uniqueValidCount >= threshold) {
                return true;
            }
        }
        return false;
    }

    /**
     * @notice              Checks whether a given address is present in an array of signers.
     * @param signer        The address to look for.
     * @param signersArray  The array of signer addresses to search.
     * @return isSigner     true if the address is found, false otherwise.
     */
    function _isSigner(address signer, address[] memory signersArray) private pure returns (bool) {
        uint256 signersArrayLength = signersArray.length;
        for (uint256 i = 0; i < signersArrayLength; i++) {
            if (signer == signersArray[i]) {
                return true;
            }
        }
        return false;
    }

    /**
     * @notice          Recovers the signer's address from a `signature` and a `message` digest.
     * @dev             It utilizes ECDSA for actual address recovery. It does not support contract signature (EIP-1271).
     * @param message   The hash of the message that was signed.
     * @param signature The signature to verify.
     * @return signer   The address that supposedly signed the message.
     */
    function _recoverSigner(bytes32 message, bytes memory signature) private pure returns (address) {
        address signerRecovered = FhevmECDSA.recover(message, signature);
        return signerRecovered;
    }

    /// @notice Verifies KMS signatures against the provided handles and public decryption data.
    /// @param handlesList The list of handles as an array of bytes32 to verify
    /// @param abiEncodedCleartexts The ABI-encoded list of decrypted values associated with each handle in the `handlesList`.
    ///                             The list order must match the list of handles in `handlesList`
    /// @param decryptionProof The KMS public decryption proof computed by the KMS Signers associated to `handlesList` and
    ///                       `abiEncodedCleartexts`
    /// @return true if the signatures verification succeeds, false otherwise
    /// @dev Private low-level function used to verify the KMS signatures.
    ///      Warning: this function never reverts, its boolean return value must be checked.
    ///      The decryptionProof is the numSigners + kmsSignatures + extraData (1 + 65*numSigners + extraData bytes)
    ///      Only static native solidity types for clear values are supported, so `abiEncodedCleartexts` is the concatenation of all clear values appended to 32 bytes.
    /// @dev Reverts if any of the following conditions are met by the underlying KMS verifier:
    ///      - The `decryptionProof` is empty or has an invalid length.
    ///      - The number of valid signatures is zero or less than the configured KMS signers threshold.
    ///      - Any signature is produced by an address that is not a registered KMS signer.
    function _verifySignatures(
        bytes32[] memory handlesList,
        bytes memory abiEncodedCleartexts,
        bytes memory decryptionProof
    ) private returns (bool) {
        CoprocessorConfig storage $ = Impl.getCoprocessorConfig();
        return
            IKMSVerifier($.KMSVerifierAddress).verifyDecryptionEIP712KMSSignatures(
                handlesList,
                abiEncodedCleartexts,
                decryptionProof
            );
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(ebool value) internal pure returns (bytes32 ct) {
        ct = ebool.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(euint8 value) internal pure returns (bytes32 ct) {
        ct = euint8.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(euint16 value) internal pure returns (bytes32 ct) {
        ct = euint16.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(euint32 value) internal pure returns (bytes32 ct) {
        ct = euint32.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(euint64 value) internal pure returns (bytes32 ct) {
        ct = euint64.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(euint128 value) internal pure returns (bytes32 ct) {
        ct = euint128.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(eaddress value) internal pure returns (bytes32 ct) {
        ct = eaddress.unwrap(value);
    }

    /**
     * @dev Converts handle from its custom type to the underlying bytes32. Used when requesting a decryption.
     */
    function toBytes32(euint256 value) internal pure returns (bytes32 ct) {
        ct = euint256.unwrap(value);
    }
}







/**
 * @title   ZamaConfig.
 * @notice  This library returns the FHEVM config for different networks
 *          with the contract addresses for (1) ACL, (2) CoprocessorAddress, (3) KMSVerifier,
 *          which are deployed & maintained by Zama.
 */
library ZamaConfig {
    /// @notice Returned if the Zama protocol is not supported on the current chain
    error ZamaProtocolUnsupported();

    function getEthereumCoprocessorConfig() internal view returns (CoprocessorConfig memory config) {
        if (block.chainid == 1) {
            config = _getEthereumConfig();
        } else if (block.chainid == 11155111) {
            config = _getSepoliaConfig();
        } else if (block.chainid == 31337) {
            config = _getLocalConfig();
        } else {
            revert ZamaProtocolUnsupported();
        }
    }

    function getConfidentialProtocolId() internal view returns (uint256) {
        if (block.chainid == 1) {
            return _getEthereumProtocolId();
        } else if (block.chainid == 11155111) {
            return _getSepoliaProtocolId();
        } else if (block.chainid == 31337) {
            return _getLocalProtocolId();
        }
        return 0;
    }

    /// @dev chainid == 1
    function _getEthereumProtocolId() private pure returns (uint256) {
        // Zama Ethereum protocol id is '1'
        return 1;
    }

    /// @dev chainid == 1
    function _getEthereumConfig() private pure returns (CoprocessorConfig memory) {
        // The addresses below are placeholders and should be replaced with actual addresses
        // once deployed on the Ethereum mainnet.
        return
            CoprocessorConfig({
                ACLAddress: 0xcA2E8f1F656CD25C01F05d0b243Ab1ecd4a8ffb6,
                CoprocessorAddress: 0xD82385dADa1ae3E969447f20A3164F6213100e75,
                KMSVerifierAddress: 0x77627828a55156b04Ac0DC0eb30467f1a552BB03
            });
    }

    /// @dev chainid == 11155111
    function _getSepoliaProtocolId() private pure returns (uint256) {
        // Zama Ethereum Sepolia protocol id is '10000 + Zama Ethereum protocol id'
        return 10001;
    }

    /// @dev chainid == 11155111
    function _getSepoliaConfig() private pure returns (CoprocessorConfig memory) {
        return
            CoprocessorConfig({
                ACLAddress: 0xf0Ffdc93b7E186bC2f8CB3dAA75D86d1930A433D,
                CoprocessorAddress: 0x92C920834Ec8941d2C77D188936E1f7A6f49c127,
                KMSVerifierAddress: 0xbE0E383937d564D7FF0BC3b46c51f0bF8d5C311A
            });
    }

    /// @dev chainid == 31337
    function _getLocalProtocolId() private pure returns (uint256) {
        return type(uint256).max;
    }

    function _getLocalConfig() private pure returns (CoprocessorConfig memory) {
        return
            CoprocessorConfig({
                ACLAddress: 0x50157CFfD6bBFA2DECe204a89ec419c23ef5755D,
                CoprocessorAddress: 0xe3a9105a3a932253A70F126eb1E3b589C643dD24,
                KMSVerifierAddress: 0x901F8942346f7AB3a01F6D7613119Bca447Bb030
            });
    }
}

/**
 * @title   ZamaEthereumConfig.
 * @dev     This contract can be inherited by a contract wishing to use the FHEVM contracts provided by Zama
 *          on the Ethereum (mainnet) network (chainId = 1) or Sepolia (testnet) network (chainId = 11155111).
 *          Other providers may offer similar contracts deployed at different addresses.
 *          If you wish to use them, you should rely on the instructions from these providers.
 */
abstract contract ZamaEthereumConfig {
    constructor() {
        FHE.setCoprocessor(ZamaConfig.getEthereumCoprocessorConfig());
    }

    function confidentialProtocolId() public view returns (uint256) {
        return ZamaConfig.getConfidentialProtocolId();
    }
}


/**
 * @title CipherLifeVault
 * @dev Re-implemented for fhEVM Coprocessor on Sepolia
 */
contract CipherLifeVault is ZamaEthereumConfig {
  
  mapping(address => euint8) private healthScore;
  mapping(address => euint8) private mindScore;
  mapping(address => euint32) private financeScore;
  
  mapping(uint256 => address) private decryptionRequests;

  event HealthDataSubmitted(address indexed user);
  event MindDataSubmitted(address indexed user);
  event FinanceDataSubmitted(address indexed user);
  event ScoresDecrypted(address indexed user, uint8 health, uint8 mind);

  // Submit encrypted health data
  function submitHealthData(
    externalEuint8 encryptedScore,
    bytes calldata inputProof
  ) external {
    healthScore[msg.sender] = FHE.fromExternal(encryptedScore, inputProof);
    FHE.allowThis(healthScore[msg.sender]);
    FHE.allow(healthScore[msg.sender], msg.sender);
    emit HealthDataSubmitted(msg.sender);
  }

  // Submit encrypted mind data
  function submitMindData(
    externalEuint8 encryptedScore,
    bytes calldata inputProof
  ) external {
    mindScore[msg.sender] = FHE.fromExternal(encryptedScore, inputProof);
    FHE.allowThis(mindScore[msg.sender]);
    FHE.allow(mindScore[msg.sender], msg.sender);
    emit MindDataSubmitted(msg.sender);
  }

  // Submit encrypted finance data
  function submitFinanceData(
    externalEuint32 encryptedScore,
    bytes calldata inputProof
  ) external {
    financeScore[msg.sender] = FHE.fromExternal(encryptedScore, inputProof);
    FHE.allowThis(financeScore[msg.sender]);
    FHE.allow(financeScore[msg.sender], msg.sender);
    emit FinanceDataSubmitted(msg.sender);
  }

  // Helper for UI compatibility
  function getInsightScore() external view returns (uint256) {
    return 85; // Return a dummy score for UI progress
  }

  // Request decryption (Simplified for v0.11 compatibility)
  function requestMyScores() external {
    // In v0.11, decryption is often handled via the Gateway contract
    // or by making the handle publicly decryptable and using a relayer.
    FHE.makePubliclyDecryptable(healthScore[msg.sender]);
    FHE.makePubliclyDecryptable(mindScore[msg.sender]);
    
    emit HealthDataSubmitted(msg.sender); 
  }

  // Callback for decryption results
  function decryptionCallback(
    uint256 requestId,
    uint8 decryptedHealth,
    uint8 decryptedMind
  ) external returns (bool) {
    address user = decryptionRequests[requestId];
    emit ScoresDecrypted(user, decryptedHealth, decryptedMind);
    return true;
  }
}
