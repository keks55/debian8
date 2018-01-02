server {
listen			80;
server_name		15domains.ru;

root			/var/www/$server_name/;

error_log		/var/log/nginx/15domains.ru.error.log;

include /etc/nginx/templates/static;
include /etc/nginx/templates/php;
include /etc/nginx/templates/wordpress;

}

