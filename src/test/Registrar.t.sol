// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "../Registrar.sol";
import "../IAuthoriser.sol";
import { Utilities } from "../Utils.sol";
import { EnsSetup } from "forge-ens/EnsSetup.sol";

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

  event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);
  event ProjectStateChanged (bytes32 indexed node, bool enabled);

  function setUp() override public {
    super.setUp();

    registrar = new Registrar(IENS(address(_ens)), address(0x0));
    _ens.setApprovalForAll(address(registrar), true);
  }

  function testAddRootNode () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    registrar.addRootNode(demoNode, authoriser, rules);

    assertEq(address(registrar.nodeAuthorisers(demoNode)), address(authoriser));
    assertEq(address(registrar.nodeRules(demoNode)), address(rules));
  }

  function testValidLabelForNode () public {
    _setUpNode();

    bool validLabel = registrar.valid(demoNode, "banana");

    assertTrue(validLabel);
  }

  function testRegisterSubdomain () public {
    _setUpNode();
    vm.expectEmit(true, true, true, true);
    emit NewOwner(demoNode, Utilities.namehash("banana"), address(this));

    uint256 tokenId = 1;
    bytes[] memory blob = new bytes[](1);
    blob[0] = abi.encodePacked(tokenId); // encode tokenId

    registrar.register(demoNode, "banana", address(this), blob);
  }

  function testChangeNodeState () public {
    _setUpNode();
    assertTrue(registrar.nodeEnabled(demoNode));

    vm.expectEmit(true, true, true, true);
    emit ProjectStateChanged(demoNode, false);

    registrar.setRootNodeState(demoNode, false);
    assertTrue(registrar.nodeEnabled(demoNode) == false);

    vm.expectEmit(true, true, true, true);
    emit ProjectStateChanged(demoNode, true);

    registrar.setRootNodeState(demoNode, true);
    assertTrue(registrar.nodeEnabled(demoNode));
  }

  function testFailChangeStateOnUnintializedProject () public {
    registrar.setRootNodeState(demoNode, true);
  }

  function testValidLabel () public {
    _setUpNode();
    assertTrue(registrar.valid(demoNode, "orange"));
  }

  function testFailCheckValidityWhenDisabled () public {
    // fails because no rules have been setup for node
    registrar.valid(demoNode, "strawberry");
  }

  function _setUpNode () private {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();
    registrar.addRootNode(demoNode, authoriser, rules);
  }
}
