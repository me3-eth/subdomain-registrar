# IAuthoriser

Defines the API which a valid Authorising contract must meet

## canRegister

```solidity
function canRegister(bytes32 node, address registrant, bytes authData) external view returns (bool)
```

Determine if a node can be registered by a sender

_See example for authData packing_

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | Fully qualified, namehashed ENS name |
| registrant | address | Address of the user who is attempting to register |
| authData | bytes | Additional data used for authorising the request |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if the sender can register, false otherwise |

## canEdit

```solidity
function canEdit(bytes32 node, address registrant, bytes authData) external view returns (bool)
```

Determine if a node can be edited by sender

_See example for authData packing_

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | Fully qualified, namehashed ENS name |
| registrant | address | Address of the user who is attempting to register |
| authData | bytes | Additional data used for authorising the request |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if the sender can edit, false otherwise |

