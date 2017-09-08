#!/bin/bash

echo "===================================================================================="
echo "start to configure the environment of mysql"

rpm -ivh ../mysql*.rpm
yum install mysql-community-server
service mysqld start
grep 'temporary password' /var/log/mysqld.log
echo "please save automatic generating password of mysql where above！！！"
echo -e "mysql -uroot -p\
\nset global validate_password_policy=0;\
\nALTER USER 'root'@'localhost' IDENTIFIED BY '73979901995';\
\ngrant all on *.* to root@"%" identified by "73979901995";\
\nflush privileges;"