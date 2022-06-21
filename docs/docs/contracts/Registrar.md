# Registrar

Provides third-party projects with a common subdomain registration function

_0.1.0_

## ens

```solidity
contract ENS ens
```

## fallbackResolver

```solidity
address fallbackResolver
```

Address of the default resolver used when registering a subdomain

## nodeEnabled

```solidity
mapping(bytes32 => bool) nodeEnabled
```

Lookup enabled/disabled state by project node

## nodeAuthorisers

```solidity
mapping(bytes32 => contract IAuthoriser) nodeAuthorisers
```

Lookup authoriser contract by project node

## nodeRules

```solidity
mapping(bytes32 => contract IRulesEngine) nodeRules
```

Lookup rules contract by project node

## FallbackResolverUpdated

```solidity
event FallbackResolverUpdated(address resolverAddr)
```

The default resolver has changed

| Name | Type | Description |
| ---- | ---- | ----------- |
| resolverAddr | address | The new address of the resolver |

## ProjectStateChanged

```solidity
event ProjectStateChanged(bytes32 node, address authoriser, address rules, bool enabled)
```

A project has been enabled/disabled

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The fully qualified, namehashed ENS name for the project |
| authoriser | address | The address of the authorising contract |
| rules | address | The address of the rules engine contract |
| enabled | bool | True if the project is now enabled, false if now disabled |

## SubnodeRegistered

```solidity
event SubnodeRegistered(bytes32 node, bytes32 label, address owner, address registrant)
```

A subnode has been registered

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The fully qualified, namehashed ENS name for the project |
| label | bytes32 | The registered label as keccack256 |
| owner | address | The registered owner |
| registrant | address | The address that requested registration |

## isAuthorised

```solidity
modifier isAuthorised(bytes32 node, address user, bytes authData)
```

## registeredNode

```solidity
modifier registeredNode(bytes32 node)
```

## constructor

```solidity
constructor(contract ENS _registry, address _resolver) public
```

## setProjectNode

```solidity
function setProjectNode(bytes32 node, contract IAuthoriser authoriser, contract IRulesEngine rules, bool enable) external
```

Add a new project to the directory

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The project node that subdomains will be based on |
| authoriser | contract IAuthoriser | The authorisation contract |
| rules | contract IRulesEngine | The rules around availability, validity, and usage |
| enable | bool | Turn the project on or off |

## changeFallbackResolver

```solidity
function changeFallbackResolver(address newResolver) external
```

Change the default resolver to a new contract

| Name | Type | Description |
| ---- | ---- | ----------- |
| newResolver | address | Address of the new resolver contract |

## register

```solidity
function register(bytes32 node, string label, bytes authData) external
```

Register a subdomain under node

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The project node to use |
| label | string | The subdomain text, eg the 'hopeless' in hopeless.abc.eth |
| authData | bytes | Additional data to help the authoriser authorise |

## valid

```solidity
function valid(bytes32 node, string label) public view returns (bool)
```

Check if a label is valid for a project

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The project node |
| label | string | The subdomain label to validate |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if the label is valid, according to the project rules, false otherwise |

## available

```solidity
function available(bytes32 node, string label) internal view returns (bool)
```

