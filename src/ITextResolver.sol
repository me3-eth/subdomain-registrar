// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

interface ITextRead {
    /// @notice Get the text value of a node
    /// @param node The node which the text records is associated with
    /// @param key The key which the text is under
    function text(bytes32 node, string calldata key)
        external
        view
        returns (string memory);
}

interface ITextWrite {
    /// @notice Should be emitted when a key's value is updated
    /// @param node The node which the text records is associated with
    /// @param key The key which the text is under
    event TextChanged(bytes32 indexed node, string indexed key);

    /// @notice Set the text value of a node
    /// @param node The node which the text records is associated with
    /// @param key The key which the text is under
    /// @param value The value to save for the node and key
    function setText(
        bytes32 node,
        string calldata key,
        string calldata value
    ) external;
}
