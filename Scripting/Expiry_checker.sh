#!/bin/bash
domain="example.com"
whois "$domain" | grep -i "expiry\|expir\|renewal"
