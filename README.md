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

* [authorise](#authorisation) which addresses can register a subdomain
* validate that a subdomain can be registered
* decide who the subdomain owner is (the project or the registrant)

## Authorisation

There are two avenues of authorisation that a contract user can follow: registration and editing.

Any project is able to create their own authorisation contract using the `IAuthoriser` interface:

```solidity
interface IAuthoriser {
    function canRegister(
        bytes32 node,
        address sender,
        bytes memory blob
    ) external view returns (bool);
    
    function canEdit(
        bytes32 node,
        address sender,
        bytes memory blob
    ) external view returns (bool);
}
```

### Parameters

The authorisation functions take the same inputs but are split for more fine-grained
authorisation logic.

| Param               | Description                                                                           | Notes                                                                                               |
| ---                 | ---                                                                                   | ---                                                                                                 |
| `bytes32 node`      | The fully qualified ENS name, namehashed                                              | In Javascript, the value of this call: `ethers.utils.namehash('someone.somewhere.eth')`             |
| `address sender`    | The `msg.sender` for `Registrar.register`                                             |                                                                                                     |
| `bytes memory blob` | Additional data for authorisation, defined by the contract implementing `IAuthoriser` | Developer should perform a lot of saftey checks so that users do not pass arbitrary data for access |

### Sample authorisation contract via `NftAuthoriser`

We provide a simple authorisation contract for NFT projects. The contract checks
for two things:

* Was the `tokenId` passed in the `blob`? This requires the `tokenId` to be non-zero
* Is the token currently owned by the `sender`?

If either condition fails, then authorisation fails.

## Registrar

### Functions

#### Register

The register reverts in the following cases:
* if a project has not yet been enabled
* if the project determines the registrant is not authorised
* if the subdomain is valid, according to the project

![registration flow](docs/registration-flow.png)
