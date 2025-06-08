#!/bin/bash
zipfile="secret.zip"
wordlist="rockyou.txt"

while read -r password; do
  unzip -P "$password" -t "$zipfile" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "[+] Password found: $password"
    break
  fi
done < "$wordlist"
