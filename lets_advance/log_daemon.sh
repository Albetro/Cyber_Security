#!/bin/bash
# Daemon: Logs timestamp every minute to /var/log/mydaemon.log

LOGFILE="/var/log/mydaemon.log"
PIDFILE="/var/run/mydaemon.pid"

start() {
    if [ -f "$PIDFILE" ]; then
        echo "Daemon already running with PID $(cat $PIDFILE)"
        exit 1
    fi

    echo "Starting daemon..."
    (
        while true; do
            echo "$(date) - Daemon running..." >> "$LOGFILE"
            sleep 60
        done
    ) &
    echo $! > "$PIDFILE"
    echo "Daemon started with PID $!"
}

stop() {
    if [ ! -f "$PIDFILE" ]; then
        echo "No daemon running."
        exit 1
    fi
    PID=$(cat "$PIDFILE")
    kill "$PID" && rm "$PIDFILE"
    echo "Daemon stopped."
}

case "$1" in
    start) start ;;
    stop) stop ;;
    restart) stop; start ;;
    *) echo "Usage: $0 {start|stop|restart}" ;;
esac
