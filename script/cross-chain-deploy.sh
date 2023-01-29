#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

function get_nonce () {
	tcount=$(curl --no-progress-meter --request POST \
		--url $1 \
		--header 'accept: application/json' \
		--header 'content-type: application/json' \
		--data '{
		"id": 1,
		"jsonrpc": "2.0",
		"params": [
			"0x11Bd8dd31DDFD4dc184576065b27d4052DeF0224",
			"latest"
		],
		"method": "eth_getTransactionCount"
		}')

	echo $tcount | jq '.result'
}

# load environment
. "$parent_path/../.env"

chains=("$GOERLI_RPC_URL" "$MAINNET_RPC_URL")
nonces=()
for chain in ${chains[@]}; do
  nonces+=($(get_nonce $chain))
done

# compare nonces across chains and error if mismatch
baseNonce=${nonces[0]}
for nonce in ${nonces[@]}; do
  if [ "$baseNonce" != "$nonce" ]; then
    echo "Nonces do not match: $baseNonce and $nonces"
    exit 1
  fi
done

baseNonce=${baseNonce:3:-1}

# run script with matching nonce for affected chains
for chain in ${chains[@]}; do
  forge script \
    --rpc-url $chain \
    --skip-simulation \
    --gas-estimate-multiplier 250 \
    --with-gas-price 13000000000 \
    --broadcast \
    --verify \
    -vvvv \
    --sig "run(uint64)" \
    script/DeployProtocolBeta.s.sol:DeployProtocolBeta $((16#$baseNonce + 1))
done
