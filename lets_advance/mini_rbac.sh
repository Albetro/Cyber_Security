#!/bin/bash
# Restricted mini-shell environment

WHITELIST=("ls" "pwd" "whoami" "date")
while true; do
    read -p "rbash> " cmd
    CMD_NAME=$(echo "$cmd" | awk '{print $1}')
    
    if [[ " ${WHITELIST[*]} " == *" $CMD_NAME "* ]]; then
        eval "$cmd"
    else
        echo "❌ Command '$CMD_NAME' not allowed."
    fi
done
