# http://linoxide.com/linux-shell-script/backup-mysql-database/
#!/bin/bash

### Create Directory with Date where Database backup will be stored. ####

month=$(date | awk '{print $2}')
day=$(date | awk '{print $3}' )
year=$(date | awk '{print $6}')
foldername=$(echo $day$month$year"_backups")

### List all the databases in /usr/local/dblist file. ####

mysql -u root -p'mysqlpassword' -e 'show databases' >/usr/local/dblist
list=$(cat /usr/local/dblist)
echo $foldername

### Create Backup Directory in /Backup/mysqlbackup …  ####
mkdir -p /Backup/mysqlbackup/$foldername

for i in $list
do

echo $i
mysqldump -u root -p'mysqlpassword' $i | gzip > /Backup/mysqlbackup/$foldername/$i.sql.gz
echo " "$i".sql.gz file saved.."
done
