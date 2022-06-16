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

    function canEdit(
        bytes32 node,
        address sender,
        bytes memory blob
    ) public view virtual returns (bool) {
        return true;
    }
}

contract RulesEngine is IRulesEngine {
    function isLabelValid(bytes32 node, string memory label)
        external
        view
        returns (bool)
    {
        return true;
    }

    function subnodeOwner(address registrant) external view returns (address) {
        return registrant;
    }

    function profileResolver(
        bytes32 node,
        string memory label,
        address registrant
    ) external view returns (address) {
        return address(0x0);
    }
}

contract RulesEngineWithOwnResolver is IRulesEngine {
    function isLabelValid(bytes32 node, string memory label)
        external
        view
        returns (bool)
    {
        return true;
    }

    function subnodeOwner(address registrant) external view returns (address) {
        return registrant;
    }

    function profileResolver(
        bytes32 node,
        string memory label,
        address registrant
    ) external view returns (address) {
        return address(0xabc123);
    }
}

contract RegistrarTest is EnsSetup {
    Registrar public registrar;

    event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);
    event SubnodeRegistered(
        bytes32 indexed node,
        bytes32 indexed label,
        address owner,
        address registrant
    );
    event ProjectStateChanged(
        bytes32 indexed node,
        address authoriser,
        address rules,
        bool enabled
    );
    event FallbackResolverUpdated(address indexed resolverAddr);

    function setUp() public override {
        super.setUp();

        registrar = new Registrar(_ens, address(_defaultResolver));
        _ens.setApprovalForAll(address(registrar), true);
    }

    function testAddRootNode() public {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngine();

        registrar.setProjectNode(demoNode, authoriser, rules, true);

        assertEq(address(registrar.nodeAuthorisers(demoNode)), address(authoriser));
        assertEq(address(registrar.nodeRules(demoNode)), address(rules));
        assertTrue(registrar.nodeEnabled(demoNode));
    }

    function testValidLabelForNode() public {
        _setUpNode();

        bool validLabel = registrar.valid(demoNode, "banana");

        assertTrue(validLabel);
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

    function testRegisterSubdomain() public {
        _setUpNode();
        vm.expectEmit(true, true, true, true);
        emit SubnodeRegistered(demoNode, labelhash("banana"), address(this), address(this));
        vm.expectEmit(true, true, true, true);
        emit NewOwner(demoNode, labelhash("banana"), address(this));

        uint256 tokenId = 1;
        bytes memory blob = abi.encode(tokenId);

        registrar.register(demoNode, "banana", blob);

        assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33), address(this));
    }

    function testCannotRegisterExistingSubdomain() public {
        _setUpNode();
        _ens.setSubnodeRecord(demoNode, labelhash("frens"), address(this), address(_defaultResolver), 86400);

        uint256 tokenId = 2;
        bytes memory blob = abi.encode(tokenId);

        vm.expectRevert(bytes("Label must be available to register"));
        registrar.register(demoNode, "frens", blob);
    }

    function testRulesHasOwnResolverAtRegistration() public {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngineWithOwnResolver();
        registrar.setProjectNode(demoNode, authoriser, rules, true);

        address expectedResolver = address(0xabc123);

        assertTrue(registrar.fallbackResolver() != expectedResolver);

        registrar.register(demoNode, "person", abi.encode(uint256(1)));

        assertEq(_ens.resolver(namehash(demoNode, labelhash("person"))), expectedResolver);
    }

    function testChangeFallbackResolver(address newResolver) public {
        vm.assume(newResolver != address(0x0));

        _setUpNode();
        vm.expectEmit(true, false, false, false);
        emit FallbackResolverUpdated(newResolver);

        registrar.changeFallbackResolver(newResolver);
        assertEq(registrar.fallbackResolver(), newResolver);
    }

    function testCannotChangeResolverToZero() public {
        _setUpNode();

        vm.expectRevert(bytes("Resolver must be a real contract"));
        registrar.changeFallbackResolver(address(0x0));
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

    function testFuzzSetProjectNode(
        bytes32 node,
        address auth,
        address rules,
        bool enabled
    ) public {
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
        registrar.valid(demoNode, "strawberry");
    }

    function _setUpNode() private {
        IAuthoriser authoriser = new Authoriser();
        IRulesEngine rules = new RulesEngine();
        registrar.setProjectNode(demoNode, authoriser, rules, true);
    }
}
