// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ResolverBase} from "./ResolverBase.sol";
import {IAddrRead, IAddressWrite, ICoinAddrRead} from "./IAddressResolver.sol";

abstract contract AddressResolver is IAddrRead, ICoinAddrRead, ResolverBase {
    mapping(bytes32 => mapping(uint256 => bytes)) private addresses;

    /// @inheritdoc IAddrRead
    function addr(bytes32 node) public view virtual returns (address payable)
    {}

    /// @inheritdoc ICoinAddrRead
    function addr(bytes32 node, uint256 coinType)
        public
        view
        virtual
        returns (bytes memory)
    {
        return addresses[node][coinType];
    }

    /// @inheritdoc ResolverBase
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return interfaceId == type(IAddrRead).interfaceId
      || interfaceId == type(ICoinAddrRead).interfaceId
      // || interfaceId == type(IAddressWrite).interfaceId
      || super.supportsInterface(interfaceId);
    }
}
