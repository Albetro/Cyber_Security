#!/bin/bash
# Log all commands users run (audit alternative)

LOG_FILE="/var/log/cmdlog.log"
PROMPT_COMMAND='history 1 | { read x cmd; echo "$(date +%F\ %T) $(whoami): $cmd" >> '"$LOG_FILE"'; }'

echo "PROMPT_COMMAND=\"$PROMPT_COMMAND\"" >> /etc/profile
echo "✅ Command logging enabled system-wide."
