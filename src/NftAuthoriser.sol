// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import { Owned } from  "solmate/auth/Owned.sol";
import "./IAuthoriser.sol";

interface IERC721 {
  function ownerOf(uint256 id) external view returns (address owner);
}

contract NftAuthoriser is IAuthoriser, Owned(msg.sender) {
  IERC721 public nft;

  mapping(string => uint256) public labelTokenId;

  constructor (address _nft) {
    nft = IERC721(_nft);
  }

  function canRegister (address user, uint256 tokenId) external view returns (bool) {
    return nft.ownerOf(tokenId) == user;
  }

  /*
  function forEditing (address user, string memory label) external view returns (bool) {
    uint256 tokenId = labelTokenId[label];
    require(tokenId > 0, "Invalid tokenId");

  }
 */
}
