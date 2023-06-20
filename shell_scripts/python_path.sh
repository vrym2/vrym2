#!/bin/bash

# Add current folder to python path if it is a .git folder
# And pull any recent changes
if git rev-parse --git-dir > /dev/null 2>&1; then
    # Checking if the directory is laready in PYTHONPATH
    if [[ ":PYTHONPATH:" != *":$PWD:"* ]]; then
        echo "Adding $PWD to the PYTHONPATH"
        export PYTHONPATH="$PWD:$PYTHONPATH"

        echo "Pulling recent changes"
        git pull
    fi
fi
