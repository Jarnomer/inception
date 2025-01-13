# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && \
    apk add --no-cache \
    mariadb \
    mariadb-client

# Copy config and setup file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/setup.sql /setup.sql

# Setup directories and permissions
RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Expose default port
EXPOSE 3306

# Use entrypoint script
COPY tools/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

# Start the service
CMD ["mysqld_safe"]
