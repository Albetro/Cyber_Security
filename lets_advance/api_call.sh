#!/bin/bash
# Advanced: CVE Fetcher using API

API_URL="https://services.nvd.nist.gov/rest/json/cves/2.0?resultsPerPage=5"

curl -s "$API_URL" | jq '.vulnerabilities[].cve.id'
