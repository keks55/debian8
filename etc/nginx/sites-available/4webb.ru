server {

    listen 80;
    server_name  4webb.ru www.4webb.ru;
    rewrite ^(.*) http://keksus.com$1 permanent;
}
