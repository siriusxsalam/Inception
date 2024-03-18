#!/bin/bash

# Create directory for WordPress
mkdir -p /var/www/html
cd /var/www/html

# Download WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Check if WordPress is already installed
if [ ! -f wp-config.php ]; then
    # Download WordPress core files
    wp core download --allow-root

    # Rename wp-config-sample.php to wp-config.php
    mv wp-config-sample.php wp-config.php

    # Configure WordPress database connection
    sed -i "s/username_here/my_mariadb_user/g; s/password_here/my_password000/g; s/localhost/mariadb/g; s/database_name_here/my_mariadb/g" wp-config.php

    # Install WordPress
    wp core install --url=hasalam.42.fr --title=Inception --admin_user=hasalamm --admin_password=sirius123 --admin_email=hasalam@gmail.com --allow-root
fi

# Create additional WordPress user
wp user create hasalammm hasalam@1337.ma --role=author --user_pass=sirius123 --allow-root

# Ensure correct permissions
chown -R www-data:www-data /var/www/html/

# Start PHP-FPM service (adjust version if necessary)
/usr/sbin/php-fpm7.4 -F

# #!/bin/bash

# # Create directory for WordPress
# mkdir -p /var/www/html
# cd /var/www/html

# # Download WP-CLI
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod 755 wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# # Download WordPress core files
# wp core download --allow-root

# # Rename wp-config-sample.php to wp-config.php
# mv wp-config-sample.php wp-config.php

# # Configure WordPress database connection
# sed -i "s/username_here/my_mariadb_user/g; s/password_here/my_password000/g; s/localhost/mariadb/g; s/database_name_here/my_mariadb/g" /var/www/html/wp-config.php

# # Install WordPress
# wp core install --url=hasalam.42.fr --title=Inception --admin_user=hasalam --admin_password=sirius123 --admin_email=hasalam@gmail.com --allow-root

# # Create additional WordPress user
# wp user create hasalam hasalam@1337.ma --role=author --user_pass=sirius123 --allow-root

# mkdir /run/php

# chown -R www-data:www-data /var/www/html/

# # Start PHP-FPM service
# /usr/sbin/php-fpm7.3 -F
