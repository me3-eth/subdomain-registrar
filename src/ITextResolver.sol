// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

interface ITextRead {
    function text(bytes32 node, string calldata key)
        external
        view
        returns (string memory);
}

interface ITextWrite {
    event TextChanged(bytes32 indexed node, string indexed key);

    function setText(
        bytes32 node,
        string calldata key,
        string calldata value
    ) external;
}
