# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
block_hash=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getrawtransaction 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb true | jq -r '.blockhash')
bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getblock "$block_hash" | jq -r '.height'
