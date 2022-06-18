include .env

all: test build

test:; forge test

build:; forge build

deploy-testnet: deploy-rinkeby-registrar

# Does not work yet because there is no official ENS on Kovan
#deploy-kovan:; forge create --rpc-url https://eth-kovan.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --private-key $(WALLET_PK) src/Renewal.sol:Renewal

deploy-rinkeby-registrar:; forge create --rpc-url https://eth-rinkeby.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --chain rinkeby --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e" --constructor-args "0xf6305c19e814d2a75429Fd637d01F7ee0E77d615" --verify --private-key $(WALLET_PK) src/Registrar.sol:Registrar

deploy-rinkeby-nftauthoriser:; forge create --rpc-url https://eth-rinkeby.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --chain rinkeby --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x7914a94a08e128a06cd68c8acf1d3e8dd84ca1c2" --verify --private-key $(WALLET_PK) src/NftAuthoriser.sol:NftAuthoriser
