// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "../NftAuthoriser.sol";

contract ERC721 {
  mapping(uint256 => address) public tokenOwner;

  constructor (string memory name, string memory symbol) {
    tokenOwner[1] = msg.sender;
    tokenOwner[2] = msg.sender;
  }

  function ownerOf (uint256 tokenId) public view returns (address owner) {
    require(tokenId > 0);
    return tokenOwner[tokenId];
  }
}

contract NftAuthoriserTest is Test {
  NftAuthoriser public authoriser;
  ERC721 public nft;

  function setUp () public {
    nft = new ERC721("It does not", "MTTR");
    authoriser = new NftAuthoriser(address(nft));
  }

  function testCanRegister () public {
    assertTrue(
      authoriser.canRegister(address(this), 1)
    );
  }

  function testCannotRegister () public {
    // Based on this fake NFT, only tokens 1 and 2 are registered to the address
    assertTrue(
      authoriser.canRegister(address(this), 5) == false
    );
  }
}
