#!/bin/bash
service="apache2"
if ! systemctl is-active --quiet $service; then
  echo "$service is down. Restarting..."
  sudo systemctl start $service
fi
