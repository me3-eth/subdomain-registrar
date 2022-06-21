# IRegistrar

Define the minimum methods needed for a subdomain registrar

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
function valid(bytes32 node, string label) external view returns (bool)
```

Check if a label is valid for a project

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The project node |
| label | string | The subdomain label to validate |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if the label is valid, according to the project rules, false otherwise |

## setProjectNode

```solidity
function setProjectNode(bytes32 node, contract IAuthoriser authoriser, contract IRulesEngine rules, bool enable) external
```

Register a project as a subdomain provider

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | The fully qualified, namehashed ENS name |
| authoriser | contract IAuthoriser | The contract that will perform authorisation |
| rules | contract IRulesEngine | The contract that will provide rules and validation |
| enable | bool | Allow project auth and rules to run |

