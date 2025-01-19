# Use latest penultimate stable alpine version
FROM alpine:3.19

# Update system and install packages
RUN apk update && apk add --no-cache mariadb mariadb-client

# Setup directories and permissions
RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

# Initialize service database and tables
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Copy mariadb config file
COPY ./conf/my.cnf /etc/mysql/
RUN chmod 644 /etc/mysql/my.cnf

# Copy mysql init file
COPY tools/init.sql /etc/mysql/
RUN chmod 644 /etc/mysql/init.sql

# Copy entrypoint script
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose default port
EXPOSE 3306

# Use entrypoint script
ENTRYPOINT [ "sh", "/usr/local/bin/entrypoint.sh" ]
