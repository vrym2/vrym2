# Colour codes
# Figlet use for fancy message
figlet "Welcome back!"

figlet "Raj"

# Executable scripts
# Manual git push commands
source /home/vardh/oiltanks/scripts/git_push.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vardh/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vardh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vardh/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vardh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Intialise the conda environment
if [ -f $(pwd)/$(basename "$(pwd)").code-workspace ]; then
        echo -e "\033[1;32mActivating '"$(basename "$(pwd)")"' conda env\033[0m"
        conda activate $(basename "$(pwd)")
else
        echo -e "\033[1;32m "$(basename "$(pwd)")" does not exist. \033[0m"
        echo "Relaunch the terminal!"
fi

# <<< update all git repositories in the current folder <<<
function git-pull-all {
    for dir in $(find $1 -maxdepth 2 -type d -name .git); do
        cd ${dir%/*}
        echo "Pulling changes in ${PWD##*/}..."
        git pull
        cd - > /dev/null
    done
}
git-pull-all $PWD
# <<<------------------------------------------------->>>

# <<< GitHub Personal access token <<<
export GITHUB_TOKEN=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
# <<< Earth data ASF login <<<
export EARTHDATA_USERNAME=vardhan609@gmail.com
export EARTHDATA_PASSWORD=Nani@351995

# <<< Add all the project parent and directories to PYTHONPATH <<<
# add all directories in current directory to PYTHONPATH
for file in "$PWD"/*; do
    if [[ -d "$file" ]]; then
        if [[ ":$PYTHONPATH:" != *":$file:"* ]]; then
            export PYTHONPATH="$file:$PYTHONPATH"
        fi
    fi
done

# LD_LIBRARY PATH
export JAVA_HOME=/home/vardh/anaconda3/envs/oiltanks/
export PATH="$HAVA_HOME/bin:$PATH"
