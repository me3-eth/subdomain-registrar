// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

interface INameRead {
    /// @notice Get the name of the associated node
    /// @param node Associated node
    function name(bytes32 node) external view returns (string memory);
}

interface INameWrite {
    /// @notice Should be emitted whenever the name changes
    /// @param node Associated node
    /// @param name The new name
    event NameChanged(bytes32 indexed node, string memory name);

    /// @notice Set the name of the associated node
    /// @param node Associated node
    /// @param name The new name
    function setName(bytes32 node, string calldata name) external;
}
