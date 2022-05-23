// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

library Utilities {
  function namehash (string memory node) internal pure returns(bytes32) {
    return keccak256(bytes(node));
  }
}
