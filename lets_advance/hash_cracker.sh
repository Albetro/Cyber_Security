#!/bin/bash
# Hybrid tool that calls Python for brute-forcing an MD5 hash

HASH="$1"

if [[ -z "$HASH" ]]; then
    echo "Usage: $0 <md5_hash>"
    exit 1
fi

python3 crack.py "$HASH"
