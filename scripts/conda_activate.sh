#!bin/bash

function conda-activate {
    if [ $(basename $1)=='oiltanks' ]; then
        echo -e "Activating 'oiltanks' conda env"
        mamba activate esa_snap
    else
        echo "Please check the folder has appropriate conda env"
        mamba info --envs
    fi
}