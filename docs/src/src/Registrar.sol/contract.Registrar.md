# Registrar
[Git Source](https://github.com/me3-eth/protocol/blob/cfce1d62c5d591e289c28d1f07564311fdc99c8d/src/Registrar.sol)

**Inherits:**
[IRegistrar](/src/Registrar.sol/contract.IRegistrar.md), Owned

**Author:**
charchar.eth

Provides third-party projects with a common subdomain registration function

*0.1.0*


## State Variables
### ens

```solidity
IENS private ens;
```


### gateway

```solidity
address private gateway;
```


### nodeEnabled
Lookup enabled/disabled state by project node


```solidity
mapping(bytes32 => bool) public nodeEnabled;
```


### nodeAuthorisers
Lookup authoriser contract by project node


```solidity
mapping(bytes32 => IAuthoriser) public nodeAuthorisers;
```


### nodeRules
Lookup rules contract by project node


```solidity
mapping(bytes32 => IRulesEngine) public nodeRules;
```


## Functions
### isAuthorised


```solidity
modifier isAuthorised(bytes32 node, address user, bytes[] memory blob);
```

### permissionedCaller


```solidity
modifier permissionedCaller();
```

### registeredNode


```solidity
modifier registeredNode(bytes32 node);
```

### constructor


```solidity
constructor(IENS _registry);
```

### setGateway

Change the address of the gateway which can register nodes

*Setting the gateway to address(0) will disable any project node registrations*


```solidity
function setGateway(address _gateway) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_gateway`|`address`|The new address|


### setProjectNode

Add a new project to the directory


```solidity
function setProjectNode(bytes32 node, IAuthoriser authoriser, IRulesEngine rules, bool enable)
    external
    permissionedCaller;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The project node that subdomains will be based on|
|`authoriser`|`IAuthoriser`|The authorisation contract|
|`rules`|`IRulesEngine`|The rules around availability, validity, and usage|
|`enable`|`bool`|Turn the project on or off|


### register

Register a subdomain under node


```solidity
function register(bytes32 node, string memory label, address owner, bytes[] memory blob)
    public
    registeredNode(node)
    isAuthorised(node, msg.sender, blob);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The project node to use|
|`label`|`string`|The subdomain text, eg the 'hopeless' in hopeless.abc.eth|
|`owner`|`address`|Who will own the subdomain|
|`blob`|`bytes[]`||


### valid

Check if a label is valid for a project


```solidity
function valid(bytes32 node, string memory label) public view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`node`|`bytes32`|The project node|
|`label`|`string`|The subdomain label to validate|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|bool True if the label is valid, according to the project rules, false otherwise|


### available


```solidity
function available(bytes32 node, string memory label) internal view returns (bool);
```

## Events
### SubnodeRegistered
A subnode has been registered


```solidity
event SubnodeRegistered(bytes32 indexed node, bytes32 indexed label, address owner, address registrant);
```

### ProjectStateChanged
A project has been enabled/disabled


```solidity
event ProjectStateChanged(bytes32 indexed node, address authoriser, address rules, bool enabled);
```
