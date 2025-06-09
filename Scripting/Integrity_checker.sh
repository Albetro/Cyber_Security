#!/bin/bash
directory="./files"
hashfile="checksums.sha256"

# Create or update checksums
if [ "$1" == "update" ]; then
  sha256sum "$directory"/* > "$hashfile"
  echo "Checksums updated."
else
  sha256sum -c "$hashfile"
fi
