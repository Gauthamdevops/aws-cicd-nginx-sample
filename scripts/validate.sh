#!/bin/bash
# validate.sh

# Check if Nginx is running
if systemctl is-active --quiet nginx; then
    echo "Nginx is running successfully."
    exit 0
else
    echo "Nginx is not running. Deployment failed."
    exit 1
fi
