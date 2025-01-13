#!/bin/bash
curl -f http://localhost > /dev/null
if [ $? -ne 0 ]; then
  echo "Nginx is not running!"
  exit 1
else
  echo "Nginx is running!"
fi

