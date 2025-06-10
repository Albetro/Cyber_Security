#!/bin/bash
# Advanced: Real-time SSH brute force detection

LOG_FILE="/var/log/auth.log"
ALERT_THRESHOLD=5
EMAIL="you@example.com"
declare -A ATTEMPTS

tail -F "$LOG_FILE" | while read -r line; do
    if echo "$line" | grep -q "Failed password"; then
        IP=$(echo "$line" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')
        ((ATTEMPTS["$IP"]++))
        if [[ ${ATTEMPTS["$IP"]} -eq $ALERT_THRESHOLD ]]; then
            echo "[ALERT] $IP has ${ATTEMPTS["$IP"]} failed login attempts!" | mail -s "SSH Brute Force Alert" "$EMAIL"
        fi
    fi
done
