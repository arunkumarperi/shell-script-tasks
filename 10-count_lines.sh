#!/bin/bash

# Check if at least one file is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 file1.txt file2.txt ..."
    exit 1
fi

# Initialize total line count
total_lines=0

# Loop through each file provided as argument
for file in "$@"; do
    if [[ -f "$file" ]]; then
        # Count lines in the current file
        line_count=$(wc -l < "$file")
        echo "$file: $line_count lines"
        total_lines=$((total_lines + line_count))
    else
        echo "$file: No such file."
    fi
done

# Output the total line count
echo "Total lines across all files: $total_lines"
#6,7 pending
