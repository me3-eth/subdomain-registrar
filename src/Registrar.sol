// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "./IAuthoriser.sol";
import "ens-contracts/registry/ENS.sol";

interface IRegistrar {
  function register (bytes32 node, bytes32 label, address owner) external;
  function valid (bytes32 node, string memory label) external view returns (bool);
  function available (bytes32 node, string memory label) external view returns (bool);

  function addRootNode (bytes32 node, IAuthoriser authoriser, IRulesEngine rules) external;
}

contract Registrar is IRegistrar {
  ENS private ens;
  mapping(bytes32 => IAuthoriser) public nodeAuthorisers;
  mapping(bytes32 => IRulesEngine) public nodeRules;

  /*
  modifier isAuthorised (uint256 tokenId) {
    require(authoriser.authorise(tokenId, msg.sender), "Sender is not authorised");
    _;
  }
 */

  modifier registeredNode (bytes32 node) {
    require(address(nodeAuthorisers[node]) != address(0x0) || address(nodeRules[node]) != address(0x0));
    _;
  }

  constructor (ENS _registry) {
    ens = _registry;
  }

  /// @dev TODO should be owner only
  function addRootNode (bytes32 node, IAuthoriser _authoriser, IRulesEngine _rules) external {
    nodeAuthorisers[node] = _authoriser;
    nodeRules[node] = _rules;
  }

  function register (bytes32 node, bytes32 label, address owner) public registeredNode(node) {
    ens.setSubnodeOwner(node, label, address(this));
  }

  function valid (bytes32 node, string memory label) public view returns (bool) {
    return nodeRules[node].isLabelValid(label);
  }

  function available (bytes32 node, string memory label) public view returns (bool) {
    return false;
  }
}
