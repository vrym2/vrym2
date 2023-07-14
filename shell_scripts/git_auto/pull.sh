#!/bin/bash

if git rev-parse --git-dir > /dev/null 2>&1; then
    # Pulling if it is a Git folder
    echo "Pulling recent changes"
    git pull
fi