#!/bin/bash

# Add folder to python path
if [[ ":PYTHONPATH:" != *":$PWD:"* ]]; then
    echo "Adding $PWD to the PYTHONPATH"
    export PYTHONPATH="$PWD:$PYTHONPATH"
fi

