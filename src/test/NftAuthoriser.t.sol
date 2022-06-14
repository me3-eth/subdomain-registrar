pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "../NftAuthoriser.sol";

contract ERC721 {
    mapping(uint256 => address) public tokenOwner;

    constructor(string memory name, string memory symbol) {
        tokenOwner[1] = msg.sender;
        tokenOwner[2] = msg.sender;
    }

    function ownerOf(uint256 tokenId) public view returns (address owner) {
        require(tokenId > 0);
        return tokenOwner[tokenId];
    }
}

contract NftAuthoriserTest is Test {
    NftAuthoriser public authoriser;
    ERC721 public nft;

    function setUp() public {
        nft = new ERC721("It does not", "MTTR");
        authoriser = new NftAuthoriser(address(nft));
    }

    function testCanRegister() public {
        bytes memory blob = abi.encode(uint256(1));

        assertTrue(
      authoriser.canRegister(0x0, address(this), blob)
    );
    }

    function testCannotRegister() public {
        bytes memory blob = abi.encode(uint256(6));

        assertTrue(
      authoriser.canRegister(0x0, address(this), blob) == false
    );
    }

    function testValidLabel() public {
        assertTrue(
      authoriser.isLabelValid("banana")
    );
    }

    function testInvalidLabel() public {
        assertTrue(
      authoriser.isLabelValid("hey") == false
    );

        assertTrue(
      authoriser.isLabelValid("hi") == false
    );

        assertTrue(
      authoriser.isLabelValid("helo")
    );
    }
}
