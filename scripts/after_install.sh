#!/bin/bash
# Example: Check if nginx is installed or configure settings
if ! command -v nginx &> /dev/null
then
    yum install -y nginx
fi

