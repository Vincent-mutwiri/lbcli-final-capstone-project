# How many new outputs were created by block 243,825?
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
block_hash=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblockhash 243825)
bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblock "$block_hash" 2 | jq '[.tx[].vout | length] | add'
