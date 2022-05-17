// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "../Registrar.sol";
import "../IAuthoriser.sol";

contract Authoriser is IAuthoriser {
  function authorise (uint256 tokenId, address sender) public view virtual returns (bool) {
    return true;
  }
}

contract RulesEngine is IRulesEngine {
  function isLabelValid (string memory label) external view returns (bool) {
    return true;
  }
}

contract RegistrarTest is Test {
  Registrar public registrar;

  // brendan.pcc.eth
  bytes32 constant node = 0xf349df259df246049048cc5bd391a3c3b5c72af5a860287139b7d45ba47c17db;

  function setUp() public {
    registrar = new Registrar();
  }

  function testAddRootNode () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    bytes32 node = 0xf349df259df246049048cc5bd391a3c3b5c72af5a860287139b7d45ba47c17db;
    registrar.addRootNode(node, authoriser, rules);

    assertEq(address(registrar.nodeAuthorisers(node)), address(authoriser));
    assertEq(address(registrar.nodeRules(node)), address(rules));
  }

  function testValidLabelForNode () public {
    _setUpNode();

    bool validLabel = registrar.valid(node, "banana");

    assertTrue(validLabel);
  }

  function _setUpNode () private {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();
    registrar.addRootNode(node, authoriser, rules);
  }

}
