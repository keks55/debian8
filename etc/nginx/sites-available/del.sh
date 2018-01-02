# !/bin/bash
# delete file
# example ./del.sh filename

rm $1
rm /var/log/nginx/$1.error.log
rm /etc/nginx/sites-enabled/$1
rm -rf /var/www/$1