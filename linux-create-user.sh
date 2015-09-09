#!/bin/bash

# http://linoxide.com/linux-shell-script/shell-script-create-linux-user/

while [ x$username = "x" ]; do

read -p "Please enter the username you wish to create : " username

if id -u $username >/dev/null 2>&1; then

echo "User already exists"

username=""

fi

done

while [ x$group = "x" ]; do

read -p "Please enter the primary group. If group not exist, it will be created : " group

if id -g $group >/dev/null 2>&1; then

echo "Group exist"

else

groupadd $group

fi

done

read -p "Please enter bash [/bin/bash] : " bash

if [ x"$bash" = "x" ]; then

bash="/bin/bash"

fi

read -p "Please enter homedir [/home/$username] : " homedir

if [ x"$homedir" = "x" ]; then

homedir="/home/$username"

fi

read -p "Please confirm [y/n]" confirm

if [ "$confirm" = "y" ]; then

useradd -g $group -s $bash -d $homedir -m $username

fi
