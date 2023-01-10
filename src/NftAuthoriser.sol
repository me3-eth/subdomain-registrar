// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import {Owned} from "solmate/auth/Owned.sol";
import {IAuthoriser} from "./IAuthoriser.sol";
import {IRulesEngine} from "./IRulesEngine.sol";
import {BlobParser} from "./lib/BlobParser.sol";

interface IERC721 {
    function ownerOf(uint256 id) external view returns (address owner);
}

/// @title Authoriser using an NFT
/// @author charchar.eth
/// @notice Determine if a node can be registered or edited using holders of an NFT
contract NftAuthoriser is IAuthoriser, IRulesEngine, Owned(msg.sender) {
    /// @notice The NFT that is providing ownership details
    IERC721 public nft;

    /// @notice The current profile resolver
    address private resolver;

    constructor(address _nft) {
        nft = IERC721(_nft);
    }

    /// @inheritdoc IAuthoriser
    function canRegister(bytes32 _node, address _user, bytes[] memory blob) external view returns (bool) {
        require(blob.length == 1, "Only tokenId is required");

        uint256 tokenId = BlobParser.bytesToUint256(blob[0], 0);
        return nft.ownerOf(tokenId) == _user;
    }

    /// @notice Make sure label is at least four characters long, emojis supported
    /// @param node Unused in this implementation
    /// @inheritdoc IRulesEngine
    function isLabelValid(bytes32 node, string memory label) external view returns (bool isValid) {
        uint256 maxLength = 3;
        uint256 len;
        uint256 i = 0;
        uint256 byteLength = bytes(label).length;
        isValid = false;

        for (len = 0; i < byteLength; len++) {
            if (len == maxLength) {
                isValid = true;
                break;
            }

            bytes1 b = bytes(label)[i];
            if (b < 0x80) {
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

    /// @inheritdoc IRulesEngine
    /// @dev The registrant is always the owner
    function subnodeOwner(address registrant) external view returns (address) {
        return registrant;
    }

    /// @inheritdoc IRulesEngine
    function profileResolver(bytes32, string memory, address)
        external
        view
        returns (address)
    {
        return resolver;
    }

    /// @notice Change the default resolver used at registration
    /// @param _resolver Address of the new resolver
    /// @dev 0x0 is a valid resolver address
    function setResolver (address _resolver) external onlyOwner {
        resolver = _resolver;
    }

    function supportsInterface(bytes4 interfaceId) public view returns (bool) {
        return interfaceId == type(IAuthoriser).interfaceId
        || interfaceId == type(IRulesEngine).interfaceId
        || interfaceId == 0x01ffc9a7;
    }
}
