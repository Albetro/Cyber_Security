#!/bin/bash
src="$HOME/Documents"
dest="$HOME/backups"
timestamp=$(date +%F_%T)
logfile="$dest/backup_log.txt"

mkdir -p "$dest"
tar -czf "$dest/backup_$timestamp.tar.gz" "$src" 2>>"$logfile"

if [ $? -eq 0 ]; then
  echo "[$timestamp] Backup succeeded." >> "$logfile"
else
  echo "[$timestamp] Backup failed." >> "$logfile"
fi
