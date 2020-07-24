chown mysql:mysql /var/run/mysqld/ /var/lib/mysql
rm -f /var/run/mysqld/mysqld.sock;
rm -f /var/run/mysqld/mysqld.sock.lock;
rm -f /var/run/mysqld/mysqlx.sock.lock;
service ssh start;
service mysql start;
service nginx start;
service php7.3-fpm start;
service elasticsearch start;
/bin/bash;