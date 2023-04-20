#!bin/bash

function conda-activate {
    if [ $(basename $1)=='oiltanks' ]; then
        echo -e "Activating conda environemnt"
        mamba activate terradue_snapista
    else
        echo "Please check the folder has appropriate conda env"
        mamba info --envs
    fi
}