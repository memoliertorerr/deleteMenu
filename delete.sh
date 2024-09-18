#!/bin/zsh

# Check if a file or a directory is given
if [ -z "$1" ]; then
  echo "Given: $0 <file_or_directory_path>"
  exit 1
fi

# Ensure the path is not root or an empty string to avoid total collapse or smth
if [ "$1" = "/" ] || [ "$1" = "" ]; then
  echo "Root directory or an empty path cannot be deleted"
  exit 1
fi

# Remove the file or directory
rm -rf "$1"

# Check if the removal was successful
if [ $? -eq 0 ]; then
  echo "Deleted item: $1"
  # Optional: Log the deletion to keep track of your successful deletions
  echo "$(date): Deleted $1" >> ~/deletion_log.txt
else
  echo "Failed to delete: $1 ooopss"
fi
