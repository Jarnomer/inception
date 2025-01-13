# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl

# Copy config file
COPY conf/default /etc/nginx/sites-available/

# Expose default port
EXPOSE 443

# Use entrypoint script
COPY tools/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

# Start the service
CMD ["nginx", "-g", "daemon off;"]