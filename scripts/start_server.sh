#!/bin/bash
set -e

cd /var/www/html

echo "Starting Node.js server..."

# Start the Node.js application in the background
node server.js

echo "Server started successfully!"
