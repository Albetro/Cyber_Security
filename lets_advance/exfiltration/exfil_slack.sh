#!/bin/bash
# Send file contents to a Slack webhook

WEBHOOK_URL="https://hooks.slack.com/services/TXXXX/BXXXX/XXXXXXXX"
FILE="$1"

if [[ ! -f "$FILE" ]]; then
    echo "File not found: $FILE"
    exit 1
fi

CONTENT=$(cat "$FILE")

curl -X POST -H 'Content-type: application/json' \
    --data "{\"text\":\"$(echo "$CONTENT" | head -n 20)\"}" \
    "$WEBHOOK_URL"
