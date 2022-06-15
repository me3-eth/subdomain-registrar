pragma solidity >=0.8.10 < 0.9.0;

import {Owned} from "solmate/auth/Owned.sol";
import {IAuthoriser} from "./IAuthoriser.sol";
import {IRulesEngine} from "./IRulesEngine.sol";

/// @title Lightweight ERC-721 interface
/// @author charchar.eth
/// @notice Only a limited set of functions is needed for NftAuthoriser
interface IERC721 {
    /// @notice Get the owner of given token ID
    /// @param id Token ID
    /// @return owner Address of the owner
    function ownerOf(uint256 id) external view returns (address owner);
}

/// @title Authoriser using an NFT
/// @author charchar.eth
/// @notice Determine if a node can be registered or edited using holders of an NFT
contract NftAuthoriser is IAuthoriser, IRulesEngine, Owned(msg.sender) {
    /// @notice The NFT that is providing ownership details
    IERC721 public nft;

    constructor(address _nft) {
        nft = IERC721(_nft);
    }

    /// @inheritdoc IAuthoriser
    function canRegister(
        bytes32 _node,
        address _user,
        bytes memory authData
    ) external view returns (bool) {
        (uint256 tokenId) = abi.decode(authData, (uint256));
        require(tokenId > 0, "Token ID must be above 0");

        return nft.ownerOf(tokenId) == _user;
    }

    /// @notice Make sure label is at least four characters long, emojis supported
    /// @param label User provided label
    /// @return isValid True if four or more characters, false otherwise
    function isLabelValid(string memory label)
        external
        pure
        returns (bool isValid)
    {
        uint256 minLength = 3;
        uint256 len;
        uint256 i = 0;
        uint256 byteLength = bytes(label).length;
        isValid = false;

        for(len = 0; i < byteLength; len++) {
          if (len == minLength) {
            isValid = true;
            break;
          }

          bytes1 b = bytes(label)[i];
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

        return isValid;
    }
}
