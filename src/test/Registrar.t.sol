// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "../Registrar.sol";
import "../IAuthoriser.sol";
import "./EnsSetup.sol";

contract Authoriser is IAuthoriser {
  function canRegister (bytes32 node, address sender, bytes[] memory blob) public view virtual returns (bool) {
    return true;
  }
}

contract RulesEngine is IRulesEngine {
  function isLabelValid (string memory label) external view returns (bool) {
    return true;
  }

  function fuses () external view returns (uint96) {
    return 0;
  }
}

contract RegistrarTest is EnsSetup {
  Registrar public registrar;

  bytes32 private rootNode = keccak256(abi.encodePacked(bytes32(0x0), namehash("eth")));
  bytes32 private testNode = keccak256(abi.encodePacked(rootNode, namehash("testing")));

  event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);
  event ProjectStateChanged (bytes32 indexed node, bool enabled);

  function setUp() override public {
    super.setUp();

    registrar = new Registrar(_ens, address(0x0));
    _ens.setApprovalForAll(address(registrar), true);
  }

  function testAddRootNode () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    registrar.addRootNode(testNode, authoriser, rules);

    assertEq(address(registrar.nodeAuthorisers(testNode)), address(authoriser));
    assertEq(address(registrar.nodeRules(testNode)), address(rules));
  }

  function testValidLabelForNode () public {
    _setUpNode();

    bool validLabel = registrar.valid(testNode, "banana");

    assertTrue(validLabel);
  }

  function testRegisterSubdomain () public {
    _setUpNode();
    cheats.expectEmit(true, true, true, true);
    emit NewOwner(testNode, namehash("banana"), address(this));
    registrar.register(testNode, "banana", address(this), 1);
  }

  function testChangeNodeState () public {
    _setUpNode();
    assertTrue(registrar.nodeEnabled(testNode));

    cheats.expectEmit(true, true, true, true);
    emit ProjectStateChanged(testNode, false);

    registrar.setRootNodeState(testNode, false);
    assertTrue(registrar.nodeEnabled(testNode) == false);

    cheats.expectEmit(true, true, true, true);
    emit ProjectStateChanged(testNode, true);

    registrar.setRootNodeState(testNode, true);
    assertTrue(registrar.nodeEnabled(testNode));
  }

  function testFailChangeStateOnUnintializedProject () public {
    registrar.setRootNodeState(testNode, true);
  }

  function testValidLabel () public {
    _setUpNode();
    assertTrue(registrar.valid(testNode, "orange"));
  }

  function testFailCheckValidityWhenDisabled () public {
    // fails because no rules have been setup for node
    registrar.valid(testNode, "strawberry");
  }

  function _setUpNode () private {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();
    registrar.addRootNode(testNode, authoriser, rules);
  }
}
