FROM debian:latest

RUN apt-get update && apt-get upgrade && \
    apt-get install -y nginx && \
    apt-get install -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/default /etc/nginx/sites-available/.

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]