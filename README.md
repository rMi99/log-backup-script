
# Log Backup Script

This script backs up MongoDB logs, truncates the original log, and deletes backups older than 7 days.

## Setup

### 1. Create Backup Directory

```bash
sudo mkdir -p /var/log/mongodb/log_backups
```

### 2. Create the Script

Create the script at `/path/to/your/log_backup_script.sh`:

```bash
#!/bin/bash
LOG_FILE="/var/log/mongodb/mongod.log"
BACKUP_DIR="/var/log/mongodb/log_backups"
BACKUP_FILE="${BACKUP_DIR}/mongod_$(date +\%F).log"
cp $LOG_FILE $BACKUP_FILE
sudo truncate -s 0 $LOG_FILE
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;
```

### 3. Set Permissions

Make the script executable:

```bash
sudo chmod +x /path/to/your/log_backup_script.sh
```

### 4. Schedule with Cron

Edit the crontab:

```bash
crontab -e
```

Add this line to run daily at midnight:

```bash
0 0 * * * /path/to/your/log_backup_script.sh
```

### 5. Verify Cron Job

List cron jobs:

```bash
crontab -l
```

## Notes

- Adjust paths as needed.
- Deletes backups older than 7 days.

## License

MIT License
```

This version provides a concise overview of the setup and cron job configuration.
