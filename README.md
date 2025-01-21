# Log Backup Script

This repository contains a script for backing up MongoDB log files. The script is designed to:

1. Backup MongoDB logs to a designated directory with a timestamp.
2. Truncate the original log file after backup.
3. Delete log backups older than 7 days.

## Setup

### 1. Create the Backup Directory

Before using the script, create a backup directory for storing the log backups:

```bash
sudo mkdir -p /var/log/mongodb/log_backups
