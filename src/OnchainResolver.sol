// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Owned} from "solmate/auth/Owned.sol";

import {TextResolver} from "./resolvers/Text.sol";
import {AddressResolver} from "./resolvers/Address.sol";
import {NameResolver} from "./resolvers/Name.sol";
import {IAuthoriser} from "./IAuthoriser.sol";
import {IMulticall} from "./IMulticall.sol";

/// @title On-chain ENS Resolver
/// @author charchar.eth
/// @notice Provides the methods that me3 supports with authorisation dependent on project
/// @dev ERC-165 support for read and write functions
contract OnchainResolver is IMulticall, Owned(msg.sender), AddressResolver, NameResolver, TextResolver {
    bytes32 immutable public projectNode;

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

    function multicall (bytes[] calldata fns) external returns (bytes[] memory) {
        require(fns.length > 0, "No functions were passed");
        bytes[] memory results = new bytes[](fns.length);

        for (uint i = 0; i < fns.length; i++) {
            (bool success, bytes memory result) = address(this).delegatecall(fns[i]);
            results[i] = result;
        }

        return results;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(AddressResolver, NameResolver, TextResolver)
        returns (bool)
    {
        return interfaceId == type(IMulticall).interfaceId || super.supportsInterface(interfaceId);
    }
}
