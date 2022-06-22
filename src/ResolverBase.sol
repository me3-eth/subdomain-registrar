// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

abstract contract ResolverBase {
  function isAuthorised(bytes32 node) internal virtual view returns(bool);

  modifier authorised (bytes32 node) {
    // TODO get the project node, get authorisers from registrar, check if user can edit
    _;
  }

  function supportsInterface(bytes4 interfaceId) public virtual view returns (bool) {
    return interfaceId == 0x01ffc9a7;
  }
}
