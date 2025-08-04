#!/bin/bash
# List all cron jobs for all users

echo "[*] System-wide cron jobs:"
cat /etc/crontab
echo "[*] User-specific cron jobs:"
ls -la /var/spool/cron/crontabs/
for user in $(cut -f1 -d: /etc/passwd); do
  crontab -u $user -l 2>/dev/null && echo "--- $user ---"
done
