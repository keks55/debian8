#fastcgi_cache_path /var/cache/nginx/fastcgi/10888 use_temp_path=on keys_zone=WP:100m inactive=1m;
#fastcgi_cache_key "$scheme$request_method$host$request_uri";
#fastcgi_temp_path /var/cache/nginx/fastcgi;

server {
listen		80;
server_name	10888.ru;

root		/var/www/localhost/$server_name/;

error_log	/var/log/nginx/10888.ru.error.log;

location /10888.ru/ {
    #try_files $uri $uri/ /index.php?$args;
    try_files $uri $uri/ /index.php?q=$uri$args;
}

include /etc/nginx/templates/static;
include /etc/nginx/templates/php;
#include /etc/nginx/templates/wordpress;
#include /etc/nginx/templates/errors;
#include /etc/nginx/templates/security;
}

#chown -R www-data /var/cache/nginx/fastcgi_temp
#chmod 700 /var/cache/nginx/fastcgi/10888.ru
#chown -R root /var/cache/nginx/fastcgi_temp