# IRulesEngine
[Git Source](https://github.com/me3-eth/protocol/blob/cfce1d62c5d591e289c28d1f07564311fdc99c8d/src/IRulesEngine.sol)

**Author:**
charchar.eth

Functions that a RulesEngine contract should support


## Functions
### isLabelValid

Determine if a label meets a projects minimum requirements


```solidity
function isLabelValid(bytes32 node, string memory label) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|Fully qualified, namehashed ENS name|
|`label`|`string`|The 'best' in 'best.bob.eth'|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if label is valid, false otherwise|


### subnodeOwner

Determine who should own the subnode


```solidity
function subnodeOwner(address registrant) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`registrant`|`address`|The address that is registereing a subnode|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address that should own the subnode|


### profileResolver

Determine the resolver contract to use for project profiles


```solidity
function profileResolver(bytes32 node, string memory label, address registrant) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|Fully qualified, namehashed ENS name|
|`label`|`string`|The 'best' in 'best.bob.eth'|
|`registrant`|`address`|The address that is registereing a subnode|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the resolver|


