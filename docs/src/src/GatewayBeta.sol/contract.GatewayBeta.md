# GatewayBeta
[Git Source](https://github.com/me3-eth/protocol/blob/7b584c2e2f000cf0ce4649d2bd0bc874fd19925a/src/GatewayBeta.sol)

**Inherits:**
Owned

**Author:**
charchar.eth

Beta Gateway allowing any project to signup to our subdomain registrar

*0.1.0*


## State Variables
### registrar

```solidity
IRegistrar private registrar;
```


### cost
the cost to signup


```solidity
uint256 public cost = 0;
```


## Functions
### constructor


```solidity
constructor(address registrarContract);
```

### register

Register a project with the me3 subdomain registrar


```solidity
function register(bytes32 node, IAuthoriser authoriser, IRulesEngine rules) external payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The namehashed ENS node of the project, eg namehash(me3.eth)|
|`authoriser`|`IAuthoriser`|The authorisation contract|
|`rules`|`IRulesEngine`|The rules around availability, validity, and usage|


