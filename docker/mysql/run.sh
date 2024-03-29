#!/bin/bash
#开启 sshd 服务，若不需要，可以注释掉下面一行。
# /usr/sbin/sshd &

VOLUME_HOME="/var/lib/mysql"
CONF_FILE="/etc/mysql/conf.d/my.cnf"
LOG="/var/log/mysql/error.log"


StartMySQL ()
{
    /usr/sbin/mysqld > /dev/null 2>&1 &

    # Time out in 1 minute
    LOOP_LIMIT=13
    for (( i=0 ; ; i++ )); do
        if [ ${i} -eq ${LOOP_LIMIT} ]; then
            echo "Time out. Error log is shown as below:"
            tail -n 100 ${LOG}
            exit 1
        fi
        echo "=> Waiting for confirmation of MySQL service startup, trying ${i}/${LOOP_LIMIT} ..."
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1 && break
    done
}

CreateMySQLUser()
{
	StartMySQL
	if [ "$MYSQL_PASS" = "**Random**" ]; then
	    unset MYSQL_PASS
	fi

	PASS=${MYSQL_PASS:-$(pwgen -s 12 1)}
	_word=$( [ ${MYSQL_PASS} ] && echo "preset" || echo "random" )
	echo "=> Creating MySQL user ${MYSQL_USER} with ${_word} password"

	mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '$PASS'"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"


	echo "=> Done!"

	echo "========================================================================"
	echo "You can now connect to this MySQL Server using:"
	echo ""
	echo "    mysql -u$MYSQL_USER -p$PASS -h<host> -P<port>"
	echo ""
	echo "Please remember to change the above password as soon as possible!"
	echo "MySQL user 'root' has no password but only allows local connections"
	echo "========================================================================"

	mysqladmin -uroot shutdown
}
init(){
# Set permission of config file
chmod 644 ${CONF_FILE}
chmod 644 /etc/mysql/conf.d/mysqld_charset.cnf

if [ ${REPLICATION_MASTER} == "**False**" ]; then
    unset REPLICATION_MASTER
fi

if [ ${REPLICATION_SLAVE} == "**False**" ]; then
    unset REPLICATION_SLAVE
fi

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then
        cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
    fi 
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    echo "=> Creating admin user ..."
    CreateMySQLUser
else
    echo "=> Using an existing volume of MySQL"
fi


# Set MySQL REPLICATION - MASTER
if [ -n "${REPLICATION_MASTER}" ]; then 
    echo "=> Configuring MySQL replication as master ..."
    if [ ! -f /replication_configured ]; then
        RAND="$(date +%s | rev | cut -c 1-2)$(echo ${RANDOM})"
        echo "=> Writting configuration file '${CONF_FILE}' with server-id=${RAND}"
        sed -i "s/^#server-id.*/server-id = ${RAND}/" ${CONF_FILE}
        sed -i "s/^#log-bin.*/log-bin = mysql-bin/" ${CONF_FILE}
        echo "=> Starting MySQL ..."
        StartMySQL
        echo "=> Creating a log user ${REPLICATION_USER}:${REPLICATION_PASS}"
        mysql -uroot -e "CREATE USER '${REPLICATION_USER}'@'%' IDENTIFIED BY '${REPLICATION_PASS}'"
        mysql -uroot -e "GRANT REPLICATION SLAVE ON *.* TO '${REPLICATION_USER}'@'%'"
        echo "=> Done!"
        mysqladmin -uroot shutdown
        touch /replication_configured
    else
        echo "=> MySQL replication master already configured, skip"
    fi
fi

# Set MySQL REPLICATION - SLAVE
if [ -n "${REPLICATION_SLAVE}" ]; then 
    echo "=> Configuring MySQL replication as slave ..."
    if [ -n "${MYSQL_PORT_3306_TCP_ADDR}" ] && [ -n "${MYSQL_PORT_3306_TCP_PORT}" ]; then
        if [ ! -f /replication_configured ]; then
            RAND="$(date +%s | rev | cut -c 1-2)$(echo ${RANDOM})"
            echo "=> Writting configuration file '${CONF_FILE}' with server-id=${RAND}"
            sed -i "s/^#server-id.*/server-id = ${RAND}/" ${CONF_FILE}
            sed -i "s/^#log-bin.*/log-bin = mysql-bin/" ${CONF_FILE}
            echo "=> Starting MySQL ..."
            StartMySQL
            echo "=> Setting master connection info on slave"
            mysql -uroot -e "CHANGE MASTER TO MASTER_HOST='${MYSQL_PORT_3306_TCP_ADDR}',MASTER_USER='${MYSQL_ENV_REPLICATION_USER}',MASTER_PASSWORD='${MYSQL_ENV_REPLICATION_PASS}',MASTER_PORT=${MYSQL_PORT_3306_TCP_PORT}, MASTER_CONNECT_RETRY=30"
            echo "=> Done!"
            mysqladmin -uroot shutdown
            touch /replication_configured
        else
            echo "=> MySQL replicaiton slave already configured, skip"
        fi
    else 
        echo "=> Cannot configure slave, please link it to another MySQL container with alias as 'mysql'"
        exit 1
    fi
fi
}
build_docker(){
    docker build --compress --rm -t mysql_test .
}
sh_docker(){
    PWD=`pwd`
    mkdir -p $PWD/datadir
    docker run -it --rm -v $PWD/datadir:/var/lib/mysql -p 3307:3306 mysql_test /bin/bash -c sh
}
start(){
    rm -rf /var/lib/mysql
    ## initialize
    mysqld --initialize --user=root
    ## start
    mysqld --user=root &
    ## 获取密码
    PASS=`cat /var/log/mysqld.log | grep 'A temporary password' | awk -F 'root@localhost: ' '{print $2}'` 
    echo "[client]
user=root
password='$PASS'
port=3306
host=127.0.0.1
database=mysql" > /root/.my.cnf
    ##
    sleep 1s
    mysql --connect-expired-password -e "alter user 'root'@'localhost' identified by '123456'"
    ## 
    echo "[client]
user=root
password=123456
port=3306
host=127.0.0.1
database=mysql" > /root/.my.cnf
    mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '123456';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
}
case $1 in
build_docker) build_docker;;
sh_docker) sh_docker;;
start) start;;
esac
# exec mysqld_safe
