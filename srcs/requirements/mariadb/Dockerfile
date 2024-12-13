# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache mariadb mariadb-client

# Copy custom configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Setup entrypoint script
RUN mkdir -p /usr/local/bin
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose default port
EXPOSE 3306

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start in the foreground
CMD ["mysqld_safe"]
