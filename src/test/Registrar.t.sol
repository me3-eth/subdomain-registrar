pragma solidity 0.8.10;

import {EnsSetup} from "forge-ens/EnsSetup.sol";
import "../Registrar.sol";
import {IAuthoriser} from "../IAuthoriser.sol";
import {IRulesEngine} from "../IRulesEngine.sol";

contract Authoriser is IAuthoriser {
    function canRegister(
        bytes32 node,
        address sender,
        bytes memory blob
    ) public view virtual returns (bool) {
        return true;
    }
}

contract RulesEngine is IRulesEngine {
    function isLabelValid(bytes32 node, string memory label) external view returns (bool) {
        return true;
    }

    function fuses() external view returns (uint96) {
        return 0;
    }
}

contract RegistrarTest is EnsSetup {
    Registrar public registrar;

    event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);
    event SubnodeRegistered(
        bytes32 indexed node,
        bytes32 indexed label,
        address owner
    );
    event ProjectStateChanged(bytes32 indexed node, bool enabled);

    function setUp() public override {
        super.setUp();

        registrar = new Registrar(_ens, address(0x0));
        _ens.setApprovalForAll(address(registrar), true);
    }

    function testAddRootNode() public {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngine();

        registrar.addRootNode(demoNode, authoriser, rules);

        assertEq(address(registrar.nodeAuthorisers(demoNode)), address(authoriser));
        assertEq(address(registrar.nodeRules(demoNode)), address(rules));
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
        vm.expectEmit(true, true, true, true);
        emit SubnodeRegistered(demoNode, labelhash("banana"), address(this));

        uint256 tokenId = 1;
        bytes memory blob = abi.encode(tokenId);

        registrar.register(demoNode, "banana", address(this), blob);

        assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33), address(this));
    }

    function testChangeNodeState() public {
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

    function testFailChangeStateOnUnintializedProject() public {
        registrar.setRootNodeState(demoNode, true);
    }

    function testValidLabel() public {
        _setUpNode();
        assertTrue(registrar.valid(demoNode, "orange"));
    }

    function testFailCheckValidityWhenDisabled() public {
        registrar.valid(demoNode, "strawberry");
    }

    function _setUpNode() private {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngine();
        registrar.addRootNode(demoNode, authoriser, rules);
    }
}
