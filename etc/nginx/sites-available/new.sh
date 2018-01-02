# !/bin/bash
# create new wordpress site from zip archive
# example
# ./new.sh wp415 4.1.5
# $1 = foldername
# $2 = wordpress zip archive number

USER="root"
PASSWORD="000"
DBNAME="1$"

touch $1
touch /var/log/nginx/$1.error.log

cat <<EOT >> $1
server {
listen          80;
server_name     $1;

root            /var/www/\$server_name/;

error_log       /var/log/nginx/$1.error.log;

include /etc/nginx/templates/php;
include /etc/nginx/templates/static;
include /etc/nginx/templates/wordpress;


}
EOT

# create symlink
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1

mkdir /var/www/$1

cd ~/Downloads/
unzip wordpress-$2.zip 
mv -v ~/Downloads/wordpress/* /var/www/$1

#cd /var/www/$1
#cp wp-config-sample.php wp-config.php

# copy plugins
cp -R /var/www/kkk/wp-content/plugins/ajax-message/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/customizer-reset-by-wpzoom/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/disable-xml-rpc/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/disable-wordpress-updates/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/jquery-colorbox/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/q-shortcodes/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/regenerate-thumbnails/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/theme-check/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/under-construction-page/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/wordpress-importer/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/wp-pagenavi/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/wp-super-cache-1.4.3/ /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/plugins/rus-to-lat.php /var/www/$1/wp-content/plugins/
cp -R /var/www/kkk/wp-content/themes/colored /var/www/$1/wp-content/themes/
# woocommerce 2.4.6
cp -R /var/woo246/woocommerce/ /var/www/$1/wp-content/plugins/
cp -R /var/woo246/woocommerce-advanced-shipping/ /var/www/$1/wp-content/plugins/
rm /var/www/$1/wp-content/plugins/hello.php

# set permissions
chown www-data:www-data -R *
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

#create mysql table
mysql -u$USER -p$PASSWORD  <<EOF
CREATE DATABASE $1;
quit
EOF

# ./new.sh wp415 4.1.5