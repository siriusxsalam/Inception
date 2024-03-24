#!/bin/bash

# Update bind-address configuration
sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Start MariaDB service
service mariadb start 

# Using a Here Document to run multiple SQL statements in one mariadb command
mariadb -uroot <<EOF
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
EOF

# Stop MariaDB service
service mariadb stop

# Optionally, if you want to ensure MariaDB starts after this script completes, 
# and if mariadbd is intended to run the daemon in the foreground for containerized environments, 
# consider using it with appropriate flags or ensuring it's configured to run correctly in your environment.
# This line might be redundant or need adjustment depending on your setup.
mariadbd
# mysqladmin -u root -p"my_password000" shutdown

# exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql' 

# service mariadb stop 
# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld
# #!/bin/bash

# service mariadb start

# sleep 5

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON ${MYSQLDB}.* TO \`${MSQLUSER}\`@'%';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQLROOTPASSWORD}';"
# mysql -u root -p$MYSQLROOTPASSWORD -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p$MYSQLROOTPASSWORD shutdown

# exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql' 


# #!/bin/bash

# service mysql start

# echo "CREATE DATABASE IF NOT EXISTS my_mariadb ;" > database.sql
# echo "CREATE USER IF NOT EXISTS 'my_mariadb_user'@'%' IDENTIFIED BY 'my_password000' ;" >> database.sql
# echo "GRANT ALL PRIVILEGES ON my_mariadb.* TO 'my_mariadb_user'@'%' ;" >> database.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'my_password000' ;" >> database.sql
# echo "FLUSH PRIVILEGES;" >> database.sql


# mysql < database.sql

# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld

# #!/bin/bash

# mkdir -p /var/run/mysqld
# chown mysql:mysql /var/run/mysqld

# # Start MySQL/MariaDB service (ensure it's already started if in a container)
# service mysql start

# # Create a SQL script for database setup
# echo "CREATE DATABASE IF NOT EXISTS my_mariadb ;" > database.sql
# echo "CREATE USER IF NOT EXISTS 'my_mariadb_user'@'%' IDENTIFIED BY 'my_password000' ;" >> database.sql
# echo "GRANT ALL PRIVILEGES ON my_mariadb.* TO 'my_mariadb_user'@'%' ;" >> database.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'my_password000' ;" >> database.sql
# echo "FLUSH PRIVILEGES;" >> database.sql

# # Execute the SQL script
# mysql < database.sql

# # Kill the MySQL/MariaDB process
# kill $(cat /var/run/mysqld/mysqld.pid)

# # Start the MySQL/MariaDB service
# mysqld
