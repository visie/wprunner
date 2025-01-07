#!/bin/bash

service apache2 start
service php8.3-fpm start
service mariadb start

echo "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%' IDENTIFIED BY 'wordpress' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root

tail -f /dev/null
