#!/bin/bash
# before_install.sh

# Update the system
sudo yum update -y

# Install Nginx if not already installed
if ! command -v nginx > /dev/null 2>&1; then
    echo "Nginx not found. Installing..."
    sudo yum install nginx -y
else
    echo "Nginx is already installed."
fi

# Remove the existing index.html before the deployment
if [ -f /var/www/html/index.html ]; then
  rm -f /var/www/html/index.html
fi

