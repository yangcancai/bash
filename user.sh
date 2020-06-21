#!/bin/bash
. ./util.sh

u="$1"
h=/home/$u
ssh_dir=$h/.ssh
#create user if not exists
egrep "^$u" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
	echo_eval adduser $u
	echo_eval passwd $u 
	echo_eval usermod -a -G wheel $u
fi
echo_eval create_dir $ssh_dir 
echo_eval create_file $ssh_dir/authorized_keys
echo_eval create_dir $ssh_dir/keys
echo_eval ssh-keygen
cat /root/.ssh/id_rsa.pub >> $ssh_dir/authorized_keys
echo_eval mv /root/.ssh/id_rsa* $ssh_dir/keys
echo_eval chown -R $u:$u $ssh_dir 
echo_eval chmod 700 $ssh_dir 
echo_eval chmod 600 $ssh_dir/authorized_keys
