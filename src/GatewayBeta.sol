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

/// @title me3 Beta Gateway
/// @author charchar.eth
/// @notice Beta Gateway allowing any project to signup to our subdomain registrar
/// @dev 0.1.0
contract GatewayBeta is Owned(msg.sender) {
    IRegistrar private registrar;

    /// @notice the cost to signup
    uint256 public cost = 0;

    constructor(address registrarContract) {
        registrar = IRegistrar(registrarContract);
    }

    /// @notice Register a project with the me3 subdomain registrar
    /// @param projectEns The ENS name of the project, eg me3.eth
    /// @param authoriser The authorisation contract
    /// @param rules The rules around availability, validity, and usage
    function register(string projectEns, IAuthoriser authoriser, IRulesEngine rules) external payable {
        require(msg.value == cost, "Please pay exactly");

        bytes32 node = Utilities.namehash(projectEns);
        registrar.setSubnodeRecord(node, authoriser, rules, true);
    }
}
