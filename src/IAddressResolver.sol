// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

interface IAddrRead {
    /// @notice Get the Ethereum address of the node
    /// @dev Part of the original ENS spec, see EIP-137 or ENSIP-1
    /// @param node The node which the record is associated with
    /// @return The address associated with the node as payable
    function addr(bytes32 node) external view returns (address payable);
}

interface ICoinAddrRead {
    /// @notice Get the encoded address of coinType
    /// @dev See EIP-2304 or ENSIP-9
    /// @param node The node which the record is associated with
    /// @param coinType A number representing a chain
    /// @return The encoded address
    function addr(bytes32 node, uint256 coinType)
        external
        view
        returns (bytes memory);
}

interface IAddressWrite {
    function setAddr(bytes32 node, address addr) external;

    function setAddr(
        bytes32 node,
        uint256 coinType,
        bytes memory addr
    ) external;
}
