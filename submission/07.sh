# what is the coinbase tx in this block 243,834
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblock "$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblockhash 243834)" 2 | jq -r '.tx[0].txid'
