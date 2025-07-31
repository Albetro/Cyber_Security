#!/bin/bash
# Forensic script to extract failed SSH login attempts from syslog

LOGFILE="/var/log/auth.log"
echo "[*] Failed SSH login attempts:"
grep "Failed password" "$LOGFILE" | awk '{print $1, $2, $3, $11}' | sort | uniq -c | sort -nr
