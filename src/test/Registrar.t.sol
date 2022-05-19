// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "ens-contracts/registry/ENS.sol";
import "ens-contracts/registry/ENSRegistry.sol";
import "ens-contracts/ethregistrar/BaseRegistrarImplementation.sol";
import "name-wrapper/contracts/NameWrapper.sol";
import "name-wrapper/interfaces/IMetadataService.sol";

import "../Registrar.sol";
import "../IAuthoriser.sol";

contract Authoriser is IAuthoriser {
  function authorise (address sender, string memory label ) public view virtual returns (bool) {
    return true;
  }
}

contract RulesEngine is IRulesEngine {
  function isLabelValid (string memory label) external view returns (bool) {
    return true;
  }

  function fuses () external view returns (uint96) {
    return 0;
  }
}

contract MetaSvc is IMetadataService {
  function uri (uint256) public view returns (string memory) {
    return "";
  }
}

contract RegistrarTest is Test {
  ENS private registry;
  Registrar public registrar;

  bytes32 private rootNode = keccak256(abi.encodePacked(bytes32(0x0), _namehash("eth")));
  bytes32 private pccNode;

  event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);

  function setUp() public {
    // setup namewrapper
    registry = new ENSRegistry();
    BaseRegistrarImplementation baseReg = new BaseRegistrarImplementation(registry, rootNode);
    IMetadataService metadata = new MetaSvc();
    NameWrapper nw = new NameWrapper(registry, baseReg, metadata);

    baseReg.setApprovalForAll(address(nw), true);
    registry.setApprovalForAll(address(nw), true);
    // nw.setApprovalForAll(address(this), true);

    uint256 tokenId = uint256(keccak256(bytes("pcc")));
    baseReg.register(tokenId, address(this), 0);
    // pccNode = keccak256(abi.encodePacked(rootNode, _namehash("pcc")));

    /*
    pccNode = nw.setSubnodeOwner(rootNode, "pcc", address(this));

    registrar = new Registrar(registry, nw, address(0x0));

    registry.setOwner(pccNode, address(registrar));
   */
  }

  function testAssert () public {
    assertTrue(true);
  }

  /*
  function testAddRootNode () public {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();

    registrar.addRootNode(pccNode, authoriser, rules);

    assertEq(address(registrar.nodeAuthorisers(pccNode)), address(authoriser));
    assertEq(address(registrar.nodeRules(pccNode)), address(rules));
  }

  function testValidLabelForNode () public {
    _setUpNode();

    bool validLabel = registrar.valid(pccNode, "banana");

    assertTrue(validLabel);
  }

  function testRegisterSubdomain () public {
    _setUpNode();
    vm.expectEmit(true, true, true, true);
    emit NewOwner(pccNode, _namehash("banana"), address(this));

    registrar.register(pccNode, "banana", address(this));
  }

  function _setUpNode () private {
    IAuthoriser authoriser = new Authoriser();
    IRulesEngine rules = new RulesEngine();
    registrar.addRootNode(pccNode, authoriser, rules);
  }
 */

  function _namehash (string memory node) public returns(bytes32) {
    return keccak256(bytes(node));
  }
}
