#!/bin/bash
# Requires an FTP server running on 10.11.0.123

FILE="$1"

echo "
open 10.11.0.123
user anonymous anonymous
put $FILE
bye
" | ftp -n
