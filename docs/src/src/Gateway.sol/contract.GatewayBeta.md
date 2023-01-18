# GatewayBeta
[Git Source](https://github.com/me3-eth/protocol/blob/cfce1d62c5d591e289c28d1f07564311fdc99c8d/src/Gateway.sol)

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
function register(string projectEns, IAuthoriser authoriser, IRulesEngine rules) external payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`projectEns`|`string`|The ENS name of the project, eg me3.eth|
|`authoriser`|`IAuthoriser`|The authorisation contract|
|`rules`|`IRulesEngine`|The rules around availability, validity, and usage|


