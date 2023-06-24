#!bin/bash 

# GitHub CLI installation
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md

wget https://cli.github.com/packages/githubcli-archive-keyring.gpg # Dowload gpg file
mv githubcli-archive-keyring.gpg /usr/share/keyrings/ # Move the file to /usr/share/keyrings
chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main"
tee /etc/apt/sources.list.d/github-cli.list  # add it to the source list
apt update 
apt install gh -y # Install GitHub cli applcation