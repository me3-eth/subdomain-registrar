# Utilities

Central location for shared functions in me3

## labelhash

```solidity
function labelhash(string label) internal pure returns (bytes32)
```

Hash a label for ENS use

| Name | Type | Description |
| ---- | ---- | ----------- |
| label | string | The 'oops' in 'oops.bob.eth', or the 'bob' in 'bob.eth' |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bytes32 | Hashed label |

## namehash

```solidity
function namehash(bytes32 node, bytes32 label) internal pure returns (bytes32)
```

Create a namehash, the combination of a namehashed node and a hashed label

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | Fully qualified, namehashed ENS name ('bob.eth') |
| label | bytes32 | The 'oops' in 'oops.bob.eth', or the 'bob' in 'bob.eth' |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bytes32 | Hashed ENS name |

