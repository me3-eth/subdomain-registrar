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


 - [ ] ID-1
[NftAuthoriser.constructor(address,address)._resolver](src/NftAuthoriser.sol#L27) lacks a zero-check on :
		- [resolver = _resolver](src/NftAuthoriser.sol#L29)

src/NftAuthoriser.sol#L27


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-2
Reentrancy in [Registrar.register(bytes32,string,bytes)](src/Registrar.sol#L142-L159):
	External calls:
	- [ens.setSubnodeRecord(node,hashedLabel,owner,resolver,86400)](src/Registrar.sol#L157)
	Event emitted after the call(s):
	- [SubnodeRegistered(node,hashedLabel,owner,msg.sender)](src/Registrar.sol#L158)

src/Registrar.sol#L142-L159


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-3
Pragma version[>=0.8.10<0.9.0](src/IAuthoriser.sol#L1) is too complex

src/IAuthoriser.sol#L1


 - [ ] ID-4
Pragma version[>=0.8.10<0.9.0](src/Utils.sol#L1) is too complex

src/Utils.sol#L1


 - [ ] ID-5
solc-0.8.10 is not recommended for deployment

 - [ ] ID-6
Pragma version[>=0.8.10<0.9.0](src/NftAuthoriser.sol#L1) is too complex

src/NftAuthoriser.sol#L1


 - [ ] ID-7
Pragma version[>=0.8.10<0.9.0](src/IRulesEngine.sol#L1) is too complex

src/IRulesEngine.sol#L1


 - [ ] ID-8
Pragma version[0.8.10](src/Registrar.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Registrar.sol#L1


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-9
register(bytes32,string,bytes) should be declared external:
	- [Registrar.register(bytes32,string,bytes)](src/Registrar.sol#L142-L159)

src/Registrar.sol#L142-L159


