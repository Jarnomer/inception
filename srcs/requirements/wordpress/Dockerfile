FROM debian:latest

RUN apt-get update && apt-get upgrade && \
    apt-get install -y php-fpm \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["php-fpm", "-F"]