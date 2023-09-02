#!/bin/bash

# Declare variables
file_name=""
commit_message=""

# Initialize a git repository
git init

# Ask the user for the file name
echo "Enter the file name on the system: "
read file_name

# Check if the file exists
if [[ ! -f "$file_name" ]]; then
  echo "The file $file_name does not exist."
  exit 1
fi

# Add the file to the git repository
git add $file_name

# Ask the user for the commit message
echo "Enter the commit message: "
read commit_message

# Check if the user entered a value
if [[ -z "$commit_message" ]]; then
  echo "You must enter a commit message."
  exit 1
fi

# Commit the changes
git commit -m "$commit_message"

# Set the main branch
git branch -M main

# Add the remote repository
git remote add origin git@github.com:Turkimans/test.git

# Push the changes to the remote repository
git push -u origin main

# Print a message to the user
echo "The push process is completed."

