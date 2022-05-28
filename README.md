# me3 Protocol

Glossary:

* **Project**: an NFT project, we track their ENS node in our smart contracts (eg: pcc.eth)
* **Subdomain**: an ENS subnode attached to an associated Project node (eg: someone.pcc.eth)
* **Authoriser**: a contract that defines the authorisation rules for a project

## Deployments

* Registrar: `0x9f2daf90c4323b529c31a40520a5fa63eb601b84` on:
  * Rinkeby
* NftAuthoriser: `0x0c24293b6d874e830789ed0948bed9935d4a4fdb` on:
  * Rinkeby

## Project Controls

NFT projects have the following set of controls for subdomain registration:

* authorise which addresses can register a subdomain
* validate that a subdomain can be registered
* decide who the subdomain owner is (the project or the registrant)

## IAuthoriser

A generic interface for checking registration and editing authorisation. Implementers are passed the node, sender, and a data blob. The data blob structure is implementation specific.

The introduction of the data blob means a lot more checks are required on the implementer contract to validate authorisation in a safe way.

### Functions

#### `canRegister(bytes32,address,bytes[]) external view returns (bool)`

Parameters:

* `bytes32 node` - The project node (second-level) which the domain will be registered under. Useful if the authoriser contract is multi-tenant.
* `address sender` - The user that is requesting registration of the subdomain
* `bytes[] blob` - The implementation-specific data blob

## NFT Authoriser

### Features

Subdomains...

* can only be registered by an NFT token holder
* can only be edited by the current NFT holder
* are owned by the authoriser contract
* must be longer than 3 characters

### Limitations

* user who mints the subdomain does not own it
* transferring the related token Id transfers edit access to new token holder

### Functions

#### canRegister

Follows [IAuthoriser](#iauthoriser) interface.

Blob structure (in pseudocode):

```
[
  asBytes(tokenId)
]
```

Blob structure (in javascript):

```js
const tokenId = '3728' // most apis return a string
const blob = [
  BigNumber.from(tokenId).toHexString()
]
```

#### isLabelValid

#### labelTokenId

#### nft

Public variable, is the address of the NFT that this authoriser relies on.

## Registrar

### Functions

#### Register

The register reverts in the following cases:
* if a project has not yet been enabled
* if the project determines the registrant is not authorised
* if the subdomain is valid, according to the project

![registration flow](docs/registration-flow.png)
