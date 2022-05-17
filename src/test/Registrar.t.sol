// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "ens-contracts/registry/ENS.sol";
import "ens-contracts/registry/ENSRegistry.sol";

import "../Registrar.sol";
import "../IAuthoriser.sol";

contract Authoriser is IAuthoriser {
  function authorise (uint256 tokenId, address sender) public view virtual returns (bool) {
    require(tokenId > 0, "Must be non-zero tokenId");
    return true;
  }
}

contract RulesEngine is IRulesEngine {
  function isLabelValid (string memory label) external view returns (bool) {
    return true;
  }
}

contract RegistrarTest is Test {
  ENS private registry;
  Registrar public registrar;

  // brendan.pcc.eth
  bytes32 private rootNode;
  bytes32 private pccNode;

  event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);

  function setUp() public {
    registry = new ENSRegistry();
    rootNode = registry.setSubnodeOwner(bytes32(0x0), "eth", address(this));
    pccNode = registry.setSubnodeOwner(rootNode, "pcc", address(this));

    registrar = new Registrar(registry);
    registry.setOwner(pccNode, address(registrar));
  }

  function testAddRootNode () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    registrar.addRootNode(pccNode, authoriser, rules);

    assertEq(address(registrar.nodeAuthorisers(pccNode)), address(authoriser));
    assertEq(address(registrar.nodeRules(pccNode)), address(rules));
  }

  function testValidLabelForNode () public {
    _setUpNode();

    bool validLabel = registrar.valid(pccNode, "banana");

    assertTrue(validLabel);
  }

  function testRegisterSubdomain () public {
    _setUpNode();
    vm.expectEmit(true, true, true, true);
    emit NewOwner(pccNode, _namehash("banana"), address(this));

    registrar.register(pccNode, "banana", address(this));
  }

  function _setUpNode () private {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();
    registrar.addRootNode(pccNode, authoriser, rules);
  }

  function _namehash (string memory node) public returns(bytes32) {
    return keccak256(bytes(node));
  }
}
