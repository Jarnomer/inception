# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache nginx openssl

# Copy custom configuration file
COPY conf/default /etc/nginx/sites-available/default

# Setup entrypoint script
RUN mkdir -p /usr/local/bin
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose default port
EXPOSE 443

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start in the foreground
CMD ["nginx", "-g", "daemon off;"]