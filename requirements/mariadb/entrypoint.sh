#!/bin/sh
echo "hALOOOOOOOOOOOOOOOOOOOOOOO"
# Check for existing installation
# if [ ! -d "/run/mysqld" ]; then
# 	mkdir -p /run/mysqld
# 	chown -R mysql:mysql /run/mysqld
# fi

if [ ! -d "/var/lib/mysql/$MDB_NAME" ]; then

service mariadb start

sleep 1

#chown -R mysql:mysql /var/lib/mysql
mysql_secure_installation << END

Y
$MDB_ROOT_PASSWORD
$MDB_ROOT_PASSWORD
Y
Y
Y
Y
END

mysql -u root -e "CREATE DATABASE $MDB_NAME;"
mysql -u root -e "CREATE USER '$MDB_USER'@'%' IDENTIFIED by '$MDB_USER_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MDB_NAME.* TO '$MDB_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PASSWORD';"
mysql -u root -p$MDB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MDB_ROOT_PASSWORD shutdown


# Initialize mariadb in bootstrap mode (with initial data)
#/usr/sbin/mysqld --user=mysql --bootstrap < $tfile
#rm -f $tfile

# Allow remote connections to the database
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Finally, it starts the MariaDB server in console mode, using the 'mysql' user.
else
    sleep 1
fi

echo "Done"

exec "$@"