// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ResolverBase} from "./ResolverBase.sol";
import {IAddrRead, ICoinAddrRead, IAddressWrite} from "./IAddressResolver.sol";

abstract contract AddressResolver is IAddrRead, ICoinAddrRead, ResolverBase {
  mapping(bytes32 => mapping(uint => bytes)) private addresses;

  /// @inheritdoc IAddrRead
  function addr (bytes32 node) public virtual view returns(address payable) {
  }

  /// @inheritdoc ICoinAddrRead
  function addr (bytes32 node, uint coinType) public virtual view returns(bytes memory) {
    return addresses[node][coinType];
  }

  /// @inheritdoc ResolverBase
  function supportsInterface(bytes4 interfaceId) public virtual override view returns (bool) {
    return interfaceId == type(IAddrRead).interfaceId
      || interfaceId == type(ICoinAddrRead).interfaceId
      // || interfaceId == type(IAddressWrite).interfaceId
      || super.supportsInterface(interfaceId);
  }
}
