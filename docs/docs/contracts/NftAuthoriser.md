# NftAuthoriser

Determine if a node can be registered or edited using holders of an NFT

## nft

```solidity
contract IERC721 nft
```

The NFT that is providing ownership details

## resolver

```solidity
address resolver
```

The current profile resolver

## constructor

```solidity
constructor(address _nft, address _resolver) public
```

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

## isLabelValid

```solidity
function isLabelValid(bytes32 node, string label) external pure returns (bool isValid)
```

Make sure label is at least four characters long, emojis supported

| Name | Type | Description |
| ---- | ---- | ----------- |
| node | bytes32 | Unused in this implementation |
| label | string |  |

| Name | Type | Description |
| ---- | ---- | ----------- |
| isValid | bool | True if label is valid, false otherwise |

## subnodeOwner

```solidity
function subnodeOwner(address registrant) external view returns (address)
```

Determine who should own the subnode

_The registrant is always the owner_

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

