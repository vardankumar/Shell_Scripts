#! /bin/bash

# Directory where logs are sorted
LOG_DIR="$HOME/website_health_logs"

#Get yesterday's date
YESTERDAY=$(date -d "yesterday" +"%Y-%m-%d")
YESTERDAY_LOG="$LOG_DIR/health_log_$YESTERDAY.log"
YESTERDAY_ARCHIVE="$LOG_DIR/health_log_$YESTERDAY.tar.gz"
ARCHIVE_HISTROY="$LOG_DIR/archive_history.log"

# Archive if not already archived
if [ -f "$YESTERDAY_LOG" ] && [ ! -f "$YESTERDAY_ARCHIVE" ]; then
	tar -czf "$YESTERDAY_ARCHIVE" "$YESTERDAY_LOG"
	rm "$YESTERDAY_LOG"
	echo "$(date) | Archived $YESTERDAY_LOG" >> "$ARCHIVE_HISTORY"
else 
	echo "$(date) | Nothing to archive or already archived" >> "$ARCHIVE_HISTORY"
