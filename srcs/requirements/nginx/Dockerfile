# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache nginx openssl

# Copy custom configuration file
COPY ./conf/default /etc/nginx/sites-available/default

# Setup entrypoint script
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose default port
EXPOSE 443

# Use entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Start in the foreground
CMD ["nginx", "-g", "daemon off;"]