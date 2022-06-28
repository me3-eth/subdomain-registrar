// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {NftAuthoriser} from "../src/NftAuthoriser.sol";
import {OnchainResolver} from "../src/OnchainResolver.sol";
import {IRegistrar} from "../src/Registrar.sol";

contract DeployNftAuthoriser is Script {
    function run (address nftContract, bytes32 node, address registrar) external {
        require(nftContract != address(0x0), "NFT contract must be a real contract");
        require(registrar != address(0x0), "Registrar contract must be a real contract");

        vm.startBroadcast();
        NftAuthoriser combo = new NftAuthoriser(nftContract, address(0x0));

        OnchainResolver resolver = new OnchainResolver(node, combo);

        combo.setResolver(address(resolver));

        IRegistrar(registrar).setProjectNode(node, combo, combo, true);
        vm.stopBroadcast();
    }
}
