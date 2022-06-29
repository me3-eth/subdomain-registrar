// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ResolverBase} from "./ResolverBase.sol";
import {INameRead, INameWrite} from "./INameResolver.sol";

abstract contract NameResolver is INameRead, INameWrite, ResolverBase {
    mapping(bytes32 => string) private nodeName;

    /// @inheritdoc INameRead
    function name(bytes32 node) external view returns (string memory) {
        return nodeName[node];
    }

    /// @inheritdoc INameWrite
    function setName(bytes32 node, string calldata name) external authorised(node) {
      emit NameChanged(node, name);
      nodeName[node] = name;
    }

    /// @inheritdoc ResolverBase
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return interfaceId == type(INameRead).interfaceId
      || interfaceId == type(INameWrite).interfaceId
      || super.supportsInterface(interfaceId);
    }
}
