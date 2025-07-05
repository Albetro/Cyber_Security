#!/bin/bash
# Requires paste.rs or similar (https://paste.rs is a pastebin with curl)

FILE="$1"
echo " Uploading $FILE to paste.rs..."
curl -F "c=@$FILE" https://paste.rs
