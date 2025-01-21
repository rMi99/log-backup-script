#!/bin/bash

LOG_FILE="/var/log/mongodb/mongod.log"
BACKUP_DIR="/var/log/mongodb/log_backups"
BACKUP_FILE="${BACKUP_DIR}/mongod_$(date +\%F).log"

cp $LOG_FILE $BACKUP_FILE

sudo truncate -s 0 $LOG_FILE

# Delete log files older than 7 days
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;
