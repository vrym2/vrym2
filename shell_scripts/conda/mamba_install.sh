#!/bin/bash

MAMBA_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"

echo "Checking if ~/tmp/apps exists"
sleep 2
# Checking if there is DIR for apps
if [ -d ~/tmp/apps ]; then
    echo "Directory tmp/apps exists"
else
    mkdir -p ~/tmp/apps
    echo "Created ~/tmp/apps"
fi
sleep 2

echo "Checking if mambaforge directory exists"
sleep 2

# Checking if mamba directory exists
if [ ! -d ~/mambaforge ]; then
    echo "It does not exist"
    echo "Checking if Mamba installation shell script exists"
    sleep 2
    if [ ! -f ~/tmp/apps/Mambaforge-Linux-x86_64.sh ]; then
        echo "It does not exist"
        echo "Downloading ${MAMBA_URL}"
        wget -P ~/tmp/apps "${MAMBA_URL}"
    else
        echo "Mamba installation sciprt exists"
    fi

    echo "Installing Mambaforge"
    sleep 2
    bash ~/tmp/apps/Mambaforge-Linux-x86_64.sh
else
    echo "It exists"
    mamba init
fi

# Installing project specific conda environment
FOLDER_NAME="$(basename $PWD)"

echo "Creating ${FOLDER_NAME} environment"
sleep 2

if mamba activate $FOLDER_NAME; then
    echo "Mamba env $FOLDER_NAME exists"
else
    mamba create -n $FOLDER_NAME python=3.9
    echo "Close the terminal and re-open to activate"
fi


