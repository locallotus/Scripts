#Write to console ask to enter group and save input to group variable

read -p "Please enter the primary group. If group not exist, it will be created : " group

#check if group already exist

if id -g $group >/dev/null 2>&1; then

#just warn that group already exist

echo "Group exist"

else

#if group not exist – create one more

groupadd $group

fi

#end of while loop

done

#ask to enter preferred bash

read -p "Please enter bash [/bin/bash] : " bash

#check if no input

if [ x"$bash" = "x" ]; then

#if no input, use default bash

bash="/bin/bash"

fi

#ask to enter preferred homedir

read -p "Please enter homedir [/home/$username] : " homedir

#check if no input

if [ x"$homedir" = "x" ]; then

#if no input , use default homedir

homedir="/home/$username"

fi

#ask to confirm all inputs

read -p "Please confirm [y/n]" confirm

#if input y

if [ "$confirm" = "y" ]; then

#command to add user with all entered info

useradd -g $group -s $bash -d $homedir -m $username

fi
