#!/bin/bash

while ! mysqladmin -h "$DB_NAME" -u"$DB_USER" -p"$DB_PASS" ping --silent; do
    echo "Waiting for MariaDB to initialize..."
    sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Initializing WordPress..."

    # Download Wordpress
    wp core download --allow-root

    # Create configuration
    wp core config --dbname=${WP_NAME} --dbuser=${WP_USER} \
      --dbpass=${WP_PASS} --dbhost=${WP_HOST} --allow-root

    # Install wordpress
    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} \
      --admin_user=admin --admin_password=admin \
      --admin_email=admin@admin.com --allow-root
else
    echo "WordPress is already initialized."
fi
