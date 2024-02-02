#base image
FROM debian:11

#install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-xml \
    php7.4-mbstring \
    telnet \
    iputils-ping \
    socat && \
    sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

#install wordpress
RUN apt-get install -y wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/bin/wp && \
	# Clean up after installation, removes package lists from apt-get
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#custom php-fpm conf
COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY ./conf/wordpress_conf.sh /tmp/wordpress_conf.sh
RUN chmod +x /tmp/wordpress_conf.sh

#sets working directory for RUN,CMD,ENTRYPOINT, COPY and ADD instructions
WORKDIR /var/www/html

#expose port used by php-fpm
EXPOSE 9000

#start php-fpm
#CMD ["php-fpm7.4", "-F"]

#wordpress configuration
ENTRYPOINT ["/tmp/wordpress_conf.sh"]
