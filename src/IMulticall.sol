// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

interface IMulticall {
  /// @notice Call multiple resolver functions at once
  /// @dev See unit tests for examples of doing this from Solidity
  /// @param fns Array of function calls
  /// @return The result of all function calls
  function multicall(bytes[] calldata fns) external returns(bytes[] memory);
}
