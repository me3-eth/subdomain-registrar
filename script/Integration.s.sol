// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {Registrar} from "../src/Registrar.sol";
import {NftAuthoriser} from "../src/NftAuthoriser.sol";
import {OnchainResolver} from "../src/OnchainResolver.sol";

import "ens-contracts/registry/ENS.sol";

contract DemoNft {
    string public name = "Demo NFT";
    string public symbol = "DNFT";

    uint256 public counter = 1;
    mapping(uint256 => address) public tokens;

    function ownerOf (uint256 id) external view returns (address) {
        return tokens[id];
    }

    function mint () external {
        tokens[counter] = msg.sender;
        counter = counter + 1;
    }
}

contract Integration is Script {
    address constant ensRegistry = 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e;
    bytes32 constant projectNode = 0x138e2592a3674bb8b32cb6975df6d50a1607cf343df5cc1517342b0f86848124;

    function run () external {
        (Registrar registrar, DemoNft nft) = setupProtocol();
        mintTokenRegisterSub(registrar, nft);
    }

    function setupProtocol () internal returns (Registrar, DemoNft) {
        // Create all the contracts
        Registrar registrar = new Registrar(ENS(ensRegistry));
        DemoNft nft = new DemoNft();
        NftAuthoriser combo = new NftAuthoriser(address(nft));
        OnchainResolver resolver = new OnchainResolver(projectNode, combo);

        // Link contracts together
        combo.setResolver(address(resolver));
        registrar.setProjectNode(projectNode, combo, combo, true);

        // get the current owner and pretend to be them to assign Registrar as a controller
        address ensNodeOwner = ENS(ensRegistry).owner(projectNode);
        vm.prank(ensNodeOwner);
        ensRegistry.call(abi.encodeWithSignature("setApprovalForAll(address,bool)", address(registrar), true));

        return (registrar, nft);
    }

    function mintTokenRegisterSub(Registrar registrar, DemoNft nft) internal {
        vm.startPrank(address(0xabc123));

        nft.mint();
        uint256 tokenId = nft.counter() - 1;
        bytes memory authData = abi.encode(tokenId);
        registrar.register(projectNode, "batman", authData);

        vm.stopPrank();
    }
}
