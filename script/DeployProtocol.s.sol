// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {Registrar} from "../src/Registrar.sol";

import "ens-contracts/registry/ENS.sol";

contract DeployRegistrar is Script {
  address constant ensRegistry = 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e;

  function run(address fallbackResolver) external {
    require(fallbackResolver != address(0x0), "Resolver must be set");

    vm.startBroadcast();

    // Deploy Registrar
    Registrar registrar = new Registrar(
      ENS(ensRegistry),
      fallbackResolver
    );

    vm.stopBroadcast();
  }
}
