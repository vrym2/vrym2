#!bin/bash

# Activating project's conda environment
FOLDER_NAME=$(basename $PWD)
if mamba activate $FOLDER_NAME; then
    mamba activate $FOLDER_NAME
    echo "${FOLDER_NAME} environment activated"
else
    echo "Check if the environment has been created!"
    mamba info --envs
fi
