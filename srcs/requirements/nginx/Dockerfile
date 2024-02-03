#base image
FROM debian:11

#update package list and install nginx
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#create directories for SSL certificates
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/rreis-de.crt \
       -keyout /etc/nginx/ssl/rreis-de.key \
       -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=rreis-de/CN=localhost/"

COPY ./conf/default.conf /etc/nginx/conf.d/

#expose port that nginx will run on
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]y