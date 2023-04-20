#!/bin/bash
function git-pull-all {
    for dir in $(find $1 -maxdepth 2 -type d -name .git); do
        cd ${dir%/*}
        echo "Pulling changes in ${PWD##*/}..."
        git pull
        cd - > /dev/null
    done
}
# Usage
# git-pull-all $PWD