FROM debian:latest

RUN apt-get update && apt-get upgrade && \
    apt-get install -y php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]