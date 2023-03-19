#!/bin/bash

function git_push(){
    # Get the commit message from the first command-line argument
    # Check the status of git
    if [ "$(git status)" = "fatal: not a git repository (or any of the parent directories): .git" ]; then
        # Not a git directory
        echo "$(git status)"
    elif [[ -z "$(git status --porcelain)" ]]; then
        echo "No changes detected"
        echo "Branches are up-to date"
    else
        # Changes detected
        commit_msg="$1"
        echo "Changes detected in the following"
        echo "$output"

        # Add all changes
        git add -A

        # Commit changes with the specified commit message
        git commit -m "$commit_msg"

        # Push changes to remote repository
        git push 
    fi
}