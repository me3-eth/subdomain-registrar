// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "ens-contracts/registry/ENS.sol";
import { Owned } from  "solmate/auth/Owned.sol";

import "./IAuthoriser.sol";
import { Utilities } from "./Utils.sol";

interface IRegistrar {
  function register (bytes32 node, string memory label, address owner, uint256 attachToTokenId) external;
  function valid (bytes32 node, string memory label) external view returns (bool);
  function available (bytes32 node, string memory label) external view returns (bool);

  function addRootNode (bytes32 node, IAuthoriser authoriser, IRulesEngine rules) external;
}

/// @title Me3 Subdomain Registrar
/// @author charchar.eth
/// @notice Provides third-party projects with a common subdomain registration function
/// @dev 0.1.0
contract Registrar is IRegistrar, Owned(msg.sender) {
  ENS private ens;

  address public me3Resolver;
  mapping(bytes32 => bool) public nodeEnabled;
  mapping(bytes32 => IAuthoriser) public nodeAuthorisers;
  mapping(bytes32 => IRulesEngine) public nodeRules;

  event Me3ResolverUpdated (address indexed resolverAddr);
  event ProjectStateChanged (bytes32 indexed node, bool enabled);

  modifier isAuthorised (bytes32 node, address user, uint256 tokenId) {
    IAuthoriser authoriser = nodeAuthorisers[node];
    require(authoriser.canRegister(user, tokenId), "User is not authorised");
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

  /// @notice Register a subdomain under node
  /// @param node The project node to use
  /// @param label The subdomain text, eg the 'hopeless' in hopeless.abc.eth
  /// @param owner Who will own the subdomain
  function register (bytes32 node, string memory label, address owner, uint256 tokenId)
    public
    registeredNode(node)
    isAuthorised(node, msg.sender, tokenId)
  {
    require(valid(node, label), "Check with project for valid subdomain");
    ens.setSubnodeRecord(node, Utilities.namehash(label), owner, me3Resolver, 86400);
  }

  /// @notice Check if a label is valid for a project
  /// @param node The project node
  /// @param label The subdomain label to validate
  /// @return bool True if the label is valid, according to the project rules, false otherwise
  function valid (bytes32 node, string memory label) public view returns (bool) {
    return nodeRules[node].isLabelValid(label);
  }

  function available (bytes32 node, string memory label) public view returns (bool) {
    // should check with node rules first
    // then check against registry
    return false;
  }
}
