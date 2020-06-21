#!/bin/bash
. ./util.sh
cmd_exists scl
if [ $? -eq '0' ]; then
	echo_eval yum -y install centos-release-scl
fi
echo_eval yum -y install sclo-git25
if [ `grep -c "source /opt/rh/sclo-git25/enable" /etc/profile` -eq '0' ];then
	echo "source /opt/rh/sclo-git25/enable" >> /etc/profile
else
	print "sclo-git25 already append to /etc/profile"
fi
if [ `scl -l | grep -c "sclo-git25"` -eq '0' ];then
	echo_eval scl enable sclo-git25 bash
else
	print "sclo-git25 already install"
fi
echo_eval git config --global credential.helper store
