#fastcgi_cache_path /var/cache/nginx/fastcgi/keksus use_temp_path=on keys_zone=WP:100m inactive=1m;
#fastcgi_cache_key "$scheme$request_method$host$request_uri";
#fastcgi_temp_path /var/cache/nginx/fastcgi;

server {
        listen 80;
        server_name www.keksus.com;
        return 301 https://$server_name$request_uri;  # enforce https
}
server {
        listen 80;
        server_name keksus.com;
        return 301 https://$server_name$request_uri;
}

server {
listen			443 ssl;
server_name		keksus.com; 



ssl_certificate         	/etc/nginx/ssl/keksus.com/ssl-bundle.crt;
ssl_certificate_key     	/etc/nginx/ssl/keksus.com/keksus_com.key;
ssl_dhparam		/etc/nginx/ssl/keksus.com/dhparams.pem;
ssl_protocols      	TLSv1 TLSv1.1 TLSv1.2;
ssl_ciphers 		'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';

ssl_prefer_server_ciphers on;

root			/var/www/$server_name/;

error_log		/var/log/nginx/keksus.com.error.log;

location / {
	try_files $uri $uri/ /index.php?$args;
}


include /etc/nginx/templates/php;
include /etc/nginx/templates/phpmyadmin;
include /etc/nginx/templates/wordpress;
#include /etc/nginx/templates/errors;
include /etc/nginx/templates/security;
}

#chown -R www-data /var/cache/nginx/fastcgi_temp
#chmod 700 /var/cache/nginx/fastcgi/keksus
#chown -R root /var/cache/nginx/fastcgi_temp
#ln -s /etc/nginx/sites-available/keksus.com /etc/nginx/sites-enabled/keksus.com

