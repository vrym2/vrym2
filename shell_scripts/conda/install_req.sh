#!/bin/bash

# Installing packages from requirementstxt file

while IFS= read -r line
do
    mamba install "${line}"
done < requirements.txt
