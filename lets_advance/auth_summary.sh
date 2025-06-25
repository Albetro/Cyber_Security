#!/bin/bash
# Forensics summary from auth.log

LOG="/var/log/auth.log"

echo "🛡️LOGIN SUMMARY (past 24h)"
grep "session opened for user" "$LOG" | tail -n 20

echo ""
echo " FAILED LOGIN ATTEMPTS"
grep "Failed password" "$LOG" | tail -n 20

echo ""
echo " SUDO USAGE"
grep "sudo" "$LOG" | tail -n 20
