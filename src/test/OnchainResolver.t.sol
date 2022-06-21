// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.10;

import { Test } from "forge-std/Test.sol";
import {OnchainResolver} from "../OnchainResolver.sol";
import {ITextRead, ITextWrite} from "../ITextResolver.sol";

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

  function testTextReadMatchesEns () public {
    ITextRead readInterface;
    bytes4 ensTextResolver = 0x59d1d43c;
    assertTrue(readInterface.text.selector == ensTextResolver);
  }
}
