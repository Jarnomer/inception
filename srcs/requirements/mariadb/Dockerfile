# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache mariadb mariadb-client

# Copy custom configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Setup an entrypoint script
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose default port
EXPOSE 3306

# Use entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Start in the foreground
CMD ["mysqld_safe"]
