server {
listen			80;
server_name		225588.ru;

root			/var/www/$server_name/;

error_log		/var/log/nginx/225588.ru.error.log;


include /etc/nginx/templates/php;
include /etc/nginx/templates/wordpress;

}