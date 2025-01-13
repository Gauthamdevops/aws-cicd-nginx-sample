#!/bin/bash

# Log file for troubleshooting
LOG_FILE="/var/log/nginx/start_nginx.log"

# Start Nginx and log the output
echo "Starting Nginx..." >> $LOG_FILE
sudo systemctl start nginx >> $LOG_FILE 2>&1

# Check if Nginx started successfully
if systemctl is-active --quiet nginx; then
    echo "Nginx started successfully" >> $LOG_FILE
else
    echo "Failed to start Nginx" >> $LOG_FILE
    # Log detailed status and journal logs
    echo "Nginx service status:" >> $LOG_FILE
    sudo systemctl status nginx.service >> $LOG_FILE 2>&1
    echo "Nginx service logs:" >> $LOG_FILE
    sudo journalctl -xeu nginx.service >> $LOG_FILE 2>&1
    exit 1
fi

echo "Nginx started successfully" >> $LOG_FILE

