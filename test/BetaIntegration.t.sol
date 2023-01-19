// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import {Registrar, IENS, IRegistrar} from "../src/Registrar.sol";
import {NftAuthoriser, IERC721} from "../src/NftAuthoriser.sol";
import {GatewayBeta} from "../src/GatewayBeta.sol";

address constant NFT_OWNER = address(0x1);
bytes32 constant ME3_ETH_NODE = 0x868437061435f35898f8ed7fb95d62ca53b460f0bb9d1c6be3bfd796e38d8636;

// Include methods that are only used in test preparation
interface EnsRegistryForTests {}

contract GreatNft is IERC721 {
    function ownerOf(uint256 id) external view returns (address owner) {
        return NFT_OWNER;
    }
}

contract BetaIntegration is Test {
    string MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");
    address ENS_REGISTRY = vm.envAddress("ENS_REGISTRY");

    uint256 mainnetFork;
    IENS ensRegistry = IENS(ENS_REGISTRY);

    IERC721 nft;
    Registrar registrar;
    GatewayBeta gateway;
    NftAuthoriser nftControls;

    function setUp() public {
        mainnetFork = vm.createSelectFork(MAINNET_RPC_URL);
        ensRegistry = IENS(ENS_REGISTRY);
        nft = new GreatNft();
        nftControls = new NftAuthoriser(address(nft));
        nftControls.setResolver(address(0x7265736f6c766572));

        registrar = new Registrar(ensRegistry);
        gateway = new GatewayBeta(address(registrar));

        registrar.setGateway(address(gateway));

        // TODO use test interface
        ensRegistry.setApprovalForAll(address(registrar), true);
    }

    function testRegisterProjectThroughGateway(address projectOwner, bytes32 node) public {
        address controlAddr = address(nftControls);

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
}
