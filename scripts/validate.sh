#!/bin/bash
# validate.sh

# Function to check if a command was successful
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting script."
        exit 1
    fi
}

# Check if Nginx is running
echo "Checking if Nginx is running..."

if systemctl is-active --quiet nginx; then
    echo "Nginx is running successfully."
    exit 0
else
    echo "Nginx is not running."

    # Attempt to start Nginx
    echo "Attempting to start Nginx..."
    sudo systemctl start nginx
    check_command "Starting Nginx"

    # Check again if Nginx is running after attempting to start it
    if systemctl is-active --quiet nginx; then
        echo "Nginx started successfully."
        exit 0
    else
        echo "Failed to start Nginx. Deployment failed."
        exit 1
    fi
fi

