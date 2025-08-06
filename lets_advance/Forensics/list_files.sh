#!/bin/bash
# Find files that anyone can write to, but are not owned by root

echo "[*] World-writable, non-root owned files:"
find / -type f -perm -0002 ! -user root 2>/dev/null
