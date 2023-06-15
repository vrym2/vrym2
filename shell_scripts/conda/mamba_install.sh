#!/bin/bash

MAMBA_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"

# Checking if there is DIR for apps
if [ -d ~/tmp/apps ]; then
    echo "Directory exists"
else
    mkdir -p ~/tmp/apps
fi

# Checking if mamba directory exists
if [ ! d ~/mambaforge ]: then
    wget -P ~/tmp/apps "${MAMBA_URL}"
    bash ~/tmp/apps/Mambaforge-Linux-x86_64.sh
else
    mamba activate base
fi
