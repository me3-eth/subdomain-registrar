pragma solidity >=0.8.10 < 0.9.0;

import "forge-std/Test.sol";
import "../NftAuthoriser.sol";
import "../IAuthoriser.sol";
import "../IRulesEngine.sol";

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
        assertTrue(authoriser.canRegister(0x0, address(this), blob));
    }

    function testAddressNotOwnerOfToken() public {
        bytes memory blob = abi.encode(uint256(6));
        assertTrue(authoriser.canRegister(0x0, address(this), blob) == false);
    }

    function testZeroTokenIdFails() public {
        bytes memory authData = abi.encode(uint256(0));
        vm.expectRevert(bytes("Token ID must be above 0"));
        authoriser.canRegister(0x0, address(this), authData);
    }

    function testCanEdit() public {
        bytes memory blob = abi.encode(uint256(1));
        assertTrue(authoriser.canEdit(0x0, address(this), blob));
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

    function testProfileResolverDefaultsToZero(
        bytes32 node,
        string memory label,
        address registrant
    ) public {
        assertTrue(authoriser.profileResolver(node, label, registrant) == address(0x0));
    }

    function testOwnerCanSetResolver(bytes32 node, address resolver) public {
        authoriser.setResolver(resolver);
        assertEq(authoriser.profileResolver(node, "", address(0x0)), resolver);
    }

    function testRandomCannotSetResolver(address user) public {
        vm.expectRevert(bytes("UNAUTHORIZED"));
        vm.prank(user);
        authoriser.setResolver(address(0x0));
    }

    function testSupportedInterfaces(bytes4 badInterfaceId) public {
        assertTrue(authoriser.supportsInterface(type(IAuthoriser).interfaceId));
        assertTrue(authoriser.supportsInterface(type(IRulesEngine).interfaceId));
        assertTrue(authoriser.supportsInterface(0x01ffc9a7));
        assertEq(authoriser.supportsInterface(badInterfaceId), false);
    }
}
