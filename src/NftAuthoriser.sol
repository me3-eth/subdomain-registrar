// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import { Owned } from  "solmate/auth/Owned.sol";
import { IAuthoriser, IRulesEngine } from "./IAuthoriser.sol";
import { BlobParser } from "./lib/BlobParser.sol";

interface IERC721 {
  function ownerOf(uint256 id) external view returns (address owner);
}

contract NftAuthoriser is IAuthoriser, IRulesEngine, Owned(msg.sender) {
  IERC721 public nft;

  mapping(string => uint256) public labelTokenId;

  constructor (address _nft) {
    nft = IERC721(_nft);
  }

  function canRegister (bytes32 _node, address _user, bytes[] memory blob) external view returns (bool) {
    require(blob.length == 1, "Only tokenId is required");

    uint256 tokenId = BlobParser.bytesToUint256(blob[0], 0);
    return nft.ownerOf(tokenId) == _user;
  }

  function isLabelValid (string memory label) external view returns (bool) {
    return _strlen(label) > 3;
  }

  /*
  function forEditing (address user, string memory label) external view returns (bool) {
    uint256 tokenId = labelTokenId[label];
    require(tokenId > 0, "Invalid tokenId");

  }
 */

	function _strlen(string memory str) internal pure returns (uint) {
		uint len;
		uint i = 0;
		uint bytelength = bytes(str).length;

		for(len = 0; i < bytelength; len++) {
			bytes1 b = bytes(str)[i];
			if(b < 0x80) {
				i += 1;
			} else if (b < 0xE0) {
				i += 2;
			} else if (b < 0xF0) {
				i += 3;
			} else if (b < 0xF8) {
				i += 4;
			} else if (b < 0xFC) {
				i += 5;
			} else {
				i += 6;
			}
		}

		return len;
	}
}
