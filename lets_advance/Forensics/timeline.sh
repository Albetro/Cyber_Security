#!/bin/bash
# Generate a timeline of file changes

TARGET="/home/user"
echo "[*] Creating timeline for $TARGET"
find "$TARGET" -type f -printf '%TY-%Tm-%Td %TH:%TM:%TS %p\n' | sort > timeline.txt
