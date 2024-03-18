#!/bin/bash

# Start MySQL/MariaDB service (ensure it's already started if in a container)
service mysql start

# Create a SQL script for database setup
echo "CREATE DATABASE IF NOT EXISTS my_mariadb ;" > database.sql
echo "CREATE USER IF NOT EXISTS 'my_mariadb_user'@'%' IDENTIFIED BY 'my_password000' ;" >> database.sql
echo "GRANT ALL PRIVILEGES ON my_mariadb.* TO 'my_mariadb_user'@'%' ;" >> database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'my_password000' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

# Execute the SQL script
mysql < database.sql

# Kill the MySQL/MariaDB process
kill $(cat /var/run/mysqld/mysqld.pid)

# Start the MySQL/MariaDB service
mysqld

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