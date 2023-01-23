include .env

all: test build

test:; forge test

build:; forge build

deploy-registrar-goerli:; forge create --chain goerli --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args $(ENS_REGISTRY) --verify --private-key $(PROTOCOL_WALLET_PK) src/Registrar.sol:Registrar

deploy-nftauth-goerli:; forge create --chain goerli --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x854431F73692BA4153e18D432ee2E96CCfaa434A" --verify --private-key $(NFTAUTH_WALLET_PK) src/NftAuthoriser.sol:NftAuthoriser

deploy-gatewaybeta-goerli:; forge create --chain goerli --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x8EaE99Cdb7D8889e0c12d650De138983895C22F1" --verify --private-key $(PROTOCOL_WALLET_PK) src/GatewayBeta.sol:GatewayBeta
