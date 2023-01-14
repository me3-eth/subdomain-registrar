// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

/*
  __  __   U _____ u  _____
U|' \/ '|u \| ___"|/ |___"/u
\| |\/| |/  |  _|"   U_|_ \/
 | |  | |   | |___    ___) |
 |_|  |_|   |_____|  |____/
<<,-,,-.    <<   >>   _// \\
 (./  \.)  (__) (__) (__)(__)

 _______     ________    _________   ______     __ __ __     ________     __  __
/______/\   /_______/\  /________/\ /_____/\   /_//_//_/\   /_______/\   /_/\/_/\
\::::__\/__ \::: _  \ \ \__.::.__\/ \::::_\/_  \:\\:\\:\ \  \::: _  \ \  \ \ \ \ \
 \:\ /____/\ \::(_)  \ \   \::\ \    \:\/___/\  \:\\:\\:\ \  \::(_)  \ \  \:\_\ \ \
  \:\\_  _\/  \:: __  \ \   \::\ \    \::___\/_  \:\\:\\:\ \  \:: __  \ \  \::::_\/
   \:\_\ \ \   \:.\ \  \ \   \::\ \    \:\____/\  \:\\:\\:\ \  \:.\ \  \ \   \::\ \
    \_____\/    \__\/\__\/    \__\/     \_____\/   \_______\/   \__\/\__\/    \__\/ beta

what
	> join the beta and register your project today

from
	> charchar.me3.eth
	> brendan.me3.eth*/

import {Owned} from "solmate/auth/Owned.sol";
import {IRegistrar} from "./Registrar.sol";
import {IAuthoriser} from "./IAuthoriser.sol";
import {IRulesEngine} from "./IRulesEngine.sol";
import {Utilities} from "./Utils.sol";

contract GatewayBeta is Owned(msg.sender) {
    uint256 public cost = 0;
    IRegistrar private registrar;

    constructor(address registrarContract) {
        registrar = IRegistrar(registrarContract);
    }

    function register(string projectEns, IAuthoriser authoriser, IRulesEngine rules) external payable {
        require(msg.value == cost, "Please pay exactly");
        // TODO decompose projectEns to node and label

        registrar.setSubnodeRecord(bytes32(0x0), authoriser, rules, true);
    }
}
