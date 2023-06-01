#!/bin/bash

# Removing versions from conda env.yml
while IFS= read -r line; do
    if [[ "$line" == *"="* ]]; then
        package_name=$(echo "$line" | cut -d '=' -f 1)
        echo "$package_name" >> "$1.tmp"
    else
        echo "$line" >> "$1.tmp"
    fi
done < "$1"
mv "$1.tmp" "$1"
