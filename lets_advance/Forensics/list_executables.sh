#!/bin/bash
# Forensics: Find potentially dangerous SUID binaries

echo "[*] SUID binaries on the system:"
find / -perm -4000 -type f 2>/dev/null
