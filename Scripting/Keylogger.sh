#!/bin/bash
logfile="keystrokes.log"
xinput --list
read -p "Enter device ID: " id
xinput test "$id" | grep --line-buffered "key press" >> "$logfile"
