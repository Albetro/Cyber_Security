#!/bin/bash
cut -d: -f1 /etc/passwd | while read user; do
  chage -l "$user" 2>/dev/null | grep "Account expires"
done
