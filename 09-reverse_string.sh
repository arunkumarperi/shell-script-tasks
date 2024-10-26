#!/bin/bash

# Check if a string is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 \"string to reverse\""
    exit 1
fi

# Get the input string
input_string="$1"

# Reverse the string
reversed_string=$(echo "$input_string" | rev)

# Output the reversed string
echo "$reversed_string"
