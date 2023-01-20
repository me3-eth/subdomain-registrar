// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import {Registrar, IRegistrar} from "../src/Registrar.sol";
import {NftAuthoriser, IERC721} from "../src/NftAuthoriser.sol";
import {GatewayBeta} from "../src/GatewayBeta.sol";

address constant NFT_OWNER = address(0x1);
bytes32 constant ME3_ETH_NODE = 0x868437061435f35898f8ed7fb95d62ca53b460f0bb9d1c6be3bfd796e38d8636;

// Include methods that are only used in test preparation
interface EnsRegistryForTests {
    function setSubnodeRecord(bytes32 node, bytes32 label, address owner, address resolver, uint64 ttl)
        external
        virtual;

    function owner(bytes32 node) external view returns (address);

    function setApprovalForAll(address operator, bool approved) external;
}

contract GreatNft is IERC721 {
    function ownerOf(uint256 id) external view returns (address owner) {
        return NFT_OWNER;
    }
}

contract BetaIntegration is Test {
    string MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");
    address ENS_REGISTRY = vm.envAddress("ENS_REGISTRY");

    uint256 mainnetFork;
    EnsRegistryForTests ensRegistry = EnsRegistryForTests(ENS_REGISTRY);

    IERC721 nft;
    Registrar registrar;
    GatewayBeta gateway;
    NftAuthoriser nftControls;

    function setUp() public {
        mainnetFork = vm.createSelectFork(MAINNET_RPC_URL, 16441759);
        nft = new GreatNft();
        nftControls = new NftAuthoriser(address(nft));
        nftControls.setResolver(address(0x7265736f6c766572));

        registrar = new Registrar(address(ensRegistry));
        gateway = new GatewayBeta(address(registrar));

        registrar.setGateway(address(gateway));

        address me3NodeOwner = address(0xF638Bf55B9B7B30A7f3286245E13f6198FCc9879);
        vm.prank(me3NodeOwner);
        ensRegistry.setApprovalForAll(address(registrar), true);
    }

    function testRegisterProjectThroughGateway() public {
        address controlAddr = address(nftControls);

        address projectOwner = address(0x2);
        bytes32 node = ME3_ETH_NODE;
        vm.prank(projectOwner);
        gateway.register(node, nftControls, nftControls);

        assertEq(address(registrar.nodeRules(node)), controlAddr);
        assertEq(address(registrar.nodeAuthorisers(node)), controlAddr);
        assertTrue(registrar.nodeEnabled(node));
    }

    function testCannotOverwriteRegistrationByDifferentUser() public {
        address controlAddr = address(nftControls);

        address projectOwner = address(0x2);
        vm.prank(projectOwner);
        gateway.register(ME3_ETH_NODE, nftControls, nftControls);

        assertEq(address(registrar.nodeRules(ME3_ETH_NODE)), controlAddr);
        assertEq(address(registrar.nodeAuthorisers(ME3_ETH_NODE)), controlAddr);
        assertTrue(registrar.nodeEnabled(ME3_ETH_NODE));

        // setup overwrite
        NftAuthoriser nftOverwrite = new NftAuthoriser(address(nft));

        vm.prank(NFT_OWNER);
        vm.expectRevert(bytes("Project owner mismatch"));
        gateway.register(ME3_ETH_NODE, nftOverwrite, nftOverwrite);
    }

    function testCannotRegisterDueToAddressFilter() public {
        GatewayBeta _gateway = new GatewayBeta(address(registrar));

        address projectOwner = address(0x2);
        vm.prank(projectOwner);
        vm.expectRevert(bytes("Caller does not have permission"));
        _gateway.register(ME3_ETH_NODE, nftControls, nftControls);
    }

    function testTokenHolderCanRegisterSubdomain() public {
        // project registration
        address projectOwner = address(0x2);
        vm.prank(projectOwner);
        gateway.register(ME3_ETH_NODE, nftControls, nftControls);

        // create subdomain
        bytes[] memory blob = new bytes[](1);
        blob[0] = abi.encodePacked(uint256(1));
        vm.prank(NFT_OWNER);
        registrar.register(ME3_ETH_NODE, "tokenholderisme", NFT_OWNER, blob);
    }

    function testCannotRegisterSubdomainAsRando() public {
        // project registration
        address projectOwner = address(0x2);
        vm.prank(projectOwner);
        gateway.register(ME3_ETH_NODE, nftControls, nftControls);

        // create subdomain
        bytes[] memory blob = new bytes[](1);
        blob[0] = abi.encodePacked(uint256(1));
        address rando = vm.makeAddr("random");
        vm.prank(rando);
        registrar.register(ME3_ETH_NODE, "tokenholderisme", rando, blob);
    }
}
