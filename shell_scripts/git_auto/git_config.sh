#!bin/bash 

# Git configuration
git --version
if [ $? -eq 0 ]; then

    echo "Adding git configuration: username, email"
    git config --global user.name "vrym2"
    git config --global user.email "vardhan609@gmail.com"

else

    echo "git is not installed, please install git"

fi

# Logging into Github with token

# Checking if there is a token file
if [ ""$(ls -f tmp/tokens/github.txt) -eq 0 ]; then
    
    echo "GitHub Access token: ${cat tmp/tokens/github.txt}"
    echo "Logging into GutHub account"

    gh --version
    if [ $? -eq 0 ]; then
        gh auth login --with-token < tmp/tokens/github.txt
    else
        echo "GitHub CLI is not installed"
        echo " Install CLI by follwing instructions from here"
        echo "https://github.com/cli/cli#installation"
    fi
else

    echo "Go to https://github.com/, create a personal access token"
    echo "Store the token in projects/tmp/tokens/github.txt file"

fi

    

