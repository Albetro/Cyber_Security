#!/bin/bash
# Honeypot: Detects suspicious syslog-like messages (log injection attempts)

LOGFILE="/var/log/syslog"
TRAPLOG="/var/log/log_injection_attempts.log"

echo "Monitoring $LOGFILE for suspicious log injection patterns..."

tail -F "$LOGFILE" | while read -r line; do
    if echo "$line" | grep -E 'Accepted password.*root|bash: .*command not found|; rm -rf'; then
        echo "[ALERT] $(date) Suspicious log entry: $line" >> "$TRAPLOG"
    fi
done
