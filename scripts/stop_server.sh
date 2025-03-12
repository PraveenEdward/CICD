#!/bin/bash
set -e

echo "Stopping Node.js server..."

# Find and kill the process running on port 3000
PID=$(lsof -t -i:3000)

if [ ! -z "$PID" ]; then
  echo "Killing process with PID: $PID"
  kill -9 $PID
  echo "Node.js server stopped successfully!"
else
  echo "No Node.js process found running on port 3000."
fi