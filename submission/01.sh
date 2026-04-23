# What is the hash of block 243,833?
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblockhash 243833
