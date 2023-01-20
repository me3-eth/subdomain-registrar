# IENS
[Git Source](https://github.com/me3-eth/protocol/blob/cac16b9d508f5af9fbf4095cd2346a7a6400c5e8/src/Registrar.sol)


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

