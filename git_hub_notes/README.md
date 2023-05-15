### Git SSH
Instructions to add Git SSH, follow (instructions)[https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent] here.

Generate SSH in the local system
```
$ ssh-keygen -t ed25519 -C <Github Email>
```
Add SSH key to the agent
```
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
```
Git config with username and email
```
# Checking if git is installed
$ git --version
$ git config --global user.name
$ git config --gloabl user.email
```
Add generated SSH keys in the (github profile ssh keys)[https://github.com/settings/keys]
```
$ cat ~/.ssh/id_ed25519.pub
  # Then select and copy the contents of the id_ed25519.pub file
  # displayed in the terminal to your clipboard
  # And open the link above and add the key.
```
