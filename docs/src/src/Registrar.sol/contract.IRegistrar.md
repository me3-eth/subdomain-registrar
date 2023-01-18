# IRegistrar
[Git Source](https://github.com/me3-eth/protocol/blob/cfce1d62c5d591e289c28d1f07564311fdc99c8d/src/Registrar.sol)


## Functions
### register

Register a subdomain under node


```solidity
function register(bytes32 node, string memory label, address owner, bytes[] memory authData) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The project node to use|
|`label`|`string`|The subdomain text, eg the 'hopeless' in hopeless.abc.eth|
|`owner`|`address`||
|`authData`|`bytes[]`|Additional data to help the authoriser authorise|


### valid

Check if a label is valid for a project


```solidity
function valid(bytes32 node, string memory label) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The project node|
|`label`|`string`|The subdomain label to validate|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the label is valid, according to the project rules, false otherwise|


### setProjectNode

Register a project as a subdomain provider


```solidity
function setProjectNode(bytes32 node, IAuthoriser authoriser, IRulesEngine rules, bool enable) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The fully qualified, namehashed ENS name|
|`authoriser`|`IAuthoriser`|The contract that will perform authorisation|
|`rules`|`IRulesEngine`|The contract that will provide rules and validation|
|`enable`|`bool`|Allow project auth and rules to run|


