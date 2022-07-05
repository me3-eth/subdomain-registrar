// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import {Test} from "forge-std/Test.sol";
import {OnchainResolver} from "../OnchainResolver.sol";
import {ITextRead, ITextWrite} from "../resolvers/ITextResolver.sol";
import {IAddrRead, IAddressWrite, ICoinAddrRead} from "../resolvers/IAddressResolver.sol";
import {IAuthoriser} from "../IAuthoriser.sol";

contract Authoriser is IAuthoriser {
    function canRegister(
        bytes32 node,
        address sender,
        bytes memory blob
    ) public view virtual returns (bool) {
        return true;
    }

    function canEdit(
        bytes32 node,
        address sender,
        bytes memory blob
    ) public view virtual returns (bool) {
        return true;
    }
}

contract OnchainResolverTest is Test {
    OnchainResolver public resolver;
    bytes32 public ethNode = 0x93cdeb708b7545dc668eb9280176169d1c33cfd8ed6f04690a0bcc88a93fc4ae;

    event AddrChanged(bytes32 indexed node, address addr);
    event AddressChanged(bytes32 indexed node, uint256 coinType, bytes addr);
    event TextChanged(bytes32 indexed node, string indexed key);
    event NameChanged(bytes32 indexed node, string name);

    function setUp() public {
        IAuthoriser auth = new Authoriser();
        resolver = new OnchainResolver(ethNode, auth);
    }

    function testMulticall(string memory key, string memory value) public {
        bytes32 node = keccak256(abi.encode("someone"));
        // Call the text functions through multicall
        bytes memory setTextEnc = abi.encodeWithSignature("setText(bytes32,string,string)", node, key, value);
        bytes memory textEnc = abi.encodeWithSignature("text(bytes32,string)", node, key);

        bytes[] memory fns = new bytes[](2);
        fns[0] = setTextEnc;
        fns[1] = textEnc;

        bytes[] memory results = resolver.multicall(fns);
        assertEq(abi.decode(results[1], (string)), value);
    }

    function testWrongResultMulticall(string memory key, string memory value) public {
        bytes32 node = keccak256(abi.encode("someone"));
        // Call the text functions through multicall
        bytes memory setTextEnc = abi.encodeWithSignature("setText(bytes32,string,string)", node, "", value);
        bytes memory textEnc = abi.encodeWithSignature("text(bytes32,string)", node, key);

        bytes[] memory fns = new bytes[](2);
        fns[0] = setTextEnc;
        fns[1] = textEnc;

        bytes[] memory results = resolver.multicall(fns);
        assertTrue(keccak256(results[1]) != keccak256(abi.encodePacked(value)));
    }

    function testMulticallUnsuccessful() public {
        bytes32 node = keccak256(abi.encode("someone"));
        bytes memory badFnEnc = abi.encodeWithSignature("textual(bytes32,string)", node, "key");

        bytes[] memory fns = new bytes[](1);
        fns[0] = badFnEnc;

        bytes[] memory results = resolver.multicall(fns);
        assertEq0(results[0], new bytes(0));
    }

    function testName() public {
        bytes32 node = keccak256(abi.encode("someone"));

        vm.expectEmit(true, true, true, true);
        emit NameChanged(node, "jimmy");

        resolver.setName(node, "jimmy");
        assertEq("jimmy", resolver.name(node));
    }

    function testAddr() public {
        bytes32 node = keccak256(abi.encode("someone"));

        vm.expectEmit(true, true, true, true);
        emit AddrChanged(node, address(this));

        resolver.setAddr(node, address(this));
        assertEq(payable(address(this)), resolver.addr(node));
    }

    function testAddress() public {
        bytes32 node = keccak256(abi.encode("someone"));
        address resolverAddr = address(resolver);
        bytes memory encoded = new bytes(20);
        assembly {
            mstore(add(encoded, 32), mul(resolverAddr, exp(256, 12)))
        }

        vm.expectEmit(true, true, true, true);
        emit AddressChanged(node, 60, encoded);

        resolver.setAddr(node, 60, encoded);
        assertEq(encoded, resolver.addr(node, 60));
    }

    function testText(string memory key, string memory value) public {
        bytes32 node = keccak256(abi.encode("someone"));

        vm.expectEmit(true, true, true, true);
        emit TextChanged(node, key);

        resolver.setText(node, key, value);
        assertEq(value, resolver.text(node, key));
    }

    function testSupportsTextReadAndWrite() public {
        ITextRead readInterface;
        assertTrue(resolver.supportsInterface(readInterface.text.selector));
        bytes4 ensTextResolver = 0x59d1d43c;
        assertTrue(type(ITextRead).interfaceId == ensTextResolver);

        ITextWrite writeInterface;
        assertTrue(resolver.supportsInterface(writeInterface.setText.selector));
    }

    function testSupportsAddrCoinTypeRead() public {
        IAddrRead addrRead;
        assertTrue(resolver.supportsInterface(addrRead.addr.selector));
        bytes4 ensAddrResolver = 0x3b3b57de;
        assertTrue(type(IAddrRead).interfaceId == ensAddrResolver);

        ICoinAddrRead coinRead;
        assertTrue(resolver.supportsInterface(coinRead.addr.selector));
        bytes4 ensAddressResolver = 0xf1cb7e06;
        assertTrue(type(ICoinAddrRead).interfaceId == ensAddressResolver);
    }
}
