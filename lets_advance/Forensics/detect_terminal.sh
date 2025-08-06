#!/bin/bash
# Identify suspicious shells running without a controlling terminal

echo "[*] Suspicious shells without TTY:"
ps -eo pid,ppid,tty,cmd | grep -E 'bash|sh|zsh' | awk '$3=="?" {print}'
