#!/bin/bash
# Countdown with display

read -p "Set timer (in seconds): " SECONDS
while [ $SECONDS -gt 0 ]; do
    echo -ne "⏳ $SECONDS seconds remaining...\r"
    sleep 1
    ((SECONDS--))
done
echo -e "\n✅ Time's up!"
