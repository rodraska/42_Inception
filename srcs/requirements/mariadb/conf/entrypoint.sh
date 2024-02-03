#!/bin/sh
echo "hALOOOOOOOOOOOOOOOOOOOOOOO"

if [ ! -d "/var/lib/mysql/$MDB_NAME" ]; then

service mariadb start

sleep 1

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

else
    sleep 1
fi

echo "Done"

exec "$@"