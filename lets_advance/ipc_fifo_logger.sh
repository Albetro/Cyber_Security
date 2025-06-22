#!/bin/bash
# IPC: Logger listens for messages via named pipe

PIPE="/tmp/event_pipe"
LOG="/tmp/ipc_event_log.txt"

# Create pipe if it doesn't exist
[[ -p $PIPE ]] || mkfifo $PIPE

echo "Listening for messages on $PIPE..."

while read line < $PIPE; do
    echo "$(date): $line" >> "$LOG"
done
