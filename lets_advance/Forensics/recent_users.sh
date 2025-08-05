#!/bin/bash
# Parse /etc/passwd to find accounts created in the last 24 hours

echo "[*] Recently created users:"
awk -F: '{print $1, $3, $6}' /etc/passwd | while read user uid home; do
  if [[ "$uid" -ge 1000 && -d "$home" ]]; then
    if [[ $(find "$home" -type f -cmin -1440 2>/dev/null | wc -l) -gt 0 ]]; then
      echo "$user might be newly created (recent home dir activity)"
    fi
  fi
done
