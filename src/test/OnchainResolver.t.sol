// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import { Test } from "forge-std/Test.sol";
import {OnchainResolver} from "../OnchainResolver.sol";
import {ITextRead, ITextWrite} from "../ITextResolver.sol";
import {IAddrRead, ICoinAddrRead, IAddressWrite} from "../IAddressResolver.sol";

contract OnchainResolverTest is Test {
  OnchainResolver public resolver;

  function setUp () public {
    resolver = new OnchainResolver();
  }

  function testSupportsTextReadAndWrite () public {
    ITextRead readInterface;
    assertTrue(resolver.supportsInterface(readInterface.text.selector));

    ITextWrite writeInterface;
    assertTrue(resolver.supportsInterface(writeInterface.setText.selector));
  }

  function testSupportsAddrCoinTypeRead () public {
    IAddrRead addrRead;
    assertTrue(resolver.supportsInterface(addrRead.addr.selector));

    ICoinAddrRead coinRead;
    assertTrue(resolver.supportsInterface(coinRead.addr.selector));
  }

  function testReadsMatchENS () public {
    bytes4 ensTextResolver = 0x59d1d43c;
    assertTrue(type(ITextRead).interfaceId == ensTextResolver);

    bytes4 ensAddrResolver = 0x3b3b57de;
    assertTrue(type(IAddrRead).interfaceId == ensAddrResolver);

    bytes4 ensAddressResolver = 0xf1cb7e06;
    assertTrue(type(ICoinAddrRead).interfaceId == ensAddressResolver);
  }
}
