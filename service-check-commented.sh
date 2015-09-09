#check if service name passed to script as argument, if there no arguments (0) do next

if [ "$#" = 0 ]

then

"Usage $0 " #write to terminal usage

echo

#since no arguments – we need to exit script and user re-run it

exit 1

fi

#get service name from first argument

service=$1

#this check ,if service running using ps command, after we remove our process from output, since script will also match, with wc we count number of matching lines.

is_running=`ps aux | grep -v grep| grep -v "$0" | grep $service| wc -l | awk '{print $1}'`

#is number of lines are not 0 do next

if [ $is_running != "0" ] ;

then

#just put this line to terminal

echo "Service $service is running"

#if number of precesses is 0

else

#Service $service is not running" #just put this string to terminal

echo

#checking for files in /etc/init.d
(directory with start-up scripts) with name similar to service

initd=`ls /etc/init.d/ | grep $service | wc -l | awk '{ print $1 }'`

#if there is script with similar name

if [ $initd = "1" ];

then

#this line get name of startup script (ls - lists files in directory

startup=`ls /etc/init.d/ | grep $service`

echo -n "Found startap script /etc/init.d/${startup}. Start it? Y/n ? "

#waiting for user answer

read answer

#if answer Y or y

if [ $answer = "y" -o $answer = "Y" ];

then
echo "Starting service..."

#running startup script

/etc/init.d/${startup} start

fi
#exit of if loop

fi

#exit of if loop

fi
