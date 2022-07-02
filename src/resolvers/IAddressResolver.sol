// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

interface IAddrRead {
    /// @notice When ever the Ethereum address is changed
    /// @param node The node which the address is associated with
    /// @param addr The new address that has been set
    event AddrChanged(bytes32 indexed node, address addr);

    /// @notice Get the Ethereum address of the node
    /// @dev Part of the original ENS spec, see EIP-137 or ENSIP-1
    /// @param node The node which the record is associated with
    /// @return The address associated with the node as payable
    function addr(bytes32 node) external view returns (address payable);
}

interface ICoinAddrRead {
    /// @notice When ever a new coin type address is changed
    /// @param node The node which the address is associated with
    /// @param coinType The coin type number, data comes from SLIP-0044
    /// @param addr The new address
    event AddressChanged(bytes32 indexed node, uint256 coinType, bytes addr);

    /// @notice Get the encoded address of coinType
    /// @dev See EIP-2304 or ENSIP-9
    /// @param node The node which the record is associated with
    /// @param coinType The coin type number, data comes from SLIP-0044
    /// @return The encoded address
    function addr(bytes32 node, uint256 coinType)
        external
        view
        returns (bytes memory);
}

interface IAddressWrite {
    /// @notice Set the ethereum address associated with the node
    /// @param node The node which the record is associated with
    /// @param _addr The ethereum address to associate
    function setAddr(bytes32 node, address _addr) external;

    /// @notice Associate any encoded blockchain address with the node
    /// @param node The node which the record is associated with
    /// @param coinType The coin type number, data comes from SLIP-0044
    /// @param encodedAddress The address to associate with the node
    function setAddr(
        bytes32 node,
        uint256 coinType,
        bytes memory encodedAddress
    ) external;
}
