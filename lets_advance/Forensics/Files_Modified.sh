#!/bin/bash
# Find suspiciously recent file modifications

DIR="/var/www/html"
MINUTES=60
echo "[*] Files modified in the last $MINUTES minutes:"
find "$DIR" -type f -mmin -$MINUTES -exec ls -lh {} \;
