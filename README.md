# me3 Subdomain Registrar

Allow users of your NFT community, DAO, or club to register subdomains and user profiles under your project's ENS name.

Glossary:

* **Project**: an NFT project, we track their ENS node in our smart contracts (eg: pcc.eth)
* **Subdomain**: an ENS subnode attached to an associated Project node (eg: someone.pcc.eth)
* **Authoriser**: a contract that defines the authorisation rules for a project

## Deployments

| Contract | Goerli | Mainnet |
| ---      | ---    | ---     |
|Registrar|`0x8EaE99Cdb7D8889e0c12d650De138983895C22F1`||
|Gateway Beta|`0x201C5AA9556fDf8D5f6cDa1C59735Dd7151EEcEf`||

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

