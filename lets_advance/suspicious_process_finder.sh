#!/bin/bash
# Forensics: Detects processes running from suspicious directories

echo "🔍 Scanning processes for suspicious execution paths..."

ps aux | grep -E '/tmp/|/dev/shm/' | grep -v grep | while read -r line; do
    echo "[WARNING] Suspicious process: $line"
done
