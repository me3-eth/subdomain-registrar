include .env

all: test build

test:; forge test

build:; forge build

deploy-testnet: deploy-ropsten-registrar

# Does not work yet because there is no official ENS on Kovan
#deploy-kovan:; forge create --rpc-url https://eth-kovan.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --private-key $(WALLET_PK) src/Renewal.sol:Renewal

deploy-ropsten-registrar:; forge create --rpc-url https://eth-ropsten.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --constructor-args "0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e" "0x42D63ae25990889E35F215bC95884039Ba354115" --private-key $(WALLET_PK) src/Registrar.sol:Registrar
