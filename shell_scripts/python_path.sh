#!/bin/bash

# recursive function to add all directories and sub-directories to PYTHONPATH
function add_directories_to_pythonpath {
    for file in "$PWD"/*; do
        if [[ -d "$file" ]]; then
            # check if directory is already in PYTHONPATH
            if [[ ":$PYTHONPATH:" != *":$file:"* ]]; then
                export PYTHONPATH="$file:$PYTHONPATH"
            fi
            add_directories_to_pythonpath "$file"
        fi
    done
}

# call the function with the current directory as argument
add_directories_to_pythonpath "."

current_dir="$(basename $PWD)"

echo "Directory $current_dir added to PYTHONPATH"
