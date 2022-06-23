// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

abstract contract ResolverBase {
  function isAuthorised(bytes32 node, bytes32 project) internal virtual view returns(bool);

  // TODO needs work
  modifier authorised (bytes32 node, bytes32 project) {
    require(isAuthorised(node, project), "User is not authorised");
    _;
  }

  /// @dev Interface support checking following ERC-165
  /// @param interfaceId the interface to check is supported
  /// @return True if interface is supported, false otherwise
  function supportsInterface(bytes4 interfaceId) public virtual view returns (bool) {
    return interfaceId == 0x01ffc9a7;
  }
}
