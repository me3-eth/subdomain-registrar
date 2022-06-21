# IRulesEngine

Functions that a RulesEngine contract should support

## isLabelValid

```solidity
function isLabelValid(bytes32 node, string label) external view returns (bool)
```

Determine if a label meets a projects minimum requirements

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | Fully qualified, namehashed ENS name |
| label | string | The 'best' in 'best.bob.eth' |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if label is valid, false otherwise |

## subnodeOwner

```solidity
function subnodeOwner(address registrant) external view returns (address)
```

Determine who should own the subnode

| Name | Type | Description |
| ---- | ---- | ----------- |
| registrant | address | The address that is registereing a subnode |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | address | The address that should own the subnode |

## profileResolver

```solidity
function profileResolver(bytes32 node, string label, address registrant) external view returns (address)
```

Determine the resolver contract to use for project profiles

_If this returns address(0x0), the Registrar will use its default resolver_

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | Fully qualified, namehashed ENS name |
| label | string | The 'best' in 'best.bob.eth' |
| registrant | address | The address that is registereing a subnode |

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | address | The address of the resolver |

