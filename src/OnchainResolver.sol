// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {TextResolver} from "./TextResolver.sol";
import {AddressResolver} from "./AddressResolver.sol";

/// @title On-chain ENS Resolver
/// @author charchar.eth
/// @notice Provides the methods that me3 supports with authorisation dependent on project
/// @dev ERC-165 support for read and write functions
contract OnchainResolver is AddressResolver, TextResolver {
  function isAuthorised(bytes32 node, bytes32 project) internal override view returns(bool) {
    // TODO get the project node, get authorisers from registrar, check if user can edit
    return true;
  }

  function supportsInterface(bytes4 interfaceId) public virtual override(AddressResolver, TextResolver) view returns (bool) {
    return super.supportsInterface(interfaceId);
  }
}
