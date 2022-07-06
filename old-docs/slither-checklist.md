# 2022-07-04

Summary
 - [shadowing-local](#shadowing-local) (1 results) (Low)
 - [missing-zero-check](#missing-zero-check) (2 results) (Low)
 - [calls-loop](#calls-loop) (1 results) (Low)
 - [assembly](#assembly) (2 results) (Informational)
 - [solc-version](#solc-version) (17 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [naming-convention](#naming-convention) (4 results) (Informational)
 - [too-many-digits](#too-many-digits) (1 results) (Informational)
 - [external-function](#external-function) (4 results) (Optimization)
## shadowing-local
Impact: Low
Confidence: High
 - [ ] ID-0
[NameResolver.setName(bytes32,string).name](src/resolvers/Name.sol#L16) shadows:
	- [NameResolver.name(bytes32)](src/resolvers/Name.sol#L11-L13) (function)
	- [INameRead.name(bytes32)](src/resolvers/INameResolver.sol#L7) (function)

src/resolvers/Name.sol#L16


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-1
[NftAuthoriser.setResolver(address)._resolver](src/NftAuthoriser.sol#L111) lacks a zero-check on :
		- [resolver = _resolver](src/NftAuthoriser.sol#L112)

src/NftAuthoriser.sol#L111


 - [ ] ID-2
[NftAuthoriser.constructor(address,address)._resolver](src/NftAuthoriser.sol#L28) lacks a zero-check on :
		- [resolver = _resolver](src/NftAuthoriser.sol#L30)

src/NftAuthoriser.sol#L28


## calls-loop
Impact: Low
Confidence: Medium
 - [ ] ID-3
[OnchainResolver.multicall(bytes[])](src/OnchainResolver.sol#L40-L49) has external calls inside a loop: [(success,result) = address(this).delegatecall(fns[i])](src/OnchainResolver.sol#L44)

src/OnchainResolver.sol#L40-L49


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-4
[AddressResolver.bytesToAddress(bytes)](src/resolvers/Address.sol#L62-L71) uses assembly
	- [INLINE ASM](src/resolvers/Address.sol#L68-L70)

src/resolvers/Address.sol#L62-L71


 - [ ] ID-5
[AddressResolver.addressToBytes(address)](src/resolvers/Address.sol#L73-L82) uses assembly
	- [INLINE ASM](src/resolvers/Address.sol#L79-L81)

src/resolvers/Address.sol#L73-L82


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-6
Pragma version[0.8.10](src/resolvers/ITextResolver.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/ITextResolver.sol#L2


 - [ ] ID-7
Pragma version[0.8.10](src/Registrar.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Registrar.sol#L2


 - [ ] ID-8
Pragma version[0.8.10](src/resolvers/Address.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/Address.sol#L2


 - [ ] ID-9
Pragma version[0.8.10](src/NftAuthoriser.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/NftAuthoriser.sol#L2


 - [ ] ID-10
Pragma version[0.8.10](src/resolvers/Base.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/Base.sol#L2


 - [ ] ID-11
solc-0.8.10 is not recommended for deployment

 - [ ] ID-12
Pragma version[0.8.10](src/IMulticall.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/IMulticall.sol#L2


 - [ ] ID-13
Pragma version[0.8.10](src/resolvers/Text.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/Text.sol#L2


 - [ ] ID-14
Pragma version[0.8.10](script/DeployProtocol.s.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

script/DeployProtocol.s.sol#L2


 - [ ] ID-15
Pragma version[0.8.10](script/DeployNftAuthoriser.s.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

script/DeployNftAuthoriser.s.sol#L2


 - [ ] ID-16
Pragma version[0.8.10](src/resolvers/INameResolver.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/INameResolver.sol#L2


 - [ ] ID-17
Pragma version[0.8.10](src/resolvers/IAddressResolver.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/IAddressResolver.sol#L2


 - [ ] ID-18
Pragma version[^0.8.10](src/IAuthoriser.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/IAuthoriser.sol#L2


 - [ ] ID-19
Pragma version[0.8.10](src/resolvers/Name.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/resolvers/Name.sol#L2


 - [ ] ID-20
Pragma version[^0.8.10](src/IRulesEngine.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/IRulesEngine.sol#L2


 - [ ] ID-21
Pragma version[0.8.10](src/Utils.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Utils.sol#L2


 - [ ] ID-22
Pragma version[0.8.10](src/OnchainResolver.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/OnchainResolver.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-23
Low level call in [OnchainResolver.multicall(bytes[])](src/OnchainResolver.sol#L40-L49):
	- [(success,result) = address(this).delegatecall(fns[i])](src/OnchainResolver.sol#L44)

src/OnchainResolver.sol#L40-L49


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-24
Constant [DeployRegistrar.ensRegistry](script/DeployProtocol.s.sol#L10) is not in UPPER_CASE_WITH_UNDERSCORES

script/DeployProtocol.s.sol#L10


 - [ ] ID-25
Parameter [NftAuthoriser.setResolver(address)._resolver](src/NftAuthoriser.sol#L111) is not in mixedCase

src/NftAuthoriser.sol#L111


 - [ ] ID-26
Parameter [AddressResolver.setAddr(bytes32,address)._addr](src/resolvers/Address.sol#L34) is not in mixedCase

src/resolvers/Address.sol#L34


 - [ ] ID-27
Parameter [AddressResolver.addressToBytes(address)._addr](src/resolvers/Address.sol#L73) is not in mixedCase

src/resolvers/Address.sol#L73


## too-many-digits
Impact: Informational
Confidence: Medium
 - [ ] ID-28
[DeployRegistrar.slitherConstructorConstantVariables()](script/DeployProtocol.s.sol#L9-L24) uses literals with too many digits:
	- [ensRegistry = 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e](script/DeployProtocol.s.sol#L10)

script/DeployProtocol.s.sol#L9-L24


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-29
setAddr(bytes32,uint256,bytes) should be declared external:
	- [AddressResolver.setAddr(bytes32,uint256,bytes)](src/resolvers/Address.sol#L42-L46)

src/resolvers/Address.sol#L42-L46


 - [ ] ID-30
supportsInterface(bytes4) should be declared external:
	- [NftAuthoriser.supportsInterface(bytes4)](src/NftAuthoriser.sol#L115-L119)

src/NftAuthoriser.sol#L115-L119


 - [ ] ID-31
setAddr(bytes32,address) should be declared external:
	- [AddressResolver.setAddr(bytes32,address)](src/resolvers/Address.sol#L34-L39)

src/resolvers/Address.sol#L34-L39


 - [ ] ID-32
addr(bytes32) should be declared external:
	- [AddressResolver.addr(bytes32)](src/resolvers/Address.sol#L14-L21)

src/resolvers/Address.sol#L14-L21


# 2022-06-16

Summary
 - [missing-zero-check](#missing-zero-check) (2 results) (Low)
 - [reentrancy-events](#reentrancy-events) (1 results) (Low)
 - [solc-version](#solc-version) (6 results) (Informational)
 - [external-function](#external-function) (1 results) (Optimization)

## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-0
[Registrar.constructor(ENS,address)._resolver](src/Registrar.sol#L109) lacks a zero-check on :
		- [fallbackResolver = _resolver](src/Registrar.sol#L111)

src/Registrar.sol#L109


 - [X] ID-1
[NftAuthoriser.constructor(address,address)._resolver](src/NftAuthoriser.sol#L27) lacks a zero-check on :
		- [resolver = _resolver](src/NftAuthoriser.sol#L29)

src/NftAuthoriser.sol#L27

**charchar:** Ignoring as zero is a valid value

## reentrancy-events
Impact: Low
Confidence: Medium
 - [X] ID-2
Reentrancy in [Registrar.register(bytes32,string,bytes)](src/Registrar.sol#L142-L159):
	External calls:
	- [ens.setSubnodeRecord(node,hashedLabel,owner,resolver,86400)](src/Registrar.sol#L157)
	Event emitted after the call(s):
	- [SubnodeRegistered(node,hashedLabel,owner,msg.sender)](src/Registrar.sol#L158)

src/Registrar.sol#L142-L159


## solc-version
Impact: Informational
Confidence: High
 - [X] ID-3
Pragma version[>=0.8.10<0.9.0](src/IAuthoriser.sol#L1) is too complex

src/IAuthoriser.sol#L1


 - [X] ID-4
Pragma version[>=0.8.10<0.9.0](src/Utils.sol#L1) is too complex

src/Utils.sol#L1


 - [X] ID-5
solc-0.8.10 is not recommended for deployment

 - [X] ID-6
Pragma version[>=0.8.10<0.9.0](src/NftAuthoriser.sol#L1) is too complex

src/NftAuthoriser.sol#L1


 - [X] ID-7
Pragma version[>=0.8.10<0.9.0](src/IRulesEngine.sol#L1) is too complex

src/IRulesEngine.sol#L1


 - [X] ID-8
Pragma version[0.8.10](src/Registrar.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Registrar.sol#L1

**charchar:** Comfortable with this as 0.8.10 has been out since Nov 2021 and there are currently no known bugs

## external-function
Impact: Optimization
Confidence: High
 - [X] ID-9
register(bytes32,string,bytes) should be declared external:
	- [Registrar.register(bytes32,string,bytes)](src/Registrar.sol#L142-L159)

src/Registrar.sol#L142-L159

---
