# me3 Subdomain Registrar

Allow users of your NFT community, DAO, or club to register subdomains and user profiles under your project's ENS name.

Glossary:

* **Project**: an NFT project, we track their ENS node in our smart contracts (eg: pcc.eth)
* **Subdomain**: an ENS subnode attached to an associated Project node (eg: someone.pcc.eth)
* **Authoriser**: a contract that defines the authorisation rules for a project

## Deployments

| Contract     | Address                                      |
| ---          | ---                                          |
| Registrar    | `0x8E424e5B34C676E5BE793d82E3fAA75B26693264` |
| Gateway Beta | `0x809f89b26347156ff3f8f2842780ddafb1c4acde` |

## Project Controls

NFT projects have the following set of controls for subdomain registration:

* authorise which addresses can register a subdomain
* validate that a subdomain can be registered
* decide who the subdomain owner is (the project or the registrant)

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

