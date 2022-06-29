// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {ResolverBase} from "./ResolverBase.sol";
import {IAddrRead, IAddressWrite, ICoinAddrRead} from "./IAddressResolver.sol";

abstract contract AddressResolver is IAddrRead, IAddressWrite, ICoinAddrRead, ResolverBase {
    mapping(bytes32 => mapping(uint256 => bytes)) private addresses;

    /// @notice The coin type used for ETH
    uint constant public COINTYPE_ETH = 60;

    /// @inheritdoc IAddrRead
    function addr(bytes32 node) public view virtual returns (address payable) {
        bytes memory _addr = addr(node, COINTYPE_ETH);
        if (_addr.length == 0) {
            return payable(0x0);
        }

        return bytesToAddress(_addr);
    }

    /// @inheritdoc ICoinAddrRead
    function addr(bytes32 node, uint256 coinType)
        public
        view
        virtual
        returns (bytes memory)
    {
        return addresses[node][coinType];
    }

    /// @inheritdoc IAddressWrite
    function setAddr(bytes32 node, address _addr) public virtual authorised(node) {
        emit AddrChanged(node, _addr);

        bytes memory encoded = addressToBytes(_addr);
        addresses[node][uint256(COINTYPE_ETH)] = encoded;
    }

    /// @inheritdoc IAddressWrite
    function setAddr(bytes32 node, uint256 coinType, bytes memory encodedAddress) public virtual authorised(node) {
        emit AddressChanged(node, coinType, encodedAddress);

        addresses[node][coinType] = encodedAddress;
    }

    /// @inheritdoc ResolverBase
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return interfaceId == type(IAddrRead).interfaceId
          || interfaceId == type(ICoinAddrRead).interfaceId
          || interfaceId == type(IAddressWrite).interfaceId
          || super.supportsInterface(interfaceId);
    }

    function bytesToAddress(bytes memory encodedEthAddress)
        internal
        pure
        returns (address payable decoded)
    {
        require(encodedEthAddress.length == 20, "ETH address was coded incorrectly");
        assembly {
            decoded := div(mload(add(encodedEthAddress, 32)), exp(256, 12))
        }
    }

    function addressToBytes(address _addr)
        internal
        pure
        returns (bytes memory encoded)
    {
        encoded = new bytes(20);
        assembly {
            mstore(add(encoded, 32), mul(_addr, exp(256, 12)))
        }
    }
}
