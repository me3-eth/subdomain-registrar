# IENS
[Git Source](https://github.com/me3-eth/protocol/blob/7b584c2e2f000cf0ce4649d2bd0bc874fd19925a/src/Registrar.sol)


## Functions
### setSubnodeRecord


```solidity
function setSubnodeRecord(bytes32 node, bytes32 label, address owner, address resolver, uint64 ttl) external virtual;
```

### owner


```solidity
function owner(bytes32 node) external view returns (address);
```

## Events
### NewOwner

```solidity
event NewOwner(bytes32 indexed node, bytes32 indexed label, address owner);
```

