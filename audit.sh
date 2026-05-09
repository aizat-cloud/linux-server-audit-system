#!/bin/bash
# Author: Khairul Aizat
# LinkedIn: www.linkedin.com/in/aizat-linux
# Project: LPI Capstone - Server Audit System
# Description: Automated server audit with hardware logging,
#              user enumeration, and gzipped backup archival.

BACKUP_DIR="/var/Company_Data/Secure_Backups"
LOG_FILE="$BACKUP_DIR/audit_report.txt"
DATE=$(date +%Y-%m-%d)

echo "--- STARTING SYSTEM AUDIT: $DATE ---" > $LOG_FILE
echo "[HARDWARE INFO]" >> $LOG_FILE
grep "model name" /proc/cpuinfo | head -n 1 | cut -d: -f2 >> $LOG_FILE

echo -e "\n[USER CHECK]" >> $LOG_FILE
grep "/bin/bash" /etc/passwd | cut -d: -f1 >> $LOG_FILE

tar -czf $BACKUP_DIR/backup_$DATE.tar.gz $LOG_FILE 2>/dev/null
echo "--- AUDIT COMPLETED ---" >> $LOG_FILE
