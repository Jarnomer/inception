#!/bin/sh

log() {
  printf "[TRACE] $1 \n" 
}

log "Generating self-signed SSL certificate and private key..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-out "$SSL_CERT_PATH" -keyout "$SSL_KEY_PATH" \
-subj "/C=FI/L=Helsinki/O=Hive/OU=Student/CN=$DOMAIN_NAME" \
> /dev/null 2>&1 # silent execution

log "Replacing placeholders with environmental variables..."
sed -i "s|ssl_cert_path|$SSL_CERT_PATH|g" /etc/nginx/nginx.conf
sed -i "s|ssl_key_path|$SSL_KEY_PATH|g" /etc/nginx/nginx.conf
sed -i "s|domain_name|$DOMAIN_NAME|g" /etc/nginx/nginx.conf

log "Starting the service..."
nginx -g "daemon off;"
