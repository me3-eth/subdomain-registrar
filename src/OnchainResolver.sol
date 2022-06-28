// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Owned} from "solmate/auth/Owned.sol";

import {TextResolver} from "./TextResolver.sol";
import {AddressResolver} from "./AddressResolver.sol";
import {IAuthoriser} from "./IAuthoriser.sol";

// TODO add IMulticall

/// @title On-chain ENS Resolver
/// @author charchar.eth
/// @notice Provides the methods that me3 supports with authorisation dependent on project
/// @dev ERC-165 support for read and write functions
contract OnchainResolver is Owned(msg.sender), AddressResolver, TextResolver {
    bytes32 immutable projectNode;

    IAuthoriser public authoriser;

    constructor (bytes32 node, IAuthoriser _authoriser) {
        projectNode = node;
        authoriser = _authoriser;
    }

    function isAuthorised(bytes32 /*node*/)
        internal
        view
        override
        returns (bool)
    {
        require(
            address(authoriser) != address(0x0),
            "Authoriser contract has not been set"
        );

        return authoriser.canEdit(projectNode, msg.sender, new bytes(0));
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(AddressResolver, TextResolver)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
