### Notes

Add custom commands in linux
* Create a shell script file and make sure it is executable `chmod u+x,g+x script.sh`
* Create a `.bash_aliases` file in the root dir and add `alias 'custom_command'='/home/user/script.sh'`
* Run `source ~/.bash_aliases` and `custom_command` is ready to go
