#!/bin/bash

# Start the service for setup
mysqld_safe --user=root &

# Wait for the MariaDB service to start
while ! mysqladmin ping --silent; do
    echo "Waiting for service to start..."
    sleep 2
done

# Check if the MariaDB database already exists
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Initializing MariaDB..."
    mariadbd --initialize
    mariadb -u root < /etc/mysql/init.sql
else
    echo "MariaDB is already initialized."
fi

# Stop the service
mysqladmin shutdown
