#Variable to set subject of email

subject="New login on $(hostname -f)"

#email address

email="test@linoxide.com"

#To run as daemon, this will be false everytime.

while true; do

#We take last line from output of last command. Last command show last logins/logouts, newest on the top. Head -1 to take first line.

LASTLOGIN=`last | head -1`

#compare if previous value if empty, to avoid sending emails on restart.

if [ x"$PREVLOGIN" = "x" ]; then

#if previous value empty – write to previous value current last line with login.

PREVLOGIN=$LASTLOGIN

#if previous value is not empty – do next:

else

#compare if previous value and last value the same, if not do next:

if [ "$LASTLOGIN" != "$PREVLOGIN" ];

#uncoment this line if you want to receive emails.First we echo lastlogin line, after redirect it to mail command, mail command to send emails, -s to specify subject, last agrument email to where to sent.

then
#echo "$LASTLOGIN" | mail -s "$subject" "$email"

#this line just to write to terminal result.

echo "$LASTLOGIN $subject"

#if email sent we write to previous value current value, so will sent email only on new entry.

PREVLOGIN=$LASTLOGIN

#finish of if loop, if previous entry same as last one no need to do anything.

fi

#finish of first if loop.

fi

#sleep 1 second, to do nothing, to not use CP.

sleep 1

#finish of while loop.

done


