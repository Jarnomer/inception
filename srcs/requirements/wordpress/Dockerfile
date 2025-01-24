# Use latest penultimate stable alpine version
FROM alpine:3.19

# Update system and install packages
RUN apk update && apk add --no-cache mariadb-client \
    php82 php82-fpm php82-mysqli php82-phar php82-mbstring

# Download and install wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

# Copy php-fmp config file
COPY conf/www.conf /etc/php82/php-fpm.d/

# Copy entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Create user and group
RUN adduser -S www-data -G www-data

# Set working directory
WORKDIR /var/www/html

# Expose default port
EXPOSE 9000

# Use entrypoint script
ENTRYPOINT [ "sh", "/usr/local/bin/entrypoint.sh" ]
