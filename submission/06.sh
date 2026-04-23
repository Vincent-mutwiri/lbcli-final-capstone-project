# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblock "$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblockhash 243821)" 2 | jq -r '.tx[] | select(any(.vin[]?; .sequence < 4294967294)) | .txid'
