// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "ens-contracts/registry/ENS.sol";
import { Owned } from  "solmate/auth/Owned.sol";

import "./IAuthoriser.sol";

interface IRegistrar {
  function register (bytes32 node, string memory label, address owner) external;
  function valid (bytes32 node, string memory label) external view returns (bool);
  function available (bytes32 node, string memory label) external view returns (bool);

  function addRootNode (bytes32 node, IAuthoriser authoriser, IRulesEngine rules) external;
}

contract Registrar is IRegistrar, Owned(msg.sender) {
  ENS private ens;

  address me3Resolver;
  mapping(bytes32 => bool) public nodeEnabled;
  mapping(bytes32 => IAuthoriser) public nodeAuthorisers;
  mapping(bytes32 => IRulesEngine) public nodeRules;

  event Me3ResolverUpdated (address indexed resolverAddr);
  event ProjectStateChanged (bytes32 indexed node, bool enabled);

  modifier isAuthorised (bytes32 node, string memory label, address user) {
    IAuthoriser authoriser = nodeAuthorisers[node];
    require(authoriser.authorise(user, label), "User is not authorised");
    _;
  }

  modifier registeredNode (bytes32 node) {
    require(nodeEnabled[node], "Node is not enabled");
    _;
  }

  constructor (ENS _registry, address _resolver) {
    ens = _registry;
    me3Resolver = _resolver;
  }

  /// @notice Add a new project to the directory
  /// @param node The project node that subdomains will be based on
  /// @param _authoriser The authorisation contract
  /// @param _rules The rules around availability, validity, and usage
  function addRootNode (bytes32 node, IAuthoriser _authoriser, IRulesEngine _rules) external onlyOwner {
    nodeAuthorisers[node] = _authoriser;
    nodeRules[node] = _rules;
    nodeEnabled[node] = true;
  }

  /// @notice Enable or disable a root node
  /// @param node The project node
  /// @param enabled True for enabled, false for disabled
  function setRootNodeState (bytes32 node, bool enabled) external onlyOwner {
    require(
      address(nodeAuthorisers[node]) != address(0x0)
        && address(nodeRules[node]) != address(0x0),
      "Project must be initialized");

    emit ProjectStateChanged(node, enabled);
    nodeEnabled[node] = enabled;
  }

  function updateMe3Resolver (address newResolver) external onlyOwner {
    require(newResolver != address(0x0), "Resolver must be a real contract");

    me3Resolver = newResolver;
    emit Me3ResolverUpdated(newResolver);
  }

  function register (bytes32 node, string memory label, address owner)
    public
    registeredNode(node)
    isAuthorised(node, label, msg.sender)
  {
    ens.setSubnodeRecord(node, _namehash(label), owner, me3Resolver, 86400);
  }

  function valid (bytes32 node, string memory label) public view returns (bool) {
    return nodeRules[node].isLabelValid(label);
  }

  function available (bytes32 node, string memory label) public view returns (bool) {
    // should check with node rules first
    // then check against registry
    return false;
  }

  function _namehash (string memory node) private pure returns(bytes32) {
    return keccak256(bytes(node));
  }
}
