# NftAuthoriser
[Git Source](https://github.com/me3-eth/protocol/blob/7b584c2e2f000cf0ce4649d2bd0bc874fd19925a/src/NftAuthoriser.sol)

**Inherits:**
[IAuthoriser](/src/IAuthoriser.sol/contract.IAuthoriser.md), [IRulesEngine](/src/IRulesEngine.sol/contract.IRulesEngine.md), Owned

**Author:**
charchar.eth

Determine if a node can be registered or edited using holders of an NFT


## State Variables
### nft
The NFT that is providing ownership details


```solidity
IERC721 public nft;
```


### resolver
The current profile resolver


```solidity
address private resolver;
```


## Functions
### constructor


```solidity
constructor(address _nft, address _resolver);
```

### canRegister


```solidity
function canRegister(bytes32 _node, address _user, bytes[] memory blob) external view returns (bool);
```

### isLabelValid

Make sure label is at least four characters long, emojis supported


```solidity
function isLabelValid(bytes32 node, string memory label) external view returns (bool isValid);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|Unused in this implementation|
|`label`|`string`|The 'best' in 'best.bob.eth'|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isValid`|`bool`|True if label is valid, false otherwise|


### subnodeOwner

Determine who should own the subnode

*The registrant is always the owner*


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
function profileResolver(bytes32, string memory, address) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`||
|`<none>`|`string`||
|`<none>`|`address`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The address of the resolver|


### setResolver

Change the default resolver used at registration

*0x0 is a valid resolver address*


```solidity
function setResolver(address _resolver) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_resolver`|`address`|Address of the new resolver|


### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId) public view returns (bool);
```

