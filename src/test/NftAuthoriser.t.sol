pragma solidity >=0.8.10 < 0.9.0;

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
        authoriser = new NftAuthoriser(address(nft), address(0x0));
    }

    function testCanRegister() public {
        bytes memory blob = abi.encode(uint256(1));
        assertTrue(authoriser.canRegister(0x0, address(this), blob));
    }

    function testCannotRegister() public {
        bytes memory blob = abi.encode(uint256(6));
        assertTrue(authoriser.canRegister(0x0, address(this), blob) == false);
    }

    function testCanEdit() public {
        bytes memory blob = abi.encode(uint256(1));
        assertTrue(authoriser.canEdit(0x0, address(this), blob));
    }

    function testCannotEdit() public {
        bytes memory blob = abi.encode(uint256(6));
        assertTrue(authoriser.canEdit(0x0, address(this), blob) == false);
    }

    function testValidLabel() public {
        assertTrue(authoriser.isLabelValid(0x0, "banana"));
        assertTrue(authoriser.isLabelValid(0x0, "helo"));
    }

    function testInvalidLabel() public {
        assertTrue(authoriser.isLabelValid(0x0, "hey") == false);
        assertTrue(authoriser.isLabelValid(0x0, "hi") == false);
    }

    function testSubnodeOwnerIsAlwaysRegistrant(address registrant) public {
        assertTrue(authoriser.subnodeOwner(registrant) == registrant);
    }

    function testProfileResolverIsAlwaysZero(
        bytes32 node,
        string memory label,
        address registrant
    ) public {
        assertTrue(authoriser.profileResolver(node, label, registrant) == address(0x0));
    }
}
