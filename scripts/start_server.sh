#!/bin/bash
set -e

cd /var/www/html

echo "Starting Node.js server..."

# Kill any existing process running on the same port (optional)
PID=$(lsof -t -i:3000)
if [ ! -z "$PID" ]; then
  echo "Stopping existing Node.js process on port 3000 (PID: $PID)..."
  kill -9 $PID
fi

# Start the Node.js application in the background
nohup node server.js > output.log 2>&1 &

echo "Server started successfully!"
