// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import { Owned } from  "solmate/auth/Owned.sol";
import { MerkleProof } from "openzeppelin-contracts/contracts/utils/cryptography/MerkleProof.sol";
import { IAuthoriser } from "./IAuthoriser.sol";

interface IERC721 {
  function ownerOf(uint256 id) external view returns (address owner);
}

contract NftAuthoriser is IAuthoriser, Owned(msg.sender) {
  IERC721 public nft;
  bytes32 public merkleRoot;

  mapping(string => uint256) public labelTokenId;

  constructor (address _nft, bytes32 _merkleRoot) {
    nft = IERC721(_nft);
    merkleRoot = _merkleRoot;
  }

  /// @notice Update merkle root
  /// @param _merkleRoot new merkle root
  function updateMerkleRoot (bytes32 _merkleRoot) external onlyOwner {
    merkleRoot = _merkleRoot;
  }

  function canRegister (address _user, uint256 _tokenId) external view returns (bool) {
    return nft.ownerOf(_tokenId) == _user;
  }

  /*
  function forEditing (address user, string memory label) external view returns (bool) {
    uint256 tokenId = labelTokenId[label];
    require(tokenId > 0, "Invalid tokenId");

  }
 */
}
