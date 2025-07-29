#!/bin/bash
# Change system hostname to contain sensitive short value

HOST="id-$(id -u)-$(whoami)"
hostname "$HOST"
