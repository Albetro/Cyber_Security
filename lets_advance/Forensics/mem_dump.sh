#!/bin/bash
# Extract strings from a memory dump and search for credentials

DUMP="mem.raw"
echo "[*] Searching for potential passwords in $DUMP"
strings "$DUMP" | grep -iE "password|passwd|pwd|key|secret" | sort -u
