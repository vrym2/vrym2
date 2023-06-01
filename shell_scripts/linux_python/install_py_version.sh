#!/bin/bash

Usage="Install your required python from deadsnakes ppa in Ubuntu
Usage: `basename $0` python_version

where
    python_version = python3.8 or python3.7 etc
"

if [ "$1" == "-h" ]; then
    echo "$Usage"
    exit 0
else
    echo "Updating!"
    sudo apt update -y
    echo "Installing $1 version" # Insert your python version of choice. eg: python3.8
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install $1
    echo "Making $1 as default" # Making the python version as default
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/$1 1
    sudo update-alternatives --config python3
    echo "Here is the default python version"
    python3 --version
fi
