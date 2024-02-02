# base image
FROM debian:11

# maintainer info
# LABEL maintainer="rreis-de42 <rreiscarvalho1999@gmail.com>"

# install mariadb server
RUN apt-get update && apt-get install -y mariadb-server


# create directory for socket file
# RUN mkdir -p /var/run/mysqld \
# && chown -R mysql:mysql /var/run/mysqld \
# && chmod 777 /var/run/mysqld

# expose default mariadb port
EXPOSE 3306

# custom cnf file
# COPY my.cnf /etc/mysql/my.cnf

RUN mysql_install_db

# copy entrypoint script to a different location
#COPY my.cnf /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/

# grant execute permission to the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh
#RUN chmod +x /usr/local/bin/my.cnf

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]


