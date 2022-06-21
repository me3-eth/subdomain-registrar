// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ITextRead, ITextWrite} from "./ITextResolver.sol";

/// @title On-chain ENS Resolver
/// @author charchar.eth
/// @notice Provides the methods that me3 supports with authorisation dependent on project
/// @dev ERC-165 support for read and write functions
contract OnchainResolver is ITextRead, ITextWrite {
  mapping(bytes32 => mapping(string => string)) private nodeText;

  modifier authorised (bytes32 node) {
    // TODO get the project node, get authorisers from registrar, check if user can edit
    _;
  }

  /// @inheritdoc ITextRead
  function text(bytes32 node, string calldata key) external view returns (string memory) {
    return nodeText[node][key];
  }

  /// @inheritdoc ITextWrite
  function setText(bytes32 node, string calldata key, string calldata value) external {
    emit TextChanged(node, key);
    nodeText[node][key] = value;
  }

  function supportsInterface(bytes4 interfaceId) external pure returns (bool) {
    return interfaceId == type(ITextRead).interfaceId
      || interfaceId == type(ITextWrite).interfaceId
      || interfaceId == 0x01ffc9a7;
  }
}
