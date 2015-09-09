# http://linoxide.com/linux-shell-script/shell-script-copy-files-directory-scp/
# Script will only work assuming you have configured ssh key based authentication between two machines.
#!/bin/bash
#next line prints hearer of script
echo "Interactive Script to Copy File (files) / Directory using scp"
#next line check if entered value is not null, and if null it will reask user to enter Destination Server
while [ x$desthost = "x" ]; do
#next line prints what userd should enter, and stores entered value to variable with name desthost
read -p "Destination Server Name : " desthost
#next line finishes while loop
done
#next line check if entered value is not null, and if null it will reask user to enter Destination Path
while [ x$destpath = "x" ]; do
#next line prints what userd should enter, and stores entered value to variable with name destpath
read -p "Destination Path : " destpath
#next line finishes while loop
done
#next line put null value to variable filename
filename='null'
#next line check if entered value is null, and If not null it will reask user to enter file(s) to copy
while ! [ x"$filename" = "x" ]; do
#next line prints what userd should enter, and stores entered value to variable with name filename
read -p "Path to source directory / file : " filename
#next line checks if entered value is not null, and if not null it will copy file(s)
if ! [ x"$filename" = "x" ];
then
#next line prints header
echo -n "Copying $filename ... "
#next like copy pre-entered file(s) or dir to destination path on destination server
scp -r "$filename" "$desthost":"$destpath"
#end of if
fi
#next line finishes while loop
done
