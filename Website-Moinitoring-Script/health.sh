#! /bin/bash

URL="https://www.linkedin.com"

LOG_DIR="$HOME/website_health_logs"

mkdir -p "$LOG_DIR"

TODAY=$(date +"%Y-%m-%d")

LOG_FILE="$LOG_DIR/health_log_$TODAY.log"

response=$(curl -o /dev/null -s -A "Mozilla/5.0" -w "%{http_code} %{time_total}" "$URL")

status_code=$(echo "$response" | awk '{print $1}')

response_time=$(echo "$response" | awk '{ print $2 }')

timestamp=$(date +"%Y-%m-%d %H:%M:%S")

echo "$timestamp | Status: $status_code | Response Time: ${response_time}s" >> "$LOG_FILE"
