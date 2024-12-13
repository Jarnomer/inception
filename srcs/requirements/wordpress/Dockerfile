# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache php-fpm php-mysqli curl

# Copy custom configuration file
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Setup entrypoint script
RUN mkdir -p /usr/local/bin
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose default port
EXPOSE 9000

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start in the foreground
CMD ["php-fpm8.2", "-F"]