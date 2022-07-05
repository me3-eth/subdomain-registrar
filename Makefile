include .env

all: test build

test:; forge test

build:; forge build

deploy-registrar-testnet: deploy-rinkeby-registrar deploy-goerli-registrar

deploy-nftauthoriser-testnet: deploy-rinkeby-nftauthoriser deploy-goerli-nftauthoriser

# Does not work yet because there is no official ENS on Kovan
#deploy-kovan:; forge create --rpc-url https://eth-kovan.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --private-key $(WALLET_PK) src/Renewal.sol:Renewal

deploy-rinkeby-registrar:; forge create --rpc-url https://eth-rinkeby.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --chain rinkeby --nonce 5 --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e" --constructor-args "0xf6305c19e814d2a75429Fd637d01F7ee0E77d615" --verify --private-key $(PROTOCOL_WALLET_PK) src/Registrar.sol:Registrar

deploy-goerli-registrar:; forge create --rpc-url https://eth-goerli.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --chain goerli --nonce 5 --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e" --constructor-args "0x4B1488B7a6B320d2D721406204aBc3eeAa9AD329" --verify --private-key $(PROTOCOL_WALLET_PK) src/Registrar.sol:Registrar

deploy-rinkeby-nftauthoriser:; forge create --rpc-url https://eth-rinkeby.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --chain rinkeby --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0x7914a94a08e128a06cd68c8acf1d3e8dd84ca1c2" --constructor-args "0x0000000000000000000000000000000000000000" --verify --private-key $(NFTAUTH_WALLET_PK) src/NftAuthoriser.sol:NftAuthoriser

deploy-goerli-nftauthoriser:; forge create --rpc-url https://eth-goerli.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --chain goerli --etherscan-api-key $(ETHERSCAN_API_KEY) --constructor-args "0xa511759401e3d0318669c53e726b1c59df2dfa4d" --constructor-args "0x0000000000000000000000000000000000000000" --verify --private-key $(NFTAUTH_WALLET_PK) src/NftAuthoriser.sol:NftAuthoriser

# Gas estimation only, until we figure out keeping the same nonce across networks
script-deploy-registrar:; forge script --rpc-url https://eth-goerli.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --private-key $(NFTAUTH_WALLET_PK) -vvvv --sig "run(address)" script/DeployProtocol.s.sol "0x4B1488B7a6B320d2D721406204aBc3eeAa9AD329"

script-deploy-onboard:; forge script --rpc-url https://eth-goerli.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --private-key $(NFTAUTH_WALLET_PK) -vvvv --broadcast --sig "run(address,bytes32,address)" script/DeployNftAuthoriser.s.sol 0x2be870ce516679332f7c1e58c7dd1c1663d1a046 0x138e2592a3674bb8b32cb6975df6d50a1607cf343df5cc1517342b0f86848124 0x9fef5b1868de0c511121a3c354c28e2b741eb101

mythx-submit:; mythx --api-key $(MYTHX_API_KEY) analyze
