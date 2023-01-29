# Utilities
[Git Source](https://github.com/me3-eth/protocol/blob/7b584c2e2f000cf0ce4649d2bd0bc874fd19925a/src/Utils.sol)

**Author:**
charchar.eth

Central location for shared functions in me3


## Functions
### labelhash

Hash a label for ENS use


```solidity
function labelhash(string memory label) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`label`|`string`|The 'oops' in 'oops.bob.eth', or the 'bob' in 'bob.eth'|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|Hashed label|


### namehash

Create a namehash, the combination of a namehashed node and a hashed label


```solidity
function namehash(bytes32 node, bytes32 label) internal pure returns (bytes32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|Fully qualified, namehashed ENS name ('bob.eth')|
|`label`|`bytes32`|The 'oops' in 'oops.bob.eth', or the 'bob' in 'bob.eth'|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|Hashed ENS name|


