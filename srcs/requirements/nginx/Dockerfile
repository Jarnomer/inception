# Use penultimate stable Alpine version
FROM alpine:3.20

# Update system and install packages
RUN apk update && apk add --no-cache nginx openssl

# Setup directories and permissions
RUN mkdir -p /etc/nginx/ssl

# Copy config files
COPY conf/default.conf /etc/nginx/conf.d/

# Expose default port
EXPOSE 443

# Use entrypoint script
COPY tools/entrypoint.sh /etc/nginx/entrypoint.sh
RUN chmod +x /etc/nginx/entrypoint.sh
ENTRYPOINT [ "sh", "/etc/nginx/entrypoint.sh" ]

# Start the service
CMD [ "nginx", "-g", "daemon off;" ]
