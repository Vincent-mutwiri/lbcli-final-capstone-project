# Which tx in block 216,351 spends the coinbase output of block 216,128?
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
coinbase_txid=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblock "$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblockhash 216128)" 2 | jq -r '.tx[0].txid')
bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblock "$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblockhash 216351)" 2 | jq -r --arg coinbase_txid "$coinbase_txid" '.tx[] | select(.vin[]?.txid == $coinbase_txid) | .txid'
