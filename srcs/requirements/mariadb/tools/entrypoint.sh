#!/bin/sh

log() { 
    printf "[TRACE] $1 \n" 
}

log "Starting the service for setup..."
mysqld &

until mysqladmin ping --silent; do
    log "Waiting for MariaDB service..."
    sleep 2
done

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    log "Creating MariaDB database, users and permissions..."
    sed -i "s/database_name/$DB_NAME/g" /etc/mysql/init.sql
    sed -i "s/database_user/$DB_USER/g" /etc/mysql/init.sql
    sed -i "s/database_pass/$DB_PASS/g" /etc/mysql/init.sql
    mysql -u root < /etc/mysql/init.sql
else
    log "MariaDB is already setup."
fi

log "Shutting down the service..."
mysqladmin -u root shutdown

log "Starting the service..."
exec mysqld
