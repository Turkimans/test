#!/bin/bash

# Initialize a Git repository
git init

# Prompt the user for the file name
read -p "Enter the name of the file you want to add to the repository: " file_name

# Check if the file exists
if [ -e "$file_name" ]; then
  # Add the file to the Git repository
  git add "$file_name"
  echo "File '$file_name' added to the Git repository."
else
  echo "File '$file_name' does not exist."
  exit 1
fi

# Prompt the user for the commit message
while true; do
  read -p "Enter a commit message (press Enter for 'first commit'): " commit_message
  if [ -z "$commit_message" ]; then
    commit_message="first commit"
  fi

  # Check if the user entered a value
  if [ -n "$commit_message" ]; then
    break
  else
    echo "Please enter a commit message or press Enter to use the default."
  fi
done

# Commit the changes with the user-provided commit message
git commit -m "$commit_message"
echo "Changes committed with message: '$commit_message'"

# Rename the branch to 'main'
git branch -M main

# Prompt the user for the remote repository URL
while true; do
  read -p "Enter the remote repository URL (e.g., git@github.com:username/repo.git): " repo_url

  # Check if the user entered a value
  if [ -n "$repo_url" ]; then
    break
  else
    echo "Please enter the remote repository URL."
  fi
done

# Add the remote repository
git remote add origin "$repo_url"

# Push to the remote repository and set the upstream branch
git push -u origin main

# Check if the push was successful and print a message
if [ $? -eq 0 ]; then
  echo "Push process completed successfully."
else
  echo "Push process failed. Please check your Git configuration and try again."
fi

