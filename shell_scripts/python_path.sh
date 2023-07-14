#!/bin/bash

# Add folder to python path if it is a .git folder
parent_dir="$(dirname "$PWD")"
directories=$(find "$parent_dir" -type d)
for dir in $directories; do
    if [[ ":PYTHONPATH:" != *":$dir:"* ]]; then
        echo "Adding $dir to the PYTHONPATH"
        export PYTHONPATH="$dir:$PYTHONPATH"
    fi
done

