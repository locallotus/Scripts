#!/bin/bash

# http://linoxide.com/linux-shell-script/login-logout-scripts/
# This script / daemon that send email of every login / logout to server.

subject="New login on $(hostname -f)"
email="corne.rossouw.91@gmail.com"

while true; do

LASTLOGIN=`last | head -1`

if [ x"$PREVLOGIN" = "x" ]; then

PREVLOGIN=$LASTLOGIN

else

if [ "$LASTLOGIN" != "$PREVLOGIN" ];
then
#echo "$LASTLOGIN" | mail -s "$subject" "$email"

echo "$LASTLOGIN $subject"

PREVLOGIN=$LASTLOGIN
fi
fi
sleep 1
done
