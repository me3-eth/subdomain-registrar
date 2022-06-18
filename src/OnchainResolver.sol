// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ITextRead, ITextWrite} from "./ITextResolver.sol";

/// @title On-chain ENS Resolver
/// @author charchar.eth
/// @notice Provides the methods that me3 supports with authorisation dependent on project
/// @dev ERC-165 support for read and write functions
contract OnchainResolver is ITextRead, ITextWrite {
  function supportsInterface(bytes4 interfaceId) external pure returns (bool) {
  }
}
