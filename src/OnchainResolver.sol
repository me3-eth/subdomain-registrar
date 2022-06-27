// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Owned} from "solmate/auth/Owned.sol";

import {TextResolver} from "./TextResolver.sol";
import {AddressResolver} from "./AddressResolver.sol";
import {IAuthoriser} from "./IAuthoriser.sol";

// TODO add ownable, IMulticall, IProjectResolver

/// @title On-chain ENS Resolver
/// @author charchar.eth
/// @notice Provides the methods that me3 supports with authorisation dependent on project
/// @dev ERC-165 support for read and write functions
contract OnchainResolver is Owned(msg.sender), AddressResolver, TextResolver {
  bytes32 immutable projectNode;

  IAuthoriser public authoriser;

  constructor (bytes32 node) {
    projectNode = node;
    authoriser = IAuthoriser(address(0x0));
  }

  function isAuthorised() internal override view returns(bool) {
    require(address(authoriser) != address(0x0), "Authoriser contract has not been set");

    return authoriser.canEdit(projectNode, msg.sender, new bytes());
  }

  function supportsInterface(bytes4 interfaceId) public virtual override(AddressResolver, TextResolver) view returns (bool) {
    return super.supportsInterface(interfaceId);
  }
}
