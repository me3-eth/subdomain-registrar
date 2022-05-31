// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

library Utilities {
  function labelhash (string memory label) internal pure returns(bytes32) {
    return keccak256(bytes(label));
  }

  function namehash (bytes32 node, bytes32 label) internal pure returns(bytes32) {
    return keccak256(abi.encodePacked(node, label));
  }
}
