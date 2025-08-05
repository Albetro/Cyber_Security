#!/bin/bash
# Detect binaries in non-standard locations within the user's PATH

echo "[*] Searching for suspicious executables in PATH..."
IFS=':' read -ra DIRS <<< "$PATH"
for dir in "${DIRS[@]}"; do
  find "$dir" -maxdepth 1 -type f -executable -exec file {} \; 2>/dev/null | grep -v "/bin/"
done
