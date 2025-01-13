#!/bin/bash
# before_install.sh

# Update the system
sudo yum update -y

# Install Nginx if not already installed
if ! command -v nginx > /dev/null 2>&1; then
    echo "Nginx not found. Installing..."
    sudo amazon-linux-extras enable nginx1.12
    sudo amazon-linux-extras install nginx1.12 -y
    sudo yum install nginx -y
else
    echo "Nginx is already installed."
fi

# Ensure Nginx service is enabled and running
echo "Ensuring Nginx is running..."
sudo systemctl enable nginx
sudo systemctl start nginx

# Define the Nginx document root and backup directory
HTML_DIR="/usr/share/nginx/html"
BACKUP_DIR="/usr/share/nginx/html_backup_$(date +%Y%m%d_%H%M%S)"

# Backup existing files if the directory exists
echo "Checking if $HTML_DIR exists..."
if [ -d "$HTML_DIR" ]; then
    echo "Backing up existing files to $BACKUP_DIR"
    sudo mv "$HTML_DIR" "$BACKUP_DIR"
else
    echo "$HTML_DIR does not exist. No backup needed."
fi

# Create a fresh directory for deployment
echo "Creating a fresh directory at $HTML_DIR"
sudo mkdir -p "$HTML_DIR"
sudo chmod 755 "$HTML_DIR"

echo "BeforeInstall script completed."
