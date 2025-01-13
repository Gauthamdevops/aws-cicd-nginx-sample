#!/bin/bash

LOG_FILE="/var/log/nginx/start_nginx.log"

# Log function
log() {
    echo "$(date) - $1" >> $LOG_FILE
}

log "Starting Nginx..."

# Ensure that Nginx is not already running
if systemctl is-active --quiet nginx; then
    log "Nginx is already running."
    exit 0
fi

# Try to start Nginx
sudo systemctl start nginx
if [ $? -eq 0 ]; then
    log "Nginx started successfully."
else
    log "Failed to start Nginx."
    log "Checking Nginx status..."
    sudo systemctl status nginx.service >> $LOG_FILE 2>&1
    log "Checking Nginx logs..."
    sudo journalctl -xeu nginx.service >> $LOG_FILE 2>&1
    exit 1
fi

log "Nginx started successfully."

