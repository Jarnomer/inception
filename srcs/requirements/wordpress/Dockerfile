# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache mariadb-client \
    php82 php82-fpm php82-mysqli php82-phar

# Copy custom configuration file
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/

# Set working directory
RUN mkdir -p /var/www/html
WORKDIR	/var/www/html

# Create user and group
RUN adduser -S www-data -G www-data

# Expose default port
EXPOSE 9000

# Download and install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp


# Use entrypoint script
COPY tools/entrypoint.sh /etc/php/entrypoint.sh
RUN chmod +x /etc/php/entrypoint.sh
ENTRYPOINT [ "sh", "/etc/php/entrypoint.sh" ]

# Start the service
CMD [ "php-fpm8.2", "-F" ]
