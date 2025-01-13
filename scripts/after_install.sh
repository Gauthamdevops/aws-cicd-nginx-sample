#!/bin/bash
# after_install.sh

# Start Nginx if it's not running
if ! systemctl is-active --quiet nginx; then
    echo "Nginx is not running. Starting Nginx..."
    sudo systemctl start nginx
else
    echo "Nginx is already running."
fi

# Enable Nginx to start on boot
sudo systemctl enable nginx
