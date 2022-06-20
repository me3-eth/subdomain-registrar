// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {NftAuthoriser} from "../src/NftAuthoriser.sol";

contract DeployNftAuthoriser is Script {
  function run (address nftContract, address resolver) external {
    require(nftContract != address(0x0), "NFT contract must be a real contract");

    vm.startBroadcast();
    new NftAuthoriser(nftContract, resolver);
    vm.stopBroadcast();
  }
}
