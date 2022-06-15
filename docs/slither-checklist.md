# Slither Results

Checklist of results from Slither. Command to regenerate:

```sh
# from repo root
slither . --filter-paths "test|lib" --checklist > docs/slither-checklist.md
```

Summary
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [reentrancy-events](#reentrancy-events) (1 results) (Low)
 - [dead-code](#dead-code) (2 results) (Informational)
 - [solc-version](#solc-version) (6 results) (Informational)
 - [naming-convention](#naming-convention) (3 results) (Informational)
 - [external-function](#external-function) (1 results) (Optimization)

## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-0
[Registrar.constructor(ENS,address)._resolver](src/Registrar.sol#L100) lacks a zero-check on :
		- [me3Resolver = _resolver](src/Registrar.sol#L102)

src/Registrar.sol#L100


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-1
Reentrancy in [Registrar.register(bytes32,string,address,bytes)](src/Registrar.sol#L142-L153):
	External calls:
	- [ens.setSubnodeRecord(node,hashedLabel,owner,me3Resolver,86400)](src/Registrar.sol#L151)
	Event emitted after the call(s):
	- [SubnodeRegistered(node,hashedLabel,owner)](src/Registrar.sol#L152)

src/Registrar.sol#L142-L153


## dead-code
Impact: Informational
Confidence: Medium
 - [ ] ID-2
[Utilities.namehash(bytes32,bytes32)](src/Utils.sol#L18-L24) is never used and should be removed

src/Utils.sol#L18-L24


 - [ ] ID-3
[Registrar.available(bytes32,string)](src/Registrar.sol#L165-L171) is never used and should be removed

src/Registrar.sol#L165-L171


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-4
Pragma version[>=0.8.10<0.9.0](src/IAuthoriser.sol#L1) is too complex

src/IAuthoriser.sol#L1


 - [ ] ID-5
Pragma version[>=0.8.10<0.9.0](src/Utils.sol#L1) is too complex

src/Utils.sol#L1


 - [ ] ID-6
solc-0.8.10 is not recommended for deployment

 - [ ] ID-7
Pragma version[>=0.8.10<0.9.0](src/NftAuthoriser.sol#L1) is too complex

src/NftAuthoriser.sol#L1


 - [ ] ID-8
Pragma version[>=0.8.10<0.9.0](src/IRulesEngine.sol#L1) is too complex

src/IRulesEngine.sol#L1


 - [ ] ID-9
Pragma version[0.8.10](src/Registrar.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

src/Registrar.sol#L1


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-10
Parameter [Registrar.addRootNode(bytes32,IAuthoriser,IRulesEngine)._authoriser](src/Registrar.sol#L111) is not in mixedCase

src/Registrar.sol#L111


 - [ ] ID-11
Parameter [NftAuthoriser.canRegister(bytes32,address,bytes)._user](src/NftAuthoriser.sol#L31) is not in mixedCase

src/NftAuthoriser.sol#L31


 - [ ] ID-12
Parameter [Registrar.addRootNode(bytes32,IAuthoriser,IRulesEngine)._rules](src/Registrar.sol#L112) is not in mixedCase

src/Registrar.sol#L112


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-13
register(bytes32,string,address,bytes) should be declared external:
	- [Registrar.register(bytes32,string,address,bytes)](src/Registrar.sol#L142-L153)

src/Registrar.sol#L142-L153
