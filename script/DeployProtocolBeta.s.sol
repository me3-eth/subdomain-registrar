// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";

import {Registrar} from "../src/Registrar.sol";
import {GatewayBeta} from "../src/GatewayBeta.sol";

contract DeployProtocolBeta is Script {
    function run(uint64 nonce) external {
        uint256 privateKey = vm.envUint("PROTOCOL_WALLET_PK");
        vm.setNonce(vm.addr(privateKey), nonce);

        address ENS_REGISTRY = vm.envAddress("ENS_REGISTRY");
        vm.startBroadcast(privateKey);

        Registrar registrar = new Registrar(ENS_REGISTRY);

        GatewayBeta gateway = new GatewayBeta(address(registrar));
        registrar.setGateway(address(gateway));

        vm.stopBroadcast();
    }
}
