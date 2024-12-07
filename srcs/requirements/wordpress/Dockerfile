FROM debian:latest

RUN apt-get update && apt-get upgrade && \
    apt-get install -y php-fpm

CMD ["php-fpm", "-F"]