 FROM centos:7
#安装mysql服务

RUN yum update -y && \
yum install wget rpm -y && \
wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm && \
  yum localinstall mysql57-community-release-el7-7.noarch.rpm -y && \
  rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 &&\
  yum install mysql-community-server -y


# 删除预安装的数据库文件

RUN rm -rf /var/lib/mysql/*



# 添加文件夹下的 MYSQL 配置文件

ADD my.cnf /etc/mysql/conf.d/my.cnf

ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf



# 添加 MYSQL 的脚本

ADD import_sql.sh /import_sql.sh

ADD run.sh /run.sh

RUN chmod 755 /*.sh



# 设置环境变量，用户名以及秘密

ENV MYSQL_USER admin

ENV MYSQL_PASS **Random**



# 设置主从复制模式下的环境变量

ENV REPLICATION_MASTER **False**

ENV REPLICATION_SLAVE **False**

ENV REPLICATION_USER replica

ENV REPLICATION_PASS replica



# 设置可以允许挂载的卷，可以用来备份数据库和配置文件

VOLUME  ["/etc/mysql", "/var/lib/mysql"]



# 设置可以映射的端口

EXPOSE 3306



# 设置自启动的脚本

CMD ["/run.sh", "start"]
