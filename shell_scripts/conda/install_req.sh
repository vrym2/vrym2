#!/bin/bash

# creating the conda env
FOLDER_NAME="$(basename $PWD)"

mamba create -n $FOLDER_NAME python=3.9

while IFS= read -r line
do
    mamba install "${line}"
done < requirements.txt