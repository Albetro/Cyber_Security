#!/bin/bash
# ⚠️Simple fake SSH honeypot — use in isolated test VM only

PORT=2222
LOGFILE="/var/log/fake_ssh_honeypot.log"

echo " Starting fake SSH honeypot on port $PORT..."
while true; do
    echo -e "220 Fake SSH Server Ready" | nc -l -p "$PORT" -v >> "$LOGFILE" 2>&1
done
