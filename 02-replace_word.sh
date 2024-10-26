#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <filename> <word_to_replace> <new_word>"
    exit 1
fi

# Assign arguments to variables
filename=$1
word_to_replace=$2
new_word=$3

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found!"
    exit 1
fi

# Use sed to replace the word
sed -i "s/$word_to_replace/$new_word/g" "$filename"

# Notify the user of the successful replacement
echo "Replaced all occurrences of '$word_to_replace' with '$new_word' in '$filename'."
