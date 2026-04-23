# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
prev_txid=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getrawtransaction "$txid" true | jq -r '.vin[0].txid')
prev_vout=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getrawtransaction "$txid" true | jq -r '.vin[0].vout')
input_value=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getrawtransaction "$prev_txid" true | jq -r --argjson vout "$prev_vout" '.vout[] | select(.n == $vout) | .value')
output_value=$(bitcoin-cli -conf="$root_dir/config/bitcoin.conf" -signet getrawtransaction "$txid" true | jq '[.vout[].value] | add')
jq -nr --arg in "$input_value" --arg out "$output_value" '((($in | tonumber) - ($out | tonumber)) * 100000000 | round)'
