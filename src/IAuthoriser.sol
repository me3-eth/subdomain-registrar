// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

interface IAuthoriser {
  // function forEditing(address, string memory) external view returns (bool);
  function canRegister(address, uint256 tokenId) external view returns (bool);
}

interface IRulesEngine {
  function isLabelValid (string memory) external view returns (bool);
  function fuses () external view returns (uint96);
}
