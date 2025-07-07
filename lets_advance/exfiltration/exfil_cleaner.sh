#!/bin/bash
# Deletes bash history and clears logs (use with caution in labs)

> ~/.bash_history
history -c

find /var/log -type f -exec truncate -s 0 {} \;
