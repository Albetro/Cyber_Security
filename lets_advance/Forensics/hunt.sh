#!/bin/bash
# List all hidden files and folders recursively

DIR=${1:-/home}
echo "[*] Hidden files in $DIR:"
find "$DIR" -name ".*" -type f -ls 2>/dev/null
find "$DIR" -name ".*" -type d -ls 2>/dev/null
