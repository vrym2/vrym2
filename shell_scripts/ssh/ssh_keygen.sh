#!bin/bash

# Generating ssh key to add to github

if [ $(ls -f ~/.ssh/id_ed25519) -eq 0 ]; then
    echo "public/private key pair is already created"
else
    ssh-keygen -t ed25519 -C "vardhn609@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
fi