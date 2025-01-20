#!/bin/sh

log() { 
    printf "[TRACE] $1 \n" 
}

until mysql -h mariadb -u "$DB_USER" -p"$DB_PASS" -e "SHOW DATABASES;"; do
    log "Waiting for MariaDB database..."
    sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then
    log "Downloading WordPress..."
    wp core download --allow-root

    log "Creating configuration..."
    wp core config --dbname=${DB_NAME} --dbuser=${DB_USER} \
      --dbpass=${DB_PASS} --dbhost=${DB_HOST} --allow-root

    log "Installing WordPress..."
    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} \
      --admin_user=${WP_ADMIN} --admin_password=${WPA_PASS} \
      --admin_email=${WPA_MAIL} --allow-root

    log "Creating user..."
    wp user create "${WP_USER}" "${WP_MAIL}" --role=author \
      --user_pass="${WP_PASS}" --allow-root
else
    log "WordPress is already setup."
fi

log "Setting permissions and owners..."
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

log "Starting the service..."
php-fpm82 -F
