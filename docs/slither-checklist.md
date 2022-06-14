Summary
 - [name-reused](#name-reused) (2 results) (High)
 - [shadowing-state](#shadowing-state) (1 results) (High)
 - [uninitialized-local](#uninitialized-local) (5 results) (Medium)
 - [unused-return](#unused-return) (5 results) (Medium)
 - [shadowing-local](#shadowing-local) (43 results) (Low)
 - [events-maths](#events-maths) (1 results) (Low)
 - [missing-zero-check](#missing-zero-check) (4 results) (Low)
 - [calls-loop](#calls-loop) (1 results) (Low)
 - [variable-scope](#variable-scope) (3 results) (Low)
 - [reentrancy-benign](#reentrancy-benign) (13 results) (Low)
 - [reentrancy-events](#reentrancy-events) (21 results) (Low)
 - [timestamp](#timestamp) (6 results) (Low)
 - [assembly](#assembly) (27 results) (Informational)
 - [boolean-equal](#boolean-equal) (4 results) (Informational)
 - [pragma](#pragma) (1 results) (Informational)
 - [dead-code](#dead-code) (2 results) (Informational)
 - [solc-version](#solc-version) (25 results) (Informational)
 - [low-level-calls](#low-level-calls) (11 results) (Informational)
 - [missing-inheritance](#missing-inheritance) (2 results) (Informational)
 - [naming-convention](#naming-convention) (69 results) (Informational)
 - [redundant-statements](#redundant-statements) (1 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
 - [too-many-digits](#too-many-digits) (4 results) (Informational)
 - [unused-state](#unused-state) (11 results) (Informational)
 - [constable-states](#constable-states) (2 results) (Optimization)
 - [external-function](#external-function) (54 results) (Optimization)

## name-reused
Impact: High
Confidence: High
 - [ ] ID-0
ERC721 is re-used:
	- [ERC721](src/test/NftAuthoriser.t.sol#L6-L18)
	- [ERC721](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L19-L447)

src/test/NftAuthoriser.t.sol#L6-L18


 - [ ] ID-1
IERC721 is re-used:
	- [IERC721](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol#L11-L143)
	- [IERC721](src/NftAuthoriser.sol#L7-L9)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol#L11-L143


## shadowing-state
Impact: High
Confidence: High
 - [ ] ID-2
[InterfaceResolver.INTERFACE_META_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L7) shadows:
	- [ResolverBase.INTERFACE_META_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L3)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L7


## uninitialized-local
Impact: Medium
Confidence: Medium
 - [ ] ID-3
[RRUtils.compareNames(bytes,bytes).otherprevoff](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/RRUtils.sol#L296) is a local variable never initialized

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/RRUtils.sol#L296


 - [ ] ID-4
[RRUtils.compareNames(bytes,bytes).prevoff](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/RRUtils.sol#L295) is a local variable never initialized

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/RRUtils.sol#L295


 - [ ] ID-5
[Buffer.fromBytes(bytes).buf](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L55) is a local variable never initialized

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L55


 - [ ] ID-6
[DNSResolver.setDNSRecords(bytes32,bytes).value](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L66) is a local variable never initialized

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L66


 - [ ] ID-7
[DNSResolver.setDNSRecords(bytes32,bytes).name](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L65) is a local variable never initialized

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L65


## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-8
[EnsSetup.setUp()](lib/forge-ens/src/EnsSetup.sol#L43-L71) ignores return value by [_baseRegistrar.register(uint256(hashedLabel),address(this),86400)](lib/forge-ens/src/EnsSetup.sol#L65)

lib/forge-ens/src/EnsSetup.sol#L43-L71


 - [ ] ID-9
[BaseRegistrarImplementation.reclaim(uint256,address)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L144-L147) ignores return value by [ens.setSubnodeOwner(baseNode,bytes32(id),owner)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L146)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L144-L147


 - [ ] ID-10
[BaseRegistrarImplementation._register(uint256,address,uint256,bool)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113-L130) ignores return value by [ens.setSubnodeOwner(baseNode,bytes32(id),owner)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L124)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113-L130


 - [ ] ID-11
[RegistrarTest.testFailCheckValidityWhenDisabled()](src/test/Registrar.t.sol#L105-L107) ignores return value by [registrar.valid(demoNode,strawberry)](src/test/Registrar.t.sol#L106)

src/test/Registrar.t.sol#L105-L107


 - [ ] ID-12
[ERC721._checkOnERC721Received(address,address,uint256,bytes)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409) ignores return value by [IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L394-L405)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409


## shadowing-local
Impact: Low
Confidence: High
 - [ ] ID-13
[BaseRegistrarImplementation.reclaim(uint256,address).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L144) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L144


 - [ ] ID-14
[ENS.setRecord(bytes32,address,address,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L20) shadows:
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L20


 - [ ] ID-15
[ENS.isApprovedForAll(address,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L31) shadows:
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L31


 - [ ] ID-16
[ENS.setOwner(bytes32,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L24) shadows:
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L24


 - [ ] ID-17
[ETHRegistrarController.makeCommitmentWithConfig(string,address,bytes32,address,address).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L70) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L70


 - [ ] ID-18
[ENS.setSubnodeOwner(bytes32,bytes32,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L22) shadows:
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L22


 - [ ] ID-19
[ENSRegistry.setResolver(bytes32,address).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L86) shadows:
	- [ENSRegistry.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L131-L133) (function)
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L86


 - [ ] ID-20
[BaseRegistrar.register(uint256,address,uint256).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrar.sol#L43) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrar.sol#L43


 - [ ] ID-21
[ENS.setRecord(bytes32,address,address,uint64).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L20) shadows:
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L20


 - [ ] ID-22
[ENSRegistry.setTTL(bytes32,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L96) shadows:
	- [ENSRegistry.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L140-L142) (function)
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L96


 - [ ] ID-23
[ENSRegistry._setOwner(bytes32,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L163) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L163


 - [ ] ID-24
[ENSRegistry.setSubnodeRecord(bytes32,bytes32,address,address,uint64).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L53) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L53


 - [ ] ID-25
[BaseRegistrarImplementation.registerOnly(uint256,address,uint256).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L109) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L109


 - [ ] ID-26
[ENSRegistry.setRecord(bytes32,address,address,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L40) shadows:
	- [ENSRegistry.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L140-L142) (function)
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L40


 - [ ] ID-27
[ETHRegistrarController.register(string,address,uint256,bytes32).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L84) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L84


 - [ ] ID-28
[NameResolver.setName(bytes32,string).name](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/NameResolver.sol#L17) shadows:
	- [NameResolver.name(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/NameResolver.sol#L28-L30) (function)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/NameResolver.sol#L17


 - [ ] ID-29
[ENS.setSubnodeRecord(bytes32,bytes32,address,address,uint64).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L21) shadows:
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L21


 - [ ] ID-30
[BaseRegistrar.reclaim(uint256,address).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrar.sol#L50) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrar.sol#L50


 - [ ] ID-31
[ENSRegistry.isApprovedForAll(address,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L159) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L159


 - [ ] ID-32
[Registrar.register(bytes32,string,address,bytes[]).owner](src/Registrar.sol#L111) shadows:
	- [Owned.owner](lib/solmate/src/auth/Owned.sol#L17) (state variable)

src/Registrar.sol#L111


 - [ ] ID-33
[ENSRegistry.authorised(bytes32).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L21) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L21


 - [ ] ID-34
[ENSRegistry._setResolverAndTTL(bytes32,address,uint64).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L167) shadows:
	- [ENSRegistry.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L131-L133) (function)
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L167


 - [ ] ID-35
[ENSRegistry.setOwner(bytes32,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L63) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L63


 - [ ] ID-36
[ENS.setRecord(bytes32,address,address,uint64).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L20) shadows:
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L20


 - [ ] ID-37
[ENS.setSubnodeRecord(bytes32,bytes32,address,address,uint64).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L21) shadows:
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L21


 - [ ] ID-38
[ENS.setTTL(bytes32,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L25) shadows:
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L25


 - [ ] ID-39
[ENS.setResolver(bytes32,address).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L23) shadows:
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L23


 - [ ] ID-40
[ENSRegistry.setRecord(bytes32,address,address,uint64).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L40) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L40


 - [ ] ID-41
[ENSRegistry.setRecord(bytes32,address,address,uint64).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L40) shadows:
	- [ENSRegistry.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L131-L133) (function)
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L40


 - [ ] ID-42
[ENSRegistry.setSubnodeOwner(bytes32,bytes32,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L74) shadows:
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L74


 - [ ] ID-43
[PublicResolver.setAuthorisation(bytes32,address,bool).isAuthorised](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L46) shadows:
	- [PublicResolver.isAuthorised(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L51-L54) (function)
	- [ResolverBase.isAuthorised(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L9) (function)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L46


 - [ ] ID-44
[Resolver.setAddr(bytes32,address).addr](lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L28) shadows:
	- [Resolver.addr(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L19) (function)
	- [Resolver.addr(bytes32,uint256)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L20) (function)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L28


 - [ ] ID-45
[BaseRegistrarImplementation.register(uint256,address,uint256).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L99) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L99


 - [ ] ID-46
[ENSRegistry.setSubnodeRecord(bytes32,bytes32,address,address,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L53) shadows:
	- [ENSRegistry.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L140-L142) (function)
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L53


 - [ ] ID-47
[ETHRegistrarController.registerWithConfig(string,address,uint256,bytes32,address,address).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L88) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L88


 - [ ] ID-48
[BaseRegistrarImplementation._register(uint256,address,uint256,bool).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113


 - [ ] ID-49
[ENS.setSubnodeRecord(bytes32,bytes32,address,address,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L21) shadows:
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L21


 - [ ] ID-50
[EnsSetup.namehash(bytes32,bytes32).labelhash](lib/forge-ens/src/EnsSetup.sol#L39) shadows:
	- [EnsSetup.labelhash(string)](lib/forge-ens/src/EnsSetup.sol#L35-L37) (function)

lib/forge-ens/src/EnsSetup.sol#L39


 - [ ] ID-51
[ENSRegistryWithFallback._setOwner(bytes32,address).owner](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistryWithFallback.sol#L59) shadows:
	- [ENSRegistryWithFallback.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistryWithFallback.sol#L38-L44) (function)
	- [ENSRegistry.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L117-L124) (function)
	- [ENS.owner(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L27) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistryWithFallback.sol#L59


 - [ ] ID-52
[BaseRegistrarImplementation._isApprovedOrOwner(address,uint256).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L35) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L35


 - [ ] ID-53
[ENSRegistry._setResolverAndTTL(bytes32,address,uint64).ttl](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L167) shadows:
	- [ENSRegistry.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L140-L142) (function)
	- [ENS.ttl(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L29) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L167


 - [ ] ID-54
[ENSRegistry.setSubnodeRecord(bytes32,bytes32,address,address,uint64).resolver](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L53) shadows:
	- [ENSRegistry.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L131-L133) (function)
	- [ENS.resolver(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L28) (function)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L53


 - [ ] ID-55
[ETHRegistrarController.makeCommitment(string,address,bytes32).owner](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L66) shadows:
	- [Ownable.owner()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L35-L37) (function)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L66


## events-maths
Impact: Low
Confidence: Medium
 - [ ] ID-56
[ETHRegistrarController.setCommitmentAges(uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147-L150) should emit an event for: 
	- [minCommitmentAge = _minCommitmentAge](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L148) 
	- [maxCommitmentAge = _maxCommitmentAge](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L149) 

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147-L150


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-57
[Registrar.constructor(ENS,address)._resolver](src/Registrar.sol#L65) lacks a zero-check on :
		- [me3Resolver = _resolver](src/Registrar.sol#L67)

src/Registrar.sol#L65


 - [ ] ID-58
[Test.deal(address,address,uint256,bool).token](lib/forge-std/src/Test.sol#L104) lacks a zero-check on :
		- [(balData) = token.call(abi.encodeWithSelector(0x70a08231,to))](lib/forge-std/src/Test.sol#L106)
		- [(totSupData) = token.call(abi.encodeWithSelector(0x18160ddd))](lib/forge-std/src/Test.sol#L118)

lib/forge-std/src/Test.sol#L104


 - [ ] ID-59
[Test.deal(address,address,uint256,bool).to](lib/forge-std/src/Test.sol#L104) lacks a zero-check on :
		- [(balData) = token.call(abi.encodeWithSelector(0x70a08231,to))](lib/forge-std/src/Test.sol#L106)

lib/forge-std/src/Test.sol#L104


 - [ ] ID-60
[Owned.setOwner(address).newOwner](lib/solmate/src/auth/Owned.sol#L39) lacks a zero-check on :
		- [owner = newOwner](lib/solmate/src/auth/Owned.sol#L40)

lib/solmate/src/auth/Owned.sol#L39


## calls-loop
Impact: Low
Confidence: Medium
 - [ ] ID-61
[PublicResolver.multicall(bytes[])](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L56-L64) has external calls inside a loop: [(success,result) = address(this).delegatecall(data[i])](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L59)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L56-L64


## variable-scope
Impact: Low
Confidence: High
 - [ ] ID-62
Variable '[ERC721._checkOnERC721Received(address,address,uint256,bytes).reason](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L396)' in [ERC721._checkOnERC721Received(address,address,uint256,bytes)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409) potentially used before declaration: [revert(uint256,uint256)(32 + reason,mload(uint256)(reason))](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L402)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L396


 - [ ] ID-63
Variable '[ERC721._checkOnERC721Received(address,address,uint256,bytes).reason](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L396)' in [ERC721._checkOnERC721Received(address,address,uint256,bytes)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409) potentially used before declaration: [reason.length == 0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L397)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L396


 - [ ] ID-64
Variable '[ERC721._checkOnERC721Received(address,address,uint256,bytes).retval](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L394)' in [ERC721._checkOnERC721Received(address,address,uint256,bytes)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409) potentially used before declaration: [retval == IERC721Receiver.onERC721Received.selector](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L395)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L394


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-65
Reentrancy in [RegistrarTest.testAddRootNode()](src/test/Registrar.t.sol#L45-L53):
	External calls:
	- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L49)
	- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertEq(address(registrar.nodeRules(demoNode)),address(rules))](src/test/Registrar.t.sol#L52)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertEq(address(registrar.nodeRules(demoNode)),address(rules))](src/test/Registrar.t.sol#L52)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L45-L53


 - [ ] ID-66
Reentrancy in [RegistrarTest.setUp()](src/test/Registrar.t.sol#L38-L43):
	External calls:
	- [super.setUp()](src/test/Registrar.t.sol#L39)
		- [_baseRegistrar.addController(CONTROLLER_ADDR)](lib/forge-ens/src/EnsSetup.sol#L52)
		- [_ens.setOwner(0x0,address(_baseRegistrar))](lib/forge-ens/src/EnsSetup.sol#L53)
		- [vm.store(address(_ens),bytes32(ethOwnerSlot),bytes32(uint256(uint160(address(_baseRegistrar)))))](lib/forge-ens/src/EnsSetup.sol#L57)
		- [vm.warp(_baseRegistrar.GRACE_PERIOD() + 86400)](lib/forge-ens/src/EnsSetup.sol#L60)
		- [vm.prank(CONTROLLER_ADDR)](lib/forge-ens/src/EnsSetup.sol#L64)
		- [_baseRegistrar.register(uint256(hashedLabel),address(this),86400)](lib/forge-ens/src/EnsSetup.sol#L65)
		- [_baseRegistrar.addController(address(_defaultRegistrarController))](lib/forge-ens/src/EnsSetup.sol#L70)
	State variables written after the call(s):
	- [registrar = new Registrar(_ens,address(0x0))](src/test/Registrar.t.sol#L41)

src/test/Registrar.t.sol#L38-L43


 - [ ] ID-67
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L83)
	- [registrar.setRootNodeState(demoNode,false)](src/test/Registrar.t.sol#L86)
	- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-68
Reentrancy in [NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63):
	External calls:
	- [assertTrue(authoriser.isLabelValid(hey) == false)](src/test/NftAuthoriser.t.sol#L52-L54)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/NftAuthoriser.t.sol#L51-L63


 - [ ] ID-69
Reentrancy in [EnsSetup.setUp()](lib/forge-ens/src/EnsSetup.sol#L43-L71):
	External calls:
	- [_baseRegistrar.addController(CONTROLLER_ADDR)](lib/forge-ens/src/EnsSetup.sol#L52)
	- [_ens.setOwner(0x0,address(_baseRegistrar))](lib/forge-ens/src/EnsSetup.sol#L53)
	- [vm.store(address(_ens),bytes32(ethOwnerSlot),bytes32(uint256(uint160(address(_baseRegistrar)))))](lib/forge-ens/src/EnsSetup.sol#L57)
	- [vm.warp(_baseRegistrar.GRACE_PERIOD() + 86400)](lib/forge-ens/src/EnsSetup.sol#L60)
	- [vm.prank(CONTROLLER_ADDR)](lib/forge-ens/src/EnsSetup.sol#L64)
	- [_baseRegistrar.register(uint256(hashedLabel),address(this),86400)](lib/forge-ens/src/EnsSetup.sol#L65)
	State variables written after the call(s):
	- [_defaultRegistrarController = new ETHRegistrarController(_baseRegistrar,_priceOracle,60,86400)](lib/forge-ens/src/EnsSetup.sol#L69)
	- [demoNode = namehash(ethNode,hashedLabel)](lib/forge-ens/src/EnsSetup.sol#L66)

lib/forge-ens/src/EnsSetup.sol#L43-L71


 - [ ] ID-70
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L83)
	- [registrar.setRootNodeState(demoNode,false)](src/test/Registrar.t.sol#L86)
	- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L89)
	- [registrar.setRootNodeState(demoNode,true)](src/test/Registrar.t.sol#L92)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L93)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L93)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-71
Reentrancy in [DSTest.fail()](lib/ds-test/src/test.sol#L65-L76):
	External calls:
	- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [_failed = true](lib/ds-test/src/test.sol#L75)

lib/ds-test/src/test.sol#L65-L76


 - [ ] ID-72
Reentrancy in [RegistrarTest.testAddRootNode()](src/test/Registrar.t.sol#L45-L53):
	External calls:
	- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L49)
	- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L45-L53


 - [ ] ID-73
Reentrancy in [RegistrarTest.testRegisterSubdomain()](src/test/Registrar.t.sol#L63-L77):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L64)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L65)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L67)
	- [registrar.register(demoNode,banana,address(this),blob)](src/test/Registrar.t.sol#L74)
	- [assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33),address(this))](src/test/Registrar.t.sol#L76)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33),address(this))](src/test/Registrar.t.sol#L76)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L63-L77


 - [ ] ID-74
Reentrancy in [RegistrarTest.testValidLabel()](src/test/Registrar.t.sol#L100-L103):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L101)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.valid(demoNode,orange))](src/test/Registrar.t.sol#L102)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(registrar.valid(demoNode,orange))](src/test/Registrar.t.sol#L102)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L100-L103


 - [ ] ID-75
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-76
Reentrancy in [RegistrarTest.testValidLabelForNode()](src/test/Registrar.t.sol#L55-L61):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L56)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(validLabel)](src/test/Registrar.t.sol#L60)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(validLabel)](src/test/Registrar.t.sol#L60)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/Registrar.t.sol#L55-L61


 - [ ] ID-77
Reentrancy in [NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63):
	External calls:
	- [assertTrue(authoriser.isLabelValid(hey) == false)](src/test/NftAuthoriser.t.sol#L52-L54)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertTrue(authoriser.isLabelValid(helo))](src/test/NftAuthoriser.t.sol#L60-L62)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	State variables written after the call(s):
	- [assertTrue(authoriser.isLabelValid(helo))](src/test/NftAuthoriser.t.sol#L60-L62)
		- [_failed = true](lib/ds-test/src/test.sol#L75)

src/test/NftAuthoriser.t.sol#L51-L63


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-78
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L83)
	- [registrar.setRootNodeState(demoNode,false)](src/test/Registrar.t.sol#L86)
	- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L89)
	Event emitted after the call(s):
	- [ProjectStateChanged(demoNode,true)](src/test/Registrar.t.sol#L90)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-79
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L83)
	Event emitted after the call(s):
	- [ProjectStateChanged(demoNode,false)](src/test/Registrar.t.sol#L84)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-80
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-81
Reentrancy in [RegistrarTest.testValidLabelForNode()](src/test/Registrar.t.sol#L55-L61):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L56)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(validLabel)](src/test/Registrar.t.sol#L60)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(validLabel)](src/test/Registrar.t.sol#L60)

src/test/Registrar.t.sol#L55-L61


 - [ ] ID-82
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L83)
	- [registrar.setRootNodeState(demoNode,false)](src/test/Registrar.t.sol#L86)
	- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-83
Reentrancy in [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L80)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L81)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L83)
	- [registrar.setRootNodeState(demoNode,false)](src/test/Registrar.t.sol#L86)
	- [assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L89)
	- [registrar.setRootNodeState(demoNode,true)](src/test/Registrar.t.sol#L92)
	- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L93)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(registrar.nodeEnabled(demoNode))](src/test/Registrar.t.sol#L93)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-84
Reentrancy in [RegistrarTest.testRegisterSubdomain()](src/test/Registrar.t.sol#L63-L77):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L64)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L65)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L67)
	Event emitted after the call(s):
	- [SubnodeRegistered(demoNode,labelhash(banana),address(this))](src/test/Registrar.t.sol#L68)

src/test/Registrar.t.sol#L63-L77


 - [ ] ID-85
Reentrancy in [RegistrarTest.testRegisterSubdomain()](src/test/Registrar.t.sol#L63-L77):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L64)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L65)
	Event emitted after the call(s):
	- [NewOwner(demoNode,labelhash(banana),address(this))](src/test/Registrar.t.sol#L66)

src/test/Registrar.t.sol#L63-L77


 - [ ] ID-86
Reentrancy in [ETHRegistrarController.registerWithConfig(string,address,uint256,bytes32,address,address)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L88-L126):
	External calls:
	- [expires = base.register(tokenId,address(this),duration)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L99)
	- [base.ens().setResolver(nodehash,resolver)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L105)
	- [Resolver(resolver).setAddr(nodehash,addr)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L109)
	- [base.reclaim(tokenId,owner)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L113)
	- [base.transferFrom(address(this),owner,tokenId)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L114)
	- [expires = base.register(tokenId,owner,duration)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L117)
	Event emitted after the call(s):
	- [NameRegistered(name,label,owner,cost,expires)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L120)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L88-L126


 - [ ] ID-87
Reentrancy in [RegistrarTest.testRegisterSubdomain()](src/test/Registrar.t.sol#L63-L77):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L64)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L65)
	- [vm.expectEmit(true,true,true,true)](src/test/Registrar.t.sol#L67)
	- [registrar.register(demoNode,banana,address(this),blob)](src/test/Registrar.t.sol#L74)
	- [assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33),address(this))](src/test/Registrar.t.sol#L76)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: a == b not satisfied [address])](lib/ds-test/src/test.sol#L109)
		- [assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33),address(this))](src/test/Registrar.t.sol#L76)
	- [log_named_address(  Expected,b)](lib/ds-test/src/test.sol#L110)
		- [assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33),address(this))](src/test/Registrar.t.sol#L76)
	- [log_named_address(    Actual,a)](lib/ds-test/src/test.sol#L111)
		- [assertEq(_ens.owner(0x75d7e6a57d4e6c17065398c8221d84ff969c52008bbb1e65e8650f2a39f2ef33),address(this))](src/test/Registrar.t.sol#L76)

src/test/Registrar.t.sol#L63-L77


 - [ ] ID-88
Reentrancy in [stdStorage.find(StdStorage)](lib/forge-std/src/Test.sol#L430-L502):
	External calls:
	- [vm_std_store.record()](lib/forge-std/src/Test.sol#L446)
	- [(reads) = vm_std_store.accesses(address(who))](lib/forge-std/src/Test.sol#L453)
	- [prev = vm_std_store.load(who,reads[i])](lib/forge-std/src/Test.sol#L467)
	- [vm_std_store.store(who,reads[i],bytes32(7))](lib/forge-std/src/Test.sol#L472)
	Event emitted after the call(s):
	- [SlotFound(who,fsig,keccak256(bytes)(abi.encodePacked(ins,field_depth)),uint256(reads[i]))](lib/forge-std/src/Test.sol#L482)

lib/forge-std/src/Test.sol#L430-L502


 - [ ] ID-89
Reentrancy in [BaseRegistrarImplementation._register(uint256,address,uint256,bool)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113-L130):
	External calls:
	- [ens.setSubnodeOwner(baseNode,bytes32(id),owner)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L124)
	Event emitted after the call(s):
	- [NameRegistered(id,owner,block.timestamp + duration)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L127)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113-L130


 - [ ] ID-90
Reentrancy in [ETHRegistrarController.renew(string,uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L128-L140):
	External calls:
	- [expires = base.renew(uint256(label),duration)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L133)
	External calls sending eth:
	- [address(msg.sender).transfer(msg.value - cost)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L136)
	Event emitted after the call(s):
	- [NameRenewed(name,label,cost,expires)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L139)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L128-L140


 - [ ] ID-91
Reentrancy in [stdStorage.find(StdStorage)](lib/forge-std/src/Test.sol#L430-L502):
	External calls:
	- [vm_std_store.record()](lib/forge-std/src/Test.sol#L446)
	- [(reads) = vm_std_store.accesses(address(who))](lib/forge-std/src/Test.sol#L453)
	- [prev = vm_std_store.load(who,reads[i])](lib/forge-std/src/Test.sol#L467)
	Event emitted after the call(s):
	- [WARNING_UninitedSlot(who,uint256(reads[i]))](lib/forge-std/src/Test.sol#L469)

lib/forge-std/src/Test.sol#L430-L502


 - [ ] ID-92
Reentrancy in [NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63):
	External calls:
	- [assertTrue(authoriser.isLabelValid(hey) == false)](src/test/NftAuthoriser.t.sol#L52-L54)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)

src/test/NftAuthoriser.t.sol#L51-L63


 - [ ] ID-93
Reentrancy in [stdStorage.find(StdStorage)](lib/forge-std/src/Test.sol#L430-L502):
	External calls:
	- [vm_std_store.record()](lib/forge-std/src/Test.sol#L446)
	- [(reads) = vm_std_store.accesses(address(who))](lib/forge-std/src/Test.sol#L453)
	- [curr = vm_std_store.load(who,reads[0])](lib/forge-std/src/Test.sol#L455)
	Event emitted after the call(s):
	- [SlotFound(who,fsig,keccak256(bytes)(abi.encodePacked(ins,field_depth)),uint256(reads[0]))](lib/forge-std/src/Test.sol#L462)
	- [WARNING_UninitedSlot(who,uint256(reads[0]))](lib/forge-std/src/Test.sol#L457)

lib/forge-std/src/Test.sol#L430-L502


 - [ ] ID-94
Reentrancy in [RegistrarTest.testAddRootNode()](src/test/Registrar.t.sol#L45-L53):
	External calls:
	- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L49)
	- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: a == b not satisfied [address])](lib/ds-test/src/test.sol#L109)
		- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
	- [log_named_address(  Expected,b)](lib/ds-test/src/test.sol#L110)
		- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
	- [log_named_address(    Actual,a)](lib/ds-test/src/test.sol#L111)
		- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)

src/test/Registrar.t.sol#L45-L53


 - [ ] ID-95
Reentrancy in [RegistrarTest.testValidLabel()](src/test/Registrar.t.sol#L100-L103):
	External calls:
	- [_setUpNode()](src/test/Registrar.t.sol#L101)
		- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L112)
	- [assertTrue(registrar.valid(demoNode,orange))](src/test/Registrar.t.sol#L102)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(registrar.valid(demoNode,orange))](src/test/Registrar.t.sol#L102)

src/test/Registrar.t.sol#L100-L103


 - [ ] ID-96
Reentrancy in [RegistrarTest.testAddRootNode()](src/test/Registrar.t.sol#L45-L53):
	External calls:
	- [registrar.addRootNode(demoNode,authoriser,rules)](src/test/Registrar.t.sol#L49)
	- [assertEq(address(registrar.nodeAuthorisers(demoNode)),address(authoriser))](src/test/Registrar.t.sol#L51)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertEq(address(registrar.nodeRules(demoNode)),address(rules))](src/test/Registrar.t.sol#L52)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: a == b not satisfied [address])](lib/ds-test/src/test.sol#L109)
		- [assertEq(address(registrar.nodeRules(demoNode)),address(rules))](src/test/Registrar.t.sol#L52)
	- [log_named_address(  Expected,b)](lib/ds-test/src/test.sol#L110)
		- [assertEq(address(registrar.nodeRules(demoNode)),address(rules))](src/test/Registrar.t.sol#L52)
	- [log_named_address(    Actual,a)](lib/ds-test/src/test.sol#L111)
		- [assertEq(address(registrar.nodeRules(demoNode)),address(rules))](src/test/Registrar.t.sol#L52)

src/test/Registrar.t.sol#L45-L53


 - [ ] ID-97
Reentrancy in [NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63):
	External calls:
	- [assertTrue(authoriser.isLabelValid(hey) == false)](src/test/NftAuthoriser.t.sol#L52-L54)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	- [assertTrue(authoriser.isLabelValid(helo))](src/test/NftAuthoriser.t.sol#L60-L62)
		- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)
	Event emitted after the call(s):
	- [log(Error: Assertion Failed)](lib/ds-test/src/test.sol#L95)
		- [assertTrue(authoriser.isLabelValid(helo))](src/test/NftAuthoriser.t.sol#L60-L62)

src/test/NftAuthoriser.t.sol#L51-L63


 - [ ] ID-98
Reentrancy in [Registrar.register(bytes32,string,address,bytes[])](src/Registrar.sol#L108-L119):
	External calls:
	- [ens.setSubnodeRecord(node,hashedLabel,owner,me3Resolver,86400)](src/Registrar.sol#L117)
	Event emitted after the call(s):
	- [SubnodeRegistered(node,hashedLabel,owner)](src/Registrar.sol#L118)

src/Registrar.sol#L108-L119


## timestamp
Impact: Low
Confidence: Medium
 - [ ] ID-99
[BaseRegistrarImplementation._register(uint256,address,uint256,bool)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113-L130) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool)(block.timestamp + duration + GRACE_PERIOD > block.timestamp + GRACE_PERIOD)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L115)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L113-L130


 - [ ] ID-100
[ETHRegistrarController._consumeCommitment(string,uint256,bytes32)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L162-L177) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool)(commitments[commitment] + minCommitmentAge <= block.timestamp)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L164)
	- [require(bool)(commitments[commitment] + maxCommitmentAge > block.timestamp)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L167)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L162-L177


 - [ ] ID-101
[BaseRegistrarImplementation.available(uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L88-L91) uses timestamp for comparisons
	Dangerous comparisons:
	- [expiries[id] + GRACE_PERIOD < block.timestamp](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L90)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L88-L91


 - [ ] ID-102
[BaseRegistrarImplementation.renew(uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L132-L139) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool)(expiries[id] + GRACE_PERIOD >= block.timestamp)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L133)
	- [require(bool)(expiries[id] + duration + GRACE_PERIOD > duration + GRACE_PERIOD)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L134)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L132-L139


 - [ ] ID-103
[ETHRegistrarController.commit(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L79-L82) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool)(commitments[commitment] + maxCommitmentAge < block.timestamp)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L80)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L79-L82


 - [ ] ID-104
[BaseRegistrarImplementation.ownerOf(uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L60-L63) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool)(expiries[tokenId] > block.timestamp)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L61)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L60-L63


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-105
[Test.deployCode(string)](lib/forge-std/src/Test.sol#L174-L188) uses assembly
	- [INLINE ASM](lib/forge-std/src/Test.sol#L180-L182)

lib/forge-std/src/Test.sol#L174-L188


 - [ ] ID-106
[BytesUtils.compare(bytes,uint256,uint256,bytes,uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L44-L80) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L52-L55)
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L59-L62)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L44-L80


 - [ ] ID-107
[BlobParser.bytesToUint256(bytes,uint256)](src/lib/BlobParser.sol#L4-L15) uses assembly
	- [INLINE ASM](src/lib/BlobParser.sol#L12)

src/lib/BlobParser.sol#L4-L15


 - [ ] ID-108
[Buffer.appendInt(Buffer.buffer,uint256,uint256)](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L239-L259) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L247-L257)

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L239-L259


 - [ ] ID-109
[BytesUtils.readBytes32(bytes,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L171-L176) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L173-L175)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L171-L176


 - [ ] ID-110
[Buffer.append(Buffer.buffer,bytes32,uint256)](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L183-L207) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L194-L204)

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L183-L207


 - [ ] ID-111
[Test.deployCode(string,bytes)](lib/forge-std/src/Test.sol#L158-L172) uses assembly
	- [INLINE ASM](lib/forge-std/src/Test.sol#L164-L166)

lib/forge-std/src/Test.sol#L158-L172


 - [ ] ID-112
[BytesUtils.readUint32(bytes,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L158-L163) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L160-L162)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L158-L163


 - [ ] ID-113
[BytesUtils.readUint16(bytes,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L145-L150) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L147-L149)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L145-L150


 - [ ] ID-114
[console2._sendLogPayload(bytes)](lib/forge-std/src/console2.sol#L13-L20) uses assembly
	- [INLINE ASM](lib/forge-std/src/console2.sol#L16-L19)

lib/forge-std/src/console2.sol#L13-L20


 - [ ] ID-115
[BytesUtils.memcpy(uint256,uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L207-L224) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L210-L212)
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L219-L223)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L207-L224


 - [ ] ID-116
[BytesUtils.substring(bytes,uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L232-L246) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L239-L242)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L232-L246


 - [ ] ID-117
[BytesUtils.readBytesN(bytes,uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L198-L205) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L201-L204)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L198-L205


 - [ ] ID-118
[DSTest.hasHEVMContext()](lib/ds-test/src/test.sol#L78-L84) uses assembly
	- [INLINE ASM](lib/ds-test/src/test.sol#L80-L82)

lib/ds-test/src/test.sol#L78-L84


 - [ ] ID-119
[ResolverBase.addressToBytes(address)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L23-L28) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L25-L27)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L23-L28


 - [ ] ID-120
[BytesUtils.keccak(bytes,uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L11-L16) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L13-L15)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L11-L16


 - [ ] ID-121
[stdStorage.checked_write(StdStorage,bool)](lib/forge-std/src/Test.sol#L546-L553) uses assembly
	- [INLINE ASM](lib/forge-std/src/Test.sol#L549-L551)

lib/forge-std/src/Test.sol#L546-L553


 - [ ] ID-122
[ERC721._checkOnERC721Received(address,address,uint256,bytes)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L401-L403)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L387-L409


 - [ ] ID-123
[console._sendLogPayload(bytes)](lib/forge-std/src/console.sol#L7-L15) uses assembly
	- [INLINE ASM](lib/forge-std/src/console.sol#L11-L14)

lib/forge-std/src/console.sol#L7-L15


 - [ ] ID-124
[Buffer.truncate(Buffer.buffer)](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L72-L78) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L73-L76)

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L72-L78


 - [ ] ID-125
[Buffer.init(Buffer.buffer,uint256)](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L29-L46) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L35-L44)

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L29-L46


 - [ ] ID-126
[Address.verifyCallResult(bool,bytes,string)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L201-L221) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L213-L216)

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L201-L221


 - [ ] ID-127
[Buffer.append(Buffer.buffer,bytes,uint256)](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L88-L133) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L99-L111)
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L115-L117)
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L125-L129)

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L88-L133


 - [ ] ID-128
[BytesUtils.readBytes20(bytes,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L184-L189) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L186-L188)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L184-L189


 - [ ] ID-129
[ResolverBase.bytesToAddress(bytes)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L16-L21) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L18-L20)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L16-L21


 - [ ] ID-130
[Buffer.appendUint8(Buffer.buffer,uint8)](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L153-L173) uses assembly
	- [INLINE ASM](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L160-L170)

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L153-L173


 - [ ] ID-131
[stdStorage.flatten(bytes32[])](lib/forge-std/src/Test.sol#L624-L636) uses assembly
	- [INLINE ASM](lib/forge-std/src/Test.sol#L630-L632)

lib/forge-std/src/Test.sol#L624-L636


## boolean-equal
Impact: Informational
Confidence: High
 - [ ] ID-132
[RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94) compares to a boolean constant:
	-[assertTrue(registrar.nodeEnabled(demoNode) == false)](src/test/Registrar.t.sol#L87)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-133
[NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63) compares to a boolean constant:
	-[assertTrue(authoriser.isLabelValid(hi) == false)](src/test/NftAuthoriser.t.sol#L56-L58)

src/test/NftAuthoriser.t.sol#L51-L63


 - [ ] ID-134
[NftAuthoriserTest.testCannotRegister()](src/test/NftAuthoriser.t.sol#L37-L43) compares to a boolean constant:
	-[assertTrue(authoriser.canRegister(0x0,address(this),blob) == false)](src/test/NftAuthoriser.t.sol#L40-L42)

src/test/NftAuthoriser.t.sol#L37-L43


 - [ ] ID-135
[NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63) compares to a boolean constant:
	-[assertTrue(authoriser.isLabelValid(hey) == false)](src/test/NftAuthoriser.t.sol#L52-L54)

src/test/NftAuthoriser.t.sol#L51-L63


## pragma
Impact: Informational
Confidence: High
 - [ ] ID-136
Different versions of Solidity are used:
	- Version used: ['0.8.10', '>=0.4.22<0.9.0', '>=0.5.0', '>=0.6.0', '>=0.6.0<0.9.0', '>=0.8.0', '>=0.8.4', '^0.8.0', '^0.8.1', '^0.8.4']
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/StringUtils.sol#L1)
	- [0.8.10](src/lib/BlobParser.sol#L1)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol#L4)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/PubkeyResolver.sol#L1)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Context.sol#L4)
	- [^0.8.4](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L2)
	- [^0.8.4](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrar.sol#L1)
	- [0.8.10](src/IAuthoriser.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistryWithFallback.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/registry/ENS.sol#L1)
	- [0.8.10](src/test/NftAuthoriser.t.sol#L1)
	- [^0.8.4](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/RRUtils.sol#L1)
	- [>=0.4.22<0.9.0](lib/forge-std/src/console2.sol#L2)
	- [^0.8.1](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L4)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol#L4)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ContentHashResolver.sol#L1)
	- [>=0.4.22<0.9.0](lib/forge-std/src/console.sol#L2)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/TextResolver.sol#L1)
	- [0.8.10](src/Registrar.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L1)
	- [>=0.6.0<0.9.0](lib/forge-std/src/Test.sol#L2)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L1)
	- [0.8.10](src/test/Registrar.t.sol#L1)
	- [^0.8.4](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L1)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol#L4)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L4)
	- [0.8.10](src/NftAuthoriser.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ABIResolver.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L1)
	- [ABIEncoderV2](lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L2)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Strings.sol#L4)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L1)
	- [0.8.10](lib/forge-ens/src/EnsSetup.sol#L2)
	- [>=0.8.0](lib/solmate/src/auth/Owned.sol#L2)
	- [>=0.5.0](lib/ds-test/src/test.sol#L16)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/PriceOracle.sol#L1)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L4)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/NameResolver.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L1)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/ResolverBase.sol#L1)
	- [>=0.6.0](lib/forge-std/src/Vm.sol#L2)
	- [ABIEncoderV2](lib/forge-std/src/Vm.sol#L3)
	- [>=0.8.4](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L1)
	- [0.8.10](src/Utils.sol#L1)
	- [^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/ERC165.sol#L4)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/StringUtils.sol#L1


## dead-code
Impact: Informational
Confidence: Medium
 - [ ] ID-137
[Utilities.namehash(bytes32,bytes32)](src/Utils.sol#L8-L14) is never used and should be removed

src/Utils.sol#L8-L14


 - [ ] ID-138
[Registrar.available(bytes32,string)](src/Registrar.sol#L134-L140) is never used and should be removed

src/Registrar.sol#L134-L140


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-139
Pragma version[0.8.10](src/NftAuthoriser.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/NftAuthoriser.sol#L1


 - [ ] ID-140
Pragma version[>=0.8.0](lib/solmate/src/auth/Owned.sol#L2) allows old versions

lib/solmate/src/auth/Owned.sol#L2


 - [ ] ID-141
Pragma version[0.8.10](src/test/NftAuthoriser.t.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/test/NftAuthoriser.t.sol#L1


 - [ ] ID-142
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/ERC165.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/ERC165.sol#L4


 - [ ] ID-143
Pragma version[0.8.10](src/lib/BlobParser.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/lib/BlobParser.sol#L1


 - [ ] ID-144
Pragma version[0.8.10](lib/forge-ens/src/EnsSetup.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

lib/forge-ens/src/EnsSetup.sol#L2


 - [ ] ID-145
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol#L4


 - [ ] ID-146
solc-0.8.10 is not recommended for deployment

 - [ ] ID-147
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Strings.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Strings.sol#L4


 - [ ] ID-148
Pragma version[>=0.6.0](lib/forge-std/src/Vm.sol#L2) allows old versions

lib/forge-std/src/Vm.sol#L2


 - [ ] ID-149
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L4


 - [ ] ID-150
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L4


 - [ ] ID-151
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Context.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Context.sol#L4


 - [ ] ID-152
Pragma version[^0.8.1](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L4


 - [ ] ID-153
Pragma version[0.8.10](src/Registrar.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Registrar.sol#L1


 - [ ] ID-154
Pragma version[>=0.5.0](lib/ds-test/src/test.sol#L16) allows old versions

lib/ds-test/src/test.sol#L16


 - [ ] ID-155
Pragma version[>=0.4.22<0.9.0](lib/forge-std/src/console.sol#L2) is too complex

lib/forge-std/src/console.sol#L2


 - [ ] ID-156
Pragma version[>=0.4.22<0.9.0](lib/forge-std/src/console2.sol#L2) is too complex

lib/forge-std/src/console2.sol#L2


 - [ ] ID-157
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol#L4


 - [ ] ID-158
Pragma version[>=0.6.0<0.9.0](lib/forge-std/src/Test.sol#L2) is too complex

lib/forge-std/src/Test.sol#L2


 - [ ] ID-159
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4


 - [ ] ID-160
Pragma version[^0.8.0](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol#L4) allows old versions

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol#L4


 - [ ] ID-161
Pragma version[0.8.10](src/IAuthoriser.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/IAuthoriser.sol#L1


 - [ ] ID-162
Pragma version[0.8.10](src/test/Registrar.t.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/test/Registrar.t.sol#L1


 - [ ] ID-163
Pragma version[0.8.10](src/Utils.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Utils.sol#L1


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-164
Low level call in [Address.functionCallWithValue(address,bytes,uint256,string)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L128-L139):
	- [(success,returndata) = target.call{value: value}(data)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L137)

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L128-L139


 - [ ] ID-165
Low level call in [stdStorage.find(StdStorage)](lib/forge-std/src/Test.sol#L430-L502):
	- [(rdat) = who.staticcall(cald)](lib/forge-std/src/Test.sol#L449)
	- [(success,rdat_scope_0) = who.staticcall(cald)](lib/forge-std/src/Test.sol#L476)

lib/forge-std/src/Test.sol#L430-L502


 - [ ] ID-166
Low level call in [Test.deal(address,address,uint256,bool)](lib/forge-std/src/Test.sol#L104-L130):
	- [(balData) = token.call(abi.encodeWithSelector(0x70a08231,to))](lib/forge-std/src/Test.sol#L106)
	- [(totSupData) = token.call(abi.encodeWithSelector(0x18160ddd))](lib/forge-std/src/Test.sol#L118)

lib/forge-std/src/Test.sol#L104-L130


 - [ ] ID-167
Low level call in [PublicResolver.multicall(bytes[])](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L56-L64):
	- [(success,result) = address(this).delegatecall(data[i])](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L59)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L56-L64


 - [ ] ID-168
Low level call in [DSTest.fail()](lib/ds-test/src/test.sol#L65-L76):
	- [(status) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(store(address,bytes32,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed),bytes32(uint256(0x01)))))](lib/ds-test/src/test.sol#L67-L72)

lib/ds-test/src/test.sol#L65-L76


 - [ ] ID-169
Low level call in [InterfaceResolver.interfaceImplementer(bytes32,bytes4)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L35-L59):
	- [(success,returnData) = a.staticcall(abi.encodeWithSignature(supportsInterface(bytes4),INTERFACE_META_ID))](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L46)
	- [(success,returnData) = a.staticcall(abi.encodeWithSignature(supportsInterface(bytes4),interfaceID))](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L52)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L35-L59


 - [ ] ID-170
Low level call in [Address.functionStaticCall(address,bytes,string)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L157-L166):
	- [(success,returndata) = target.staticcall(data)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L164)

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L157-L166


 - [ ] ID-171
Low level call in [stdStorage.checked_write(StdStorage,bytes32)](lib/forge-std/src/Test.sol#L555-L585):
	- [(rdat) = who.staticcall(cald)](lib/forge-std/src/Test.sol#L572)

lib/forge-std/src/Test.sol#L555-L585


 - [ ] ID-172
Low level call in [DSTest.failed()](lib/ds-test/src/test.sol#L47-L63):
	- [(retdata) = HEVM_ADDRESS.call(abi.encodePacked(bytes4(keccak256(bytes)(load(address,bytes32))),abi.encode(HEVM_ADDRESS,bytes32(failed))))](lib/ds-test/src/test.sol#L53-L58)

lib/ds-test/src/test.sol#L47-L63


 - [ ] ID-173
Low level call in [Address.functionDelegateCall(address,bytes,string)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L184-L193):
	- [(success,returndata) = target.delegatecall(data)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L191)

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L184-L193


 - [ ] ID-174
Low level call in [Address.sendValue(address,uint256)](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L60-L65):
	- [(success) = recipient.call{value: amount}()](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L63)

lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/Address.sol#L60-L65


## missing-inheritance
Impact: Informational
Confidence: High
 - [ ] ID-175
[ETHRegistrarController](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L12-L178) should inherit from [IERC165](lib/forge-ens/lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol#L15-L25)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L12-L178


 - [ ] ID-176
[ERC721](src/test/NftAuthoriser.t.sol#L6-L18) should inherit from [IERC721](src/NftAuthoriser.sol#L7-L9)

src/test/NftAuthoriser.t.sol#L6-L18


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-177
Parameter [stdStorage.sig(StdStorage,string)._sig](lib/forge-std/src/Test.sol#L514) is not in mixedCase

lib/forge-std/src/Test.sol#L514


 - [ ] ID-178
Event [DSTestlog_named_int(string,int256)](lib/ds-test/src/test.sol#L33) is not in CapWords

lib/ds-test/src/test.sol#L33


 - [ ] ID-179
Variable [EnsSetup._ens](lib/forge-ens/src/EnsSetup.sol#L24) is not in mixedCase

lib/forge-ens/src/EnsSetup.sol#L24


 - [ ] ID-180
Parameter [stdStorage.target(StdStorage,address)._target](lib/forge-std/src/Test.sol#L504) is not in mixedCase

lib/forge-std/src/Test.sol#L504


 - [ ] ID-181
Variable [AddrResolver._addresses](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L12) is not in mixedCase

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L12


 - [ ] ID-182
Variable [EnsSetup._priceOracle](lib/forge-ens/src/EnsSetup.sol#L23) is not in mixedCase

lib/forge-ens/src/EnsSetup.sol#L23


 - [ ] ID-183
Function [stdStorage.checked_write(StdStorage,bytes32)](lib/forge-std/src/Test.sol#L555-L585) is not in mixedCase

lib/forge-std/src/Test.sol#L555-L585


 - [ ] ID-184
Parameter [Registrar.addRootNode(bytes32,IAuthoriser,IRulesEngine)._authoriser](src/Registrar.sol#L76) is not in mixedCase

src/Registrar.sol#L76


 - [ ] ID-185
Parameter [stdStorage.sig(StdStorage,bytes4)._sig](lib/forge-std/src/Test.sol#L509) is not in mixedCase

lib/forge-std/src/Test.sol#L509


 - [ ] ID-186
Constant [stdError.enumConversionError](lib/forge-std/src/Test.sol#L380) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L380


 - [ ] ID-187
Contract [console2](lib/forge-std/src/console2.sol#L10-L1539) is not in CapWords

lib/forge-std/src/console2.sol#L10-L1539


 - [ ] ID-188
Event [DSTestlog_string(string)](lib/ds-test/src/test.sol#L27) is not in CapWords

lib/ds-test/src/test.sol#L27


 - [ ] ID-189
Event [DSTestlog_named_bytes32(string,bytes32)](lib/ds-test/src/test.sol#L30) is not in CapWords

lib/ds-test/src/test.sol#L30


 - [ ] ID-190
Function [stdStorage.checked_write(StdStorage,bool)](lib/forge-std/src/Test.sol#L546-L553) is not in mixedCase

lib/forge-std/src/Test.sol#L546-L553


 - [ ] ID-191
Constant [stdError.divisionError](lib/forge-std/src/Test.sol#L379) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L379


 - [ ] ID-192
Event [DSTestlog_bytes32(bytes32)](lib/ds-test/src/test.sol#L23) is not in CapWords

lib/ds-test/src/test.sol#L23


 - [ ] ID-193
Function [stdStorage.with_key(StdStorage,bytes32)](lib/forge-std/src/Test.sol#L528-L531) is not in mixedCase

lib/forge-std/src/Test.sol#L528-L531


 - [ ] ID-194
Function [stdStorage.read_uint(StdStorage)](lib/forge-std/src/Test.sol#L606-L608) is not in mixedCase

lib/forge-std/src/Test.sol#L606-L608


 - [ ] ID-195
Parameter [NftAuthoriser.canRegister(bytes32,address,bytes)._user](src/NftAuthoriser.sol#L22) is not in mixedCase

src/NftAuthoriser.sol#L22


 - [ ] ID-196
Event [DSTestlog_named_string(string,string)](lib/ds-test/src/test.sol#L36) is not in CapWords

lib/ds-test/src/test.sol#L36


 - [ ] ID-197
Event [DSTestlog_named_address(string,address)](lib/ds-test/src/test.sol#L29) is not in CapWords

lib/ds-test/src/test.sol#L29


 - [ ] ID-198
Event [DSTestlog_address(address)](lib/ds-test/src/test.sol#L22) is not in CapWords

lib/ds-test/src/test.sol#L22


 - [ ] ID-199
Parameter [stdStorage.depth(StdStorage,uint256)._depth](lib/forge-std/src/Test.sol#L533) is not in mixedCase

lib/forge-std/src/Test.sol#L533


 - [ ] ID-200
Parameter [Registrar.addRootNode(bytes32,IAuthoriser,IRulesEngine)._rules](src/Registrar.sol#L77) is not in mixedCase

src/Registrar.sol#L77


 - [ ] ID-201
Contract [console](lib/forge-std/src/console.sol#L4-L1534) is not in CapWords

lib/forge-std/src/console.sol#L4-L1534


 - [ ] ID-202
Variable [EnsSetup._defaultRegistrarController](lib/forge-ens/src/EnsSetup.sol#L26) is not in mixedCase

lib/forge-ens/src/EnsSetup.sol#L26


 - [ ] ID-203
Function [stdStorage.read_int(StdStorage)](lib/forge-std/src/Test.sol#L610-L612) is not in mixedCase

lib/forge-std/src/Test.sol#L610-L612


 - [ ] ID-204
Constant [stdError.encodeStorageError](lib/forge-std/src/Test.sol#L381) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L381


 - [ ] ID-205
Event [TestWARNING_Deprecated(string)](lib/forge-std/src/Test.sol#L15) is not in CapWords

lib/forge-std/src/Test.sol#L15


 - [ ] ID-206
Event [DSTestlog_named_decimal_uint(string,uint256,uint256)](lib/ds-test/src/test.sol#L32) is not in CapWords

lib/ds-test/src/test.sol#L32


 - [ ] ID-207
Function [ABIResolver.ABI(bytes32,uint256)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ABIResolver.sol#L35-L45) is not in mixedCase

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ABIResolver.sol#L35-L45


 - [ ] ID-208
Function [stdStorage.checked_write(StdStorage,address)](lib/forge-std/src/Test.sol#L538-L540) is not in mixedCase

lib/forge-std/src/Test.sol#L538-L540


 - [ ] ID-209
Function [stdStorage.read_bool(StdStorage)](lib/forge-std/src/Test.sol#L598-L600) is not in mixedCase

lib/forge-std/src/Test.sol#L598-L600


 - [ ] ID-210
Contract [stdStorage](lib/forge-std/src/Test.sol#L405-L637) is not in CapWords

lib/forge-std/src/Test.sol#L405-L637


 - [ ] ID-211
Constant [BytesUtils.base32HexTable](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L250) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L250


 - [ ] ID-212
Event [DSTestlog_named_uint(string,uint256)](lib/ds-test/src/test.sol#L34) is not in CapWords

lib/ds-test/src/test.sol#L34


 - [ ] ID-213
Function [stdStorage.with_key(StdStorage,address)](lib/forge-std/src/Test.sol#L519-L522) is not in mixedCase

lib/forge-std/src/Test.sol#L519-L522


 - [ ] ID-214
Function [stdStorage.checked_write(StdStorage,uint256)](lib/forge-std/src/Test.sol#L542-L544) is not in mixedCase

lib/forge-std/src/Test.sol#L542-L544


 - [ ] ID-215
Event [DSTestlog(string)](lib/ds-test/src/test.sol#L19) is not in CapWords

lib/ds-test/src/test.sol#L19


 - [ ] ID-216
Parameter [ETHRegistrarController.setCommitmentAges(uint256,uint256)._minCommitmentAge](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147) is not in mixedCase

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147


 - [ ] ID-217
Contract [stdMath](lib/forge-std/src/Test.sol#L643-L682) is not in CapWords

lib/forge-std/src/Test.sol#L643-L682


 - [ ] ID-218
Contract [stdError](lib/forge-std/src/Test.sol#L376-L388) is not in CapWords

lib/forge-std/src/Test.sol#L376-L388


 - [ ] ID-219
Struct [Buffer.buffer](lib/forge-ens/lib/buffer/contracts/Buffer.sol#L18-L21) is not in CapWords

lib/forge-ens/lib/buffer/contracts/Buffer.sol#L18-L21


 - [ ] ID-220
Function [stdStorage.read_address(StdStorage)](lib/forge-std/src/Test.sol#L602-L604) is not in mixedCase

lib/forge-std/src/Test.sol#L602-L604


 - [ ] ID-221
Event [DSTestlog_int(int256)](lib/ds-test/src/test.sol#L24) is not in CapWords

lib/ds-test/src/test.sol#L24


 - [ ] ID-222
Parameter [ETHRegistrarController.setPriceOracle(PriceOracle)._prices](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L142) is not in mixedCase

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L142


 - [ ] ID-223
Constant [stdError.zeroVarError](lib/forge-std/src/Test.sol#L385) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L385


 - [ ] ID-224
Constant [stdError.assertionError](lib/forge-std/src/Test.sol#L377) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L377


 - [ ] ID-225
Constant [Test.vm](lib/forge-std/src/Test.sol#L17) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L17


 - [ ] ID-226
Constant [stdError.lowLevelError](lib/forge-std/src/Test.sol#L387) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L387


 - [ ] ID-227
Event [DSTestlogs(bytes)](lib/ds-test/src/test.sol#L20) is not in CapWords

lib/ds-test/src/test.sol#L20


 - [ ] ID-228
Event [stdStorageWARNING_UninitedSlot(address,uint256)](lib/forge-std/src/Test.sol#L407) is not in CapWords

lib/forge-std/src/Test.sol#L407


 - [ ] ID-229
Function [Resolver.ABI(bytes32,uint256)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L18) is not in mixedCase

lib/forge-ens/lib/ens-contracts/contracts/resolvers/Resolver.sol#L18


 - [ ] ID-230
Event [DSTestlog_uint(uint256)](lib/ds-test/src/test.sol#L25) is not in CapWords

lib/ds-test/src/test.sol#L25


 - [ ] ID-231
Constant [stdError.popError](lib/forge-std/src/Test.sol#L382) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L382


 - [ ] ID-232
Variable [EnsSetup._defaultResolver](lib/forge-ens/src/EnsSetup.sol#L27) is not in mixedCase

lib/forge-ens/src/EnsSetup.sol#L27


 - [ ] ID-233
Constant [stdError.memOverflowError](lib/forge-std/src/Test.sol#L384) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L384


 - [ ] ID-234
Constant [stdError.arithmeticError](lib/forge-std/src/Test.sol#L378) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L378


 - [ ] ID-235
Constant [stdError.indexOOBError](lib/forge-std/src/Test.sol#L383) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L383


 - [ ] ID-236
Modifier [DSTest.logs_gas()](lib/ds-test/src/test.sol#L86-L91) is not in mixedCase

lib/ds-test/src/test.sol#L86-L91


 - [ ] ID-237
Parameter [ETHRegistrarController.setCommitmentAges(uint256,uint256)._maxCommitmentAge](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147) is not in mixedCase

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147


 - [ ] ID-238
Variable [DSTest.IS_TEST](lib/ds-test/src/test.sol#L38) is not in mixedCase

lib/ds-test/src/test.sol#L38


 - [ ] ID-239
Constant [stdStorage.vm_std_store](lib/forge-std/src/Test.sol#L412) is not in UPPER_CASE_WITH_UNDERSCORES

lib/forge-std/src/Test.sol#L412


 - [ ] ID-240
Event [DSTestlog_named_decimal_int(string,int256,uint256)](lib/ds-test/src/test.sol#L31) is not in CapWords

lib/ds-test/src/test.sol#L31


 - [ ] ID-241
Event [DSTestlog_bytes(bytes)](lib/ds-test/src/test.sol#L26) is not in CapWords

lib/ds-test/src/test.sol#L26


 - [ ] ID-242
Variable [EnsSetup._baseRegistrar](lib/forge-ens/src/EnsSetup.sol#L25) is not in mixedCase

lib/forge-ens/src/EnsSetup.sol#L25


 - [ ] ID-243
Function [stdStorage.with_key(StdStorage,uint256)](lib/forge-std/src/Test.sol#L524-L527) is not in mixedCase

lib/forge-std/src/Test.sol#L524-L527


 - [ ] ID-244
Function [stdStorage.read_bytes32(StdStorage)](lib/forge-std/src/Test.sol#L593-L595) is not in mixedCase

lib/forge-std/src/Test.sol#L593-L595


 - [ ] ID-245
Event [DSTestlog_named_bytes(string,bytes)](lib/ds-test/src/test.sol#L35) is not in CapWords

lib/ds-test/src/test.sol#L35


## redundant-statements
Impact: Informational
Confidence: High
 - [ ] ID-246
Redundant expression "[status](lib/ds-test/src/test.sol#L73)" in[DSTest](lib/ds-test/src/test.sol#L18-L469)

lib/ds-test/src/test.sol#L73


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-247
Reentrancy in [ETHRegistrarController.renew(string,uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L128-L140):
	External calls:
	- [address(msg.sender).transfer(msg.value - cost)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L136)
	Event emitted after the call(s):
	- [NameRenewed(name,label,cost,expires)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L139)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L128-L140


## too-many-digits
Impact: Informational
Confidence: Medium
 - [ ] ID-248
[RegistrarTest.slitherConstructorConstantVariables()](src/test/Registrar.t.sol#L27-L114) uses literals with too many digits:
	- [CONTROLLER_ADDR = 0x0000000000000000000000000000000000012345](lib/forge-ens/src/EnsSetup.sol#L29)

src/test/Registrar.t.sol#L27-L114


 - [ ] ID-249
[console.slitherConstructorConstantVariables()](lib/forge-std/src/console.sol#L4-L1534) uses literals with too many digits:
	- [CONSOLE_ADDRESS = address(0x000000000000000000636F6e736F6c652e6c6f67)](lib/forge-std/src/console.sol#L5)

lib/forge-std/src/console.sol#L4-L1534


 - [ ] ID-250
[BytesUtils.readBytes20(bytes,uint256)](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L184-L189) uses literals with too many digits:
	- [ret = mload(uint256)(self + 32 + idx) & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000](lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L187)

lib/forge-ens/lib/ens-contracts/contracts/dnssec-oracle/BytesUtils.sol#L184-L189


 - [ ] ID-251
[console2.slitherConstructorConstantVariables()](lib/forge-std/src/console2.sol#L10-L1539) uses literals with too many digits:
	- [CONSOLE_ADDRESS = address(0x000000000000000000636F6e736F6c652e6c6f67)](lib/forge-std/src/console2.sol#L11)

lib/forge-std/src/console2.sol#L10-L1539


## unused-state
Impact: Informational
Confidence: High
 - [ ] ID-252
[DNSResolver.DNS_ZONE_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L10) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L10


 - [ ] ID-253
[PubkeyResolver.PUBKEY_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/PubkeyResolver.sol#L5) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/PubkeyResolver.sol#L5


 - [ ] ID-254
[DNSResolver.DNS_RECORD_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L9) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L9


 - [ ] ID-255
[stdStorage.UINT256_MAX](lib/forge-std/src/Test.sol#L409) is never used in [stdStorage](lib/forge-std/src/Test.sol#L405-L637)

lib/forge-std/src/Test.sol#L409


 - [ ] ID-256
[ABIResolver.ABI_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ABIResolver.sol#L5) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ABIResolver.sol#L5


 - [ ] ID-257
[stdStorage.INT256_MAX](lib/forge-std/src/Test.sol#L410) is never used in [stdStorage](lib/forge-std/src/Test.sol#L405-L637)

lib/forge-std/src/Test.sol#L410


 - [ ] ID-258
[InterfaceResolver.INTERFACE_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L6) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/InterfaceResolver.sol#L6


 - [ ] ID-259
[ContentHashResolver.CONTENT_HASH_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ContentHashResolver.sol#L5) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/ContentHashResolver.sol#L5


 - [ ] ID-260
[AddrResolver.ADDR_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L5) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L5


 - [ ] ID-261
[NameResolver.NAME_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/NameResolver.sol#L5) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/NameResolver.sol#L5


 - [ ] ID-262
[AddrResolver.ADDRESS_INTERFACE_ID](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L6) is never used in [PublicResolver](lib/forge-ens/lib/ens-contracts/contracts/resolvers/PublicResolver.sol#L17-L69)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/AddrResolver.sol#L6


## constable-states
Impact: Optimization
Confidence: High
 - [ ] ID-263
[EnsSetup.ethNode](lib/forge-ens/src/EnsSetup.sol#L32) should be constant

lib/forge-ens/src/EnsSetup.sol#L32


 - [ ] ID-264
[DSTest.IS_TEST](lib/ds-test/src/test.sol#L38) should be constant

lib/ds-test/src/test.sol#L38


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-265
clearDNSZone(bytes32) should be declared external:
	- [DNSResolver.clearDNSZone(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L116-L119)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L116-L119


 - [ ] ID-266
setOwner(address) should be declared external:
	- [Owned.setOwner(address)](lib/solmate/src/auth/Owned.sol#L39-L43)

lib/solmate/src/auth/Owned.sol#L39-L43


 - [ ] ID-267
supportsInterface(bytes4) should be declared external:
	- [BaseRegistrarImplementation.supportsInterface(bytes4)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L149-L153)
	- [ERC721.supportsInterface(bytes4)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L52-L57)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/BaseRegistrarImplementation.sol#L149-L153


 - [ ] ID-268
bound(uint256,uint256,uint256) should be declared external:
	- [Test.bound(uint256,uint256,uint256)](lib/forge-std/src/Test.sol#L132-L153)

lib/forge-std/src/Test.sol#L132-L153


 - [ ] ID-269
testFailCheckValidityWhenDisabled() should be declared external:
	- [RegistrarTest.testFailCheckValidityWhenDisabled()](src/test/Registrar.t.sol#L105-L107)

src/test/Registrar.t.sol#L105-L107


 - [ ] ID-270
testCannotRegister() should be declared external:
	- [NftAuthoriserTest.testCannotRegister()](src/test/NftAuthoriser.t.sol#L37-L43)

src/test/NftAuthoriser.t.sol#L37-L43


 - [ ] ID-271
symbol() should be declared external:
	- [ERC721.symbol()](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L86-L88)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L86-L88


 - [ ] ID-272
setPriceOracle(PriceOracle) should be declared external:
	- [ETHRegistrarController.setPriceOracle(PriceOracle)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L142-L145)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L142-L145


 - [ ] ID-273
testChangeNodeState() should be declared external:
	- [RegistrarTest.testChangeNodeState()](src/test/Registrar.t.sol#L79-L94)

src/test/Registrar.t.sol#L79-L94


 - [ ] ID-274
testValidLabelForNode() should be declared external:
	- [RegistrarTest.testValidLabelForNode()](src/test/Registrar.t.sol#L55-L61)

src/test/Registrar.t.sol#L55-L61


 - [ ] ID-275
hoax(address,uint256) should be declared external:
	- [Test.hoax(address,uint256)](lib/forge-std/src/Test.sol#L39-L42)

lib/forge-std/src/Test.sol#L39-L42


 - [ ] ID-276
deployCode(string) should be declared external:
	- [Test.deployCode(string)](lib/forge-std/src/Test.sol#L174-L188)

lib/forge-std/src/Test.sol#L174-L188


 - [ ] ID-277
renounceOwnership() should be declared external:
	- [Ownable.renounceOwnership()](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L54-L56)

lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L54-L56


 - [ ] ID-278
rewind(uint256) should be declared external:
	- [Test.rewind(uint256)](lib/forge-std/src/Test.sol#L29-L31)

lib/forge-std/src/Test.sol#L29-L31


 - [ ] ID-279
tokenURI(uint256) should be declared external:
	- [ERC721.tokenURI(uint256)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L93-L98)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L93-L98


 - [ ] ID-280
setTTL(bytes32,uint64) should be declared external:
	- [ENSRegistry.setTTL(bytes32,uint64)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L96-L99)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L96-L99


 - [ ] ID-281
testInvalidLabel() should be declared external:
	- [NftAuthoriserTest.testInvalidLabel()](src/test/NftAuthoriser.t.sol#L51-L63)

src/test/NftAuthoriser.t.sol#L51-L63


 - [ ] ID-282
hoax(address,address,uint256) should be declared external:
	- [Test.hoax(address,address,uint256)](lib/forge-std/src/Test.sol#L49-L52)

lib/forge-std/src/Test.sol#L49-L52


 - [ ] ID-283
setCommitmentAges(uint256,uint256) should be declared external:
	- [ETHRegistrarController.setCommitmentAges(uint256,uint256)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147-L150)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L147-L150


 - [ ] ID-284
safeTransferFrom(address,address,uint256) should be declared external:
	- [ERC721.safeTransferFrom(address,address,uint256)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L164-L170)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L164-L170


 - [ ] ID-285
deal(address,address,uint256) should be declared external:
	- [Test.deal(address,address,uint256)](lib/forge-std/src/Test.sol#L100-L102)

lib/forge-std/src/Test.sol#L100-L102


 - [ ] ID-286
hoax(address,address) should be declared external:
	- [Test.hoax(address,address)](lib/forge-std/src/Test.sol#L44-L47)

lib/forge-std/src/Test.sol#L44-L47


 - [ ] ID-287
testRegisterSubdomain() should be declared external:
	- [RegistrarTest.testRegisterSubdomain()](src/test/Registrar.t.sol#L63-L77)

src/test/Registrar.t.sol#L63-L77


 - [ ] ID-288
testFailChangeStateOnUnintializedProject() should be declared external:
	- [RegistrarTest.testFailChangeStateOnUnintializedProject()](src/test/Registrar.t.sol#L96-L98)

src/test/Registrar.t.sol#L96-L98


 - [ ] ID-289
commit(bytes32) should be declared external:
	- [ETHRegistrarController.commit(bytes32)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L79-L82)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L79-L82


 - [ ] ID-290
testCanRegister() should be declared external:
	- [NftAuthoriserTest.testCanRegister()](src/test/NftAuthoriser.t.sol#L29-L35)

src/test/NftAuthoriser.t.sol#L29-L35


 - [ ] ID-291
ownerOf(uint256) should be declared external:
	- [ERC721.ownerOf(uint256)](src/test/NftAuthoriser.t.sol#L14-L17)

src/test/NftAuthoriser.t.sol#L14-L17


 - [ ] ID-292
transferFrom(address,address,uint256) should be declared external:
	- [ERC721.transferFrom(address,address,uint256)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L150-L159)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L150-L159


 - [ ] ID-293
hoax(address) should be declared external:
	- [Test.hoax(address)](lib/forge-std/src/Test.sol#L34-L37)

lib/forge-std/src/Test.sol#L34-L37


 - [ ] ID-294
setUp() should be declared external:
	- [NftAuthoriserTest.setUp()](src/test/NftAuthoriser.t.sol#L24-L27)

src/test/NftAuthoriser.t.sol#L24-L27


 - [ ] ID-295
setResolver(bytes32,address) should be declared external:
	- [ENSRegistry.setResolver(bytes32,address)](lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L86-L89)

lib/forge-ens/lib/ens-contracts/contracts/registry/ENSRegistry.sol#L86-L89


 - [ ] ID-296
testValidLabel() should be declared external:
	- [NftAuthoriserTest.testValidLabel()](src/test/NftAuthoriser.t.sol#L45-L49)

src/test/NftAuthoriser.t.sol#L45-L49


 - [ ] ID-297
approve(address,uint256) should be declared external:
	- [ERC721.approve(address,uint256)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L112-L122)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L112-L122


 - [ ] ID-298
register(bytes32,string,address,bytes[]) should be declared external:
	- [Registrar.register(bytes32,string,address,bytes[])](src/Registrar.sol#L108-L119)

src/Registrar.sol#L108-L119


 - [ ] ID-299
transferOwnership(address) should be declared external:
	- [Ownable.transferOwnership(address)](lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L62-L65)

lib/forge-ens/lib/openzeppelin-contracts/contracts/access/Ownable.sol#L62-L65


 - [ ] ID-300
startHoax(address,address,uint256) should be declared external:
	- [Test.startHoax(address,address,uint256)](lib/forge-std/src/Test.sol#L72-L75)

lib/forge-std/src/Test.sol#L72-L75


 - [ ] ID-301
withdraw() should be declared external:
	- [ETHRegistrarController.withdraw()](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L152-L154)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L152-L154


 - [ ] ID-302
makeCommitment(string,address,bytes32) should be declared external:
	- [ETHRegistrarController.makeCommitment(string,address,bytes32)](lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L66-L68)

lib/forge-ens/lib/ens-contracts/contracts/ethregistrar/ETHRegistrarController.sol#L66-L68


 - [ ] ID-303
name() should be declared external:
	- [ERC721.name()](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L79-L81)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L79-L81


 - [ ] ID-304
testValidLabel() should be declared external:
	- [RegistrarTest.testValidLabel()](src/test/Registrar.t.sol#L100-L103)

src/test/Registrar.t.sol#L100-L103


 - [ ] ID-305
deal(address,uint256) should be declared external:
	- [Test.deal(address,uint256)](lib/forge-std/src/Test.sol#L94-L96)

lib/forge-std/src/Test.sol#L94-L96


 - [ ] ID-306
dnsRecord(bytes32,bytes32,uint16) should be declared external:
	- [DNSResolver.dnsRecord(bytes32,bytes32,uint16)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L99-L101)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L99-L101


 - [ ] ID-307
startHoax(address) should be declared external:
	- [Test.startHoax(address)](lib/forge-std/src/Test.sol#L55-L58)

lib/forge-std/src/Test.sol#L55-L58


 - [ ] ID-308
startHoax(address,uint256) should be declared external:
	- [Test.startHoax(address,uint256)](lib/forge-std/src/Test.sol#L60-L63)

lib/forge-std/src/Test.sol#L60-L63


 - [ ] ID-309
tip(address,address,uint256) should be declared external:
	- [Test.tip(address,address,uint256)](lib/forge-std/src/Test.sol#L83-L90)

lib/forge-std/src/Test.sol#L83-L90


 - [ ] ID-310
failed() should be declared external:
	- [DSTest.failed()](lib/ds-test/src/test.sol#L47-L63)

lib/ds-test/src/test.sol#L47-L63


 - [ ] ID-311
deployCode(string,bytes) should be declared external:
	- [Test.deployCode(string,bytes)](lib/forge-std/src/Test.sol#L158-L172)

lib/forge-std/src/Test.sol#L158-L172


 - [ ] ID-312
balanceOf(address) should be declared external:
	- [ERC721.balanceOf(address)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L62-L65)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L62-L65


 - [ ] ID-313
startHoax(address,address) should be declared external:
	- [Test.startHoax(address,address)](lib/forge-std/src/Test.sol#L67-L70)

lib/forge-std/src/Test.sol#L67-L70


 - [ ] ID-314
skip(uint256) should be declared external:
	- [Test.skip(uint256)](lib/forge-std/src/Test.sol#L25-L27)

lib/forge-std/src/Test.sol#L25-L27


 - [ ] ID-315
hasDNSRecords(bytes32,bytes32) should be declared external:
	- [DNSResolver.hasDNSRecords(bytes32,bytes32)](lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L108-L110)

lib/forge-ens/lib/ens-contracts/contracts/resolvers/profiles/DNSResolver.sol#L108-L110


 - [ ] ID-316
testAddRootNode() should be declared external:
	- [RegistrarTest.testAddRootNode()](src/test/Registrar.t.sol#L45-L53)

src/test/Registrar.t.sol#L45-L53


 - [ ] ID-317
setApprovalForAll(address,bool) should be declared external:
	- [ERC721.setApprovalForAll(address,bool)](lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L136-L138)

lib/forge-ens/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol#L136-L138


 - [ ] ID-318
canRegister(bytes32,address,bytes) should be declared external:
	- [Authoriser.canRegister(bytes32,address,bytes)](src/test/Registrar.t.sol#L8-L14)

src/test/Registrar.t.sol#L8-L14


