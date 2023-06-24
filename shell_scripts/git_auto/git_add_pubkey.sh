#!bin/bash

# Addding public key to GitHub account
# Input a title for the ssh key file adding to GitHub account
gh ssh-key add ~/.ssh/id_ed25519.pub --title "$1"