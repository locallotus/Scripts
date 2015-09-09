#!/bin/bash

# http://linoxide.com/how-tos/ping-check-open-port/
# This shell script enables you to perform a ping to remote host and check whether the mentioned port is opened on that server.
# requires netcat to be installed

if [ "$#" = "0" ];
then
echo "Usage: $0 "
exit 1
fi

host=$1
port=$2
email="test@linoxide.com"
subject="Script result"

if ping -q -c 4 $host >/dev/null
then

ping_result="OK"
else
ping_result="NOT OK"

fi

nc_result=`nc -z $host $port; echo $?`

if [ $nc_result != 0 ];
then
port_result="not opened"
else
port_result="opened"
fi

message="Ping to host - ${ping_result}, port $port ${port_result}."

if [ "$ping_result" != "OK" -o "$nc_result" != "0" ];
then
echo "$message"

echo "$message" | mail -s "$subject" $email

fi
