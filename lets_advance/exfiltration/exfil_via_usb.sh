#!/bin/bash
# Auto-copy sensitive files to first mounted USB drive

USB=$(lsblk -o MOUNTPOINT | grep -E '/media/|/mnt/' | head -n1)
FILE="$1"

if [[ ! -d "$USB" ]]; then
    echo "No USB drive found"
    exit 1
fi

cp "$FILE" "$USB"
echo "$FILE copied to $USB"
