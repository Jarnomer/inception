#!/bin/sh

log() {
    printf "[TRACE] $1 \n" 
}

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    log "Initializing database and tables..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    log "Starting service for setup..."
    mysqld &

    until mysqladmin ping --silent; do
        log "Waiting for service..."
        sleep 2
    done

    log "Creating database, users and permissions..."
    sed -i "s/database_name/$DB_NAME/g" /etc/mysql/init.sql
    sed -i "s/database_user/$DB_USER/g" /etc/mysql/init.sql
    sed -i "s/database_pass/$DB_PASS/g" /etc/mysql/init.sql
    mysql -u root < /etc/mysql/init.sql

    log "Shutting down the service..."
    mysqladmin -u root shutdown
else
    log "MariaDB is already setup."
fi

log "Starting the service..."
exec mysqld
