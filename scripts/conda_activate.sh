#!bin/bash

function conda-activate {
    if [ $(basename $1)=='sar-pre-processing' ]; then
        echo -e "Activating 'sensarp' conda env"
        conda activate sensarp
    elif [ $(basename $1)=='oiltanks' ]; then
        echo -e "Activating 'oiltanks' conda env"
        conda activate oiltanks
    else
        echo "Please check the folder has appropriate conda env"
        conda info --envs
    fi
}