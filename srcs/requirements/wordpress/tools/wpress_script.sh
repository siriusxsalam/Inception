#!bin/bash

sleep 10

# mkdir -p /var/www/html
# cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# mv wp-config-sample.php wp-config.php

wp config create --dbname="$DATABASE_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_USER_PASSWORD" --dbhost="mariadb:3306" --path="/var/www/html" --allow-root

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html" --allow-root

wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --path="/var/www/html" --allow-root

mkdir /run/php

chown -R www-data:www-data /var/www/html/

/usr/sbin/php-fpm7.4 -F