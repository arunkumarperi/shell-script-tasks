#!/bin/bash

# Check if the directory is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

# Set the directory
DIR="$1"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 1
fi

# Navigate to the directory
cd "$DIR" || exit

# Create a tar.gz file with the current date
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
TAR_FILE="logs_$TIMESTAMP.tar.gz"

# Compress .log files and remove original files if compression is successful
if tar -czf "$TAR_FILE" *.log; then
    echo "Successfully compressed .log files into $TAR_FILE."
    rm -f *.log
    echo "Original .log files have been removed."
else
    echo "Error: Failed to compress .log files."
    exit 1
fi
