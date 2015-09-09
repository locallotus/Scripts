#Check if service name passed to script as argument, if there no arguments (0) do next

if [ "$#" = "0" ];

then

#Write to terminal usage

echo “Usage: $0 ”

#Since no arguments – we need to exit script and user re-run

exit 1
fi

#Writing parameters to variables

host=$1
port=$2
email=”test@linoxide.com”
subject=”Script result”

#Check if ping ok -q to quite mod, -c 4 for 4 checks

if ping -q -c 4 $host >/dev/null
then

#Next lines writes result variable

ping_result=”OK”
else
ping_result=”NOT OK”

fi

#Next command check if port opened via nc command, and getting exit status of nc command

nc_result=`nc -z $host $port; echo $?`

#Check of exit status of nc command, and write results to variables

if [ $nc_result != 0 ];
then
port_result=”not opened”
else
port_result=”opened”
fi

#Writing message that script will email and write to output

message=”Ping to host – ${ping_result}, port $port ${port_result}.”

#Next check if ping or port check is failed (ping if not OK and exit status of nc if not 0)

if [ "$ping_result" != "OK" -o "$nc_result" != "0" ];
then
echo “$message” #this line write warning message to terminal

echo “$message” | mail -s “$subject” $email #this line send email

fi
