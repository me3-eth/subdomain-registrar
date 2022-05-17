// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "./IAuthoriser.sol";
import "ens-contracts/registry/ENS.sol";
import { Owned } from  "solmate/auth/Owned.sol";

interface IRegistrar {
  function register (bytes32 node, string memory label, address owner) external;
  function valid (bytes32 node, string memory label) external view returns (bool);
  function available (bytes32 node, string memory label) external view returns (bool);

  function addRootNode (bytes32 node, IAuthoriser authoriser, IRulesEngine rules) external;
}

contract Registrar is IRegistrar, Owned(msg.sender) {
  ENS private ens;

  mapping(bytes32 => IAuthoriser) public nodeAuthorisers;
  mapping(bytes32 => IRulesEngine) public nodeRules;

  modifier isAuthorised (bytes32 node, string memory label, uint256 tokenId) {
    IAuthoriser authoriser = nodeAuthorisers[node];

    // TODO get rid of this
    tokenId = uint256(keccak256(bytes(label)));

    // TODO authoriser should decide which elements it wants to use for authorising
    // TODO send everything
    require(authoriser.authorise(tokenId, msg.sender), "Sender is not authorised");
    _;
  }

  modifier registeredNode (bytes32 node) {
    require(address(nodeAuthorisers[node]) != address(0x0) || address(nodeRules[node]) != address(0x0));
    _;
  }

  constructor (ENS _registry) {
    ens = _registry;
  }

  function addRootNode (bytes32 node, IAuthoriser _authoriser, IRulesEngine _rules) external onlyOwner {
    nodeAuthorisers[node] = _authoriser;
    nodeRules[node] = _rules;
  }

  function register (bytes32 node, string memory label, address owner) public registeredNode(node) isAuthorised(node, label, 0) {
    bytes32 labelHash = keccak256(bytes(label));
    ens.setSubnodeOwner(node, labelHash, owner);
  }

  function valid (bytes32 node, string memory label) public view returns (bool) {
    return nodeRules[node].isLabelValid(label);
  }

  function available (bytes32 node, string memory label) public view returns (bool) {
    return false;
  }
}
