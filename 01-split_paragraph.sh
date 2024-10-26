#!/bin/bash

# Check if a filename is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Input file
input_file="$1"

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "File not found!"
    exit 1
fi

# Split the paragraphs into separate files
# Use awk to split by blank lines and create the output files
awk -v RS='' -v OFMT="%.0f" -v prefix="paragraph" \
    '{
        # Increment the paragraph count
        count++
        # Write the paragraph to a file
        print $0 > prefix count ".txt"
    }' "$input_file"

echo "Paragraphs split into separate files."
