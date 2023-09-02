#!/bin/bash

# Declare variables
file_name=""
commit_message=""
remote_repository=""

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

# Ask the user for the remote repository
echo "Enter the remote repository: "
read remote_repository

# Check if the user entered a value
#if [[ -z "$remote_repository" ]]; then
  #echo "You must enter a remote repository."
  #echo "Please enter the remote repository again: "
  #read remote_repository
#fi

# Add the remote repository
git remote add origin $remote_repository

# Push the changes to the remote repository
git push -u origin main

# Print a message to the user
echo "The push process is completed."

