#!/bin/bash
# Clears logs to simulate anti-forensics (lab use only)

echo "Wiping syslogs and auth logs..."
truncate -s 0 /var/log/syslog /var/log/auth.log /var/log/messages 2>/dev/null
echo "Logs wiped"
