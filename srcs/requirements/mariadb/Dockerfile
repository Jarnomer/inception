FROM debian:latest

RUN apt-get update && apt-get upgrade && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql

RUN mkdir -p /run/mysqld

EXPOSE 3306

CMD ["mysqld"]