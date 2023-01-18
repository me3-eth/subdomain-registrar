// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import {IRegistrar} from "../src/Registrar.sol";
import {IAuthoriser} from "../src/IAuthoriser.sol";
import {IRulesEngine} from "../src/IRulesEngine.sol";
import {GatewayBeta} from "../src/GatewayBeta.sol";

contract Authoriser is IAuthoriser {
    function canRegister(bytes32 node, address sender, bytes[] memory blob) public view virtual returns (bool) {
        return true;
    }
}

contract RulesEngine is IRulesEngine {
    function isLabelValid(bytes32 node, string memory label) external view returns (bool) {
        return true;
    }

    function subnodeOwner(address registrant) external view returns (address) {
        return registrant;
    }

    function profileResolver(bytes32 node, string memory label, address registrant) external view returns (address) {
        return address(0xabc123);
    }
}

contract Registrar is IRegistrar {
    event SetProjectNodeCalled (bytes32 node, address authoriser, address rules, bool enable);

    function register(bytes32 node, string memory label, address owner, bytes[] memory authData) external {
      // isn't called by gateway
    }

    function valid(bytes32 node, string memory label) external view returns (bool) {
      // isn't called by gateway
      return true;
    }

    function setProjectNode(bytes32 node, IAuthoriser authoriser, IRulesEngine rules, bool enable) external {
      emit SetProjectNodeCalled(node, address(authoriser), address(rules), enable);
    }
}

contract BetaGatewayTest is Test {
  GatewayBeta public gateway;

  event SetProjectNodeCalled (bytes32 node, address authoriser, address rules, bool enable);

  function setUp() public {
    IRegistrar registrar = new Registrar();
    gateway = new GatewayBeta(address(registrar));
  }

  function testRegister () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    gateway.register(bytes32(0x0), authoriser, rules);
  }

  function testFailRegister () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    gateway.register{value: 1}(bytes32(0x0), authoriser, rules);
  }
}
