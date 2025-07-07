#! /bin/bash

# Source directory to backup
source_dir="/d/Vardan/Devops/Devops Shack/shell-scripts/Backup-script/data"

#Backup destination directory
backup_dir="/d/Vardan/Devops/Devops Shack/shell-scripts/Backup-script/backup-data"

# Backup filename with date
backup_filename="backup_$(date +%Y%m%d%H%M%S).tar.gz"

# Create the backup directory if it does not exist
mkdir -p "$backup_dir"

# Create the backup using tar
tar -cvzf "$backup_dir/$backup_filename" "$source_dir"

# Check if the backup was successful
if [ $? -eq 0 ]; then
	echo "Backup successful: $backup_filename created in $backup_dir"
else
	echo "Backup failed"
fi
