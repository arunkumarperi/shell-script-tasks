#!/bin/bash

# Check if a directory path is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIRECTORY=$1

# Check if the provided path is a directory
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: $DIRECTORY is not a directory."
    exit 1
fi

# Count files and directories
FILE_COUNT=$(find "$DIRECTORY" -type f | wc -l)
DIR_COUNT=$(find "$DIRECTORY" -type d | wc -l)

# Display the counts
echo "Number of files: $FILE_COUNT"
echo "Number of directories: $DIR_COUNT"
