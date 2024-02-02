#base image
FROM debian:11

#update package list and install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#create directories for SSL certificates
RUN mkdir -p /etc/nginx/ssl

#custom nginx configuration file
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./ssl/nginx.crt /etc/nginx/nginx.crt
COPY ./ssl/nginx.key /etc/nginx/nginx.key

#expose port that nginx will run on
EXPOSE 443

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm /etc/nginx/sites-enabled/default && \
	rm /etc/nginx/sites-available/default
# Start Nginx

CMD ["nginx", "-g", "daemon off;"]