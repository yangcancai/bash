#!/bin/bash

cd /usr/local/src/ && sudo wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm && sudo rpm -Uvh mysql57-community-release-el7-8.noarch.rpm && sudo yum install mysql-community-client

 wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.35-linux-glibc2.12-x86_64.tar.gz
 tar -xzvf mysql-5.7.35-linux-glibc2.12-x86_64.tar.gz
 groupadd mysql
 useradd -r -g mysql -s /bin/false mysql
 mv mysql-5.7.35-linux-glibc2.12-x86_64 /usr/local/mysql
 mkdir -p /usr/local/mysql/log
 touch /usr/local/mysql/log/mysql-error.log
 chown -R mysql.mysql /usr/local/mysql
 rm -rf /etc/my.cnf
 rm -rf /etc/my.cnf.d
 cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
 ln -s /usr/local/mysql/bin/mysql /usr/bin/mysql
 echo '/etc/init.d/mysqld start' >> /etc/rc.local
 mkdir -p /data/mysql-{data,binlogs}
 chown -R mysql.mysql /data/
 vim /usr/local/mysql/my.cnf
 free -h
 cat /proc/cpuinfo
 vim /usr/local/mysql/my.cnf
 /usr/local/mysql/bin/mysqld --defaults-file=/usr/local/mysql/my.cnf --initialize --user=mysql --datadir=/data/mysql-data
 /etc/init.d/mysqld start
 yum install libaio-devel libaio
 /usr/local/mysql/bin/mysqld --defaults-file=/usr/local/mysql/my.cnf --initialize --user=mysql --datadir=/data/mysql-data
 /etc/init.d/mysqld start
 grep password /usr/local/mysql/log/mysql-error.log
 mysql -A -uroot -p'Q)u;ol3k5F'
 mysql -A -uroot -p'Q)u;ol3k5F' -S /tmp/mysql.sock
 mysql -A -uroot -p -S/tmp/mysql.sock
 mysql -A -uroot -p -S/tmp/mysql.sock --help
 mysql -A -uroot -p'Q)u;ol3k5F' -S /tmp/mysql.sock
 mysql -uroot -p'Q)u;ol3k5F' -S /tmp/mysql.sock
 /usr/local/mysql/bin/mysql -uroot -p'Q)u;ol3k5F' -S /tmp/mysql.sock