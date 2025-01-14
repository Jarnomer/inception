# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache mariadb mariadb-client

# Setup directories and permissions
RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy config files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init.sql /etc/mysql/init.sql

# Expose default port
EXPOSE 3306

# Use entrypoint script
COPY tools/entrypoint.sh /etc/mysql/entrypoint.sh
RUN chmod +x /etc/mysql/entrypoint.sh
ENTRYPOINT [ "sh", "/etc/mysql/entrypoint.sh" ]

# Start the service
CMD [ "mysqld_safe" ]
