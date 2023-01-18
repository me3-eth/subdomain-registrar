// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import {Registrar, IENS, IRegistrar} from "../src/Registrar.sol";
import {NftAuthoriser, IERC721} from "../src/NftAuthoriser.sol";
import {GatewayBeta} from "../src/GatewayBeta.sol";

address constant NFT_OWNER = address(0x1);
bytes32 constant ME3_ETH_NODE = 0x868437061435f35898f8ed7fb95d62ca53b460f0bb9d1c6be3bfd796e38d8636;

contract GreatNft is IERC721 {
    function ownerOf(uint256 id) external view returns (address owner) {
        return NFT_OWNER;
    }
}

contract BetaIntegration is Test {
    uint256 mainnetFork;
    IERC721 nft;
    Registrar registrar;
    IENS registry;
    GatewayBeta gateway;

    string MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");
    address ENS_REGISTRY = vm.envAddress("ENS_REGISTRY");

    function setUp() public {
        mainnetFork = vm.createSelectFork(MAINNET_RPC_URL);
        registry = IENS(ENS_REGISTRY);
        nft = new GreatNft();
        registrar = new Registrar(registry);
        gateway = new GatewayBeta(address(registrar));

        registrar.setGateway(address(gateway));
    }

    function testRegisterProjectThroughGateway(address projectOwner, bytes32 node) public {
        NftAuthoriser nftControls = new NftAuthoriser(address(nft));
        vm.prank(projectOwner);
        gateway.register(node, nftControls, nftControls);
    }
}
