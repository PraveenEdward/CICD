#!/bin/bash
set -e

echo "Stopping Node.js server..."

# Find process running on port 3000
PID=$(lsof -t -i:3000)

if [ -n "$PID" ]; then
  echo "Found Node.js process with PID: $PID"
  echo "Killing process..."
  kill -9 "$PID"
  echo "Node.js server stopped successfully!"
else
  echo "No Node.js process found running on port 3000."
fi

exit 0
