// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

interface IAuthoriser {
  function authorise(uint256, address) external view returns (bool);
}

interface IRulesEngine {
  function isLabelValid (string memory label) external view returns (bool);
}
