#!/bin/bash
# Rotating backup system

SOURCE="/etc"
DEST="/backups/etc"
DATE=$(date +%F)
BACKUP_FILE="$DEST/etc-backup-$DATE.tar.gz"

mkdir -p "$DEST"
tar -czf "$BACKUP_FILE" "$SOURCE"

# Cleanup old backups (older than 7 days)
find "$DEST" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \;
