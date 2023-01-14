// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import {EnsSetup} from "forge-ens/EnsSetup.sol";
import "../src/Registrar.sol";
import {IAuthoriser} from "../src/IAuthoriser.sol";
import {IRulesEngine} from "../src/IRulesEngine.sol";

contract Authoriser is IAuthoriser {
    function canRegister(bytes32 node, address sender, bytes[] memory blob) public view virtual returns (bool) {
        return true;
    }
}

contract RulesEngine is IRulesEngine {
    function isLabelValid(bytes32 node, string memory label) external view returns (bool) {
        string memory invalidLabel = "fail";
        if (keccak256(abi.encode(label)) == keccak256(abi.encode(invalidLabel))) {
            return false;
        }
        return true;
    }

    function subnodeOwner(address registrant) external view returns (address) {
        return registrant;
    }

    function profileResolver(bytes32 node, string memory label, address registrant) external view returns (address) {
        return address(0xabc123);
    }
}

contract RegistrarTest is EnsSetup {
    Registrar public registrar;

    event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);
    event SubnodeRegistered(bytes32 indexed node, bytes32 indexed label, address owner, address registrant);
    event ProjectStateChanged(bytes32 indexed node, address authoriser, address rules, bool enabled);

    function setUp() public override {
        super.setUp();

        registrar = new Registrar(IENS(address(_ens)));
        _ens.setApprovalForAll(address(registrar), true);
    }

    function testSetProjectNode() public {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngine();
        registrar.setGateway(address(this));

        registrar.setProjectNode(demoNode, authoriser, rules, true);

        assertEq(address(registrar.nodeAuthorisers(demoNode)), address(authoriser));
        assertEq(address(registrar.nodeRules(demoNode)), address(rules));
        assertEq(registrar.nodeEnabled(demoNode), true);

        registrar.setProjectNode(demoNode, authoriser, rules, false);

        assertEq(address(registrar.nodeAuthorisers(demoNode)), address(authoriser));
        assertEq(address(registrar.nodeRules(demoNode)), address(rules));
        assertEq(registrar.nodeEnabled(demoNode), false);
    }

    function testValidLabelForNode() public {
        _setUpNode();

        bool validLabel = registrar.valid(demoNode, "banana");

        assertTrue(validLabel);
    }

    function testRegisterSubdomain() public {
        _setUpNode();
        vm.expectEmit(true, true, true, true);
        emit NewOwner(demoNode, labelhash("banana"), address(this));

        uint256 tokenId = 1;
        bytes[] memory blob = new bytes[](1);
        blob[0] = abi.encodePacked(tokenId); // encode tokenId

        registrar.register(demoNode, "banana", address(this), blob);
    }

    function testCannotSetupProjectAsNormalUser() public {
        _setUpNode();
        vm.expectRevert(bytes("Caller does not have permission"));
        vm.prank(address(0xabc123));
        registrar.setProjectNode(demoNode, IAuthoriser(address(0x0)), IRulesEngine(address(0x0)), true);
    }

    function testChangeNodeState() public {
        _setUpNode();
        assertTrue(registrar.nodeEnabled(demoNode));

        IAuthoriser initialAuth = registrar.nodeAuthorisers(demoNode);
        IRulesEngine initialRules = registrar.nodeRules(demoNode);

        vm.expectEmit(true, true, true, true);
        emit ProjectStateChanged(demoNode, address(initialAuth), address(initialRules), false);

        registrar.setProjectNode(demoNode, initialAuth, initialRules, false);
        assertTrue(registrar.nodeEnabled(demoNode) == false);

        IAuthoriser newAuth = new Authoriser();
        IRulesEngine newRules = new RulesEngine();

        vm.expectEmit(true, true, true, true);
        emit ProjectStateChanged(demoNode, address(newAuth), address(newRules), true);

        registrar.setProjectNode(demoNode, newAuth, newRules, true);
        assertTrue(registrar.nodeEnabled(demoNode));
    }

    function testFuzzSetProjectNode(bytes32 node, address auth, address rules, bool enabled) public {
        registrar.setGateway(address(this));
        registrar.setProjectNode(node, IAuthoriser(auth), IRulesEngine(rules), enabled);

        assertEq(address(registrar.nodeAuthorisers(node)), auth);
        assertEq(address(registrar.nodeRules(node)), rules);
        assertEq(registrar.nodeEnabled(node), enabled);
    }

    function testValidLabel() public {
        _setUpNode();
        assertTrue(registrar.valid(demoNode, "orange"));
    }

    function testFailCheckValidityWhenDisabled() public {
        // fails because no rules have been setup for node
        registrar.valid(demoNode, "strawberry");
    }

    function testCannotSendEthToContract() public {
        address payable payableRegistrar = payable(address(registrar));
        (bool success,) = payableRegistrar.call{value: 1 ether}("");
        assertEq(success, false);
    }

    function testFallbackReverts() public {
        (bool success,) = address(registrar).call(abi.encodeWithSignature("thisisntreal()"));
        assertEq(success, false);
    }

    function _setUpNode() private {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngine();
        registrar.setGateway(address(this));
        registrar.setProjectNode(demoNode, authoriser, rules, true);
    }
}
