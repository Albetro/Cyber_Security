#!/bin/bash
# Look for deleted binaries still running (indicative of fileless persistence)

echo "[*] Running deleted executables:"
lsof | grep '(deleted)' | grep -E 'exe|mem' | awk '{print $1, $2, $9}' | sort -u
