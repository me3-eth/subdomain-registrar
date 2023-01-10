// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

library BlobParser {
    function bytesToUint256(bytes memory bs, uint256 start) internal pure returns (uint256) {
        require(bs.length >= start + 32, "Slicing out of range");

        uint256 x;
        assembly {
            x := mload(add(bs, add(0x20, start)))
        }

        return x;
    }
}
