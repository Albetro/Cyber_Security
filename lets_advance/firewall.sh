#!/bin/bash
# Advanced: Auto ban IPs with brute force behavior

LOG="/var/log/auth.log"
THRESHOLD=10

awk '/Failed password/ { print $(NF-3) }' "$LOG" | sort | uniq -c | while read count ip; do
    if [ "$count" -gt "$THRESHOLD" ]; then
        echo "🚫 Blocking $ip ($count attempts)"
        iptables -A INPUT -s "$ip" -j DROP
    fi
done
