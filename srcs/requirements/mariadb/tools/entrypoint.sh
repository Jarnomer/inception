#!/bin/bash

# Start the service for setup
mysqld_safe --user=root &

# Wait for the MariaDB service to start
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

# Check if the MariaDB database already exists
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Initializing MariaDB..."
    mariadbd --initialize
    mariadb -u root < /setup.sql
else
    echo "MariaDB is already initialized."
fi

# Stop the service
mysqladmin shutdown
