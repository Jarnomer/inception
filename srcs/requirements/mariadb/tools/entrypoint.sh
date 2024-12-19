#!/bin/bash

# Start the MariaDB service in the background
service mariadb start

# Wait for the MariaDB service to start
until mariadb -e "SELECT 1;" > /dev/null 2>&1; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

# Check if the MariaDB database already exists
if ! mariadb -e "USE $MARIA_DB_NAME;" 2>/dev/null; then
    echo "Initializing MariaDB database and user..."
    mariadb -u root < setup.sql
else
    echo "MariaDB is already initialized."
fi

# Stop the MariaDB service
service mariadb stop