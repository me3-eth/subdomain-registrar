// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ResolverBase} from "./ResolverBase.sol";
import {ITextRead, ITextWrite} from "./ITextResolver.sol";

abstract contract TextResolver is ITextRead, ITextWrite, ResolverBase {
  mapping(bytes32 => mapping(string => string)) private nodeText;

  /// @inheritdoc ITextRead
  function text(bytes32 node, string calldata key) external virtual override view returns (string memory) {
    return nodeText[node][key];
  }

  /// @inheritdoc ITextWrite
  function setText(bytes32 node, string calldata key, string calldata value) virtual external authorised {
    emit TextChanged(node, key);
    nodeText[node][key] = value;
  }

  /// @inheritdoc ResolverBase
  function supportsInterface(bytes4 interfaceId) public virtual override view returns (bool) {
    return interfaceId == type(ITextRead).interfaceId
      || interfaceId == type(ITextWrite).interfaceId
      || super.supportsInterface(interfaceId);
  }
}
