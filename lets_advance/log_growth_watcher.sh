#!/bin/bash
# Monitor if log grows unusually fast (e.g. in a DDoS attack)

LOG="/var/log/nginx/access.log"
SIZE_BEFORE=$(stat -c%s "$LOG")
sleep 60
SIZE_AFTER=$(stat -c%s "$LOG")

DIFF=$((SIZE_AFTER - SIZE_BEFORE))

if [ "$DIFF" -gt 1000000 ]; then
    echo "🚨 Log file grew by $DIFF bytes in 60s!" | mail -s "Log Growth Alert" you@example.com
fi
