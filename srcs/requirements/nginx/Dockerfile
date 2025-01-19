# Use latest penultimate stable alpine version
FROM alpine:3.19

# Update system and install packages
RUN apk update && apk add --no-cache nginx openssl

# Copy nginx config file
COPY conf/nginx.conf /etc/nginx/
RUN chmod 644 /etc/nginx/nginx.conf

# Copy entrypoint script
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose default port
EXPOSE 443

# Use entrypoint script
ENTRYPOINT [ "sh",  "/usr/local/bin/entrypoint.sh" ]
