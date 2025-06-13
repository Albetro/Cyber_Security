#!/bin/bash
# Send alert when load average exceeds threshold

THRESHOLD=1.5

load=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)
if (( $(echo "$load > $THRESHOLD" | bc -l) )); then
    echo "🚨 High load detected: $load" | mail -s "CPU Alert" you@example.com
fi
