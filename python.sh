#!/bin/bash

. ./util.sh

echo_eval yum -y install rh-python35
if [ `grep -c "python35" /etc/profile` -eq 0 ]; then
	echo "source /opt/rh/rh-python35/enable" >> /etc/profile
else
	print "rh-python35 already append to /etc/profile"
fi
echo_eval scl enable rh-python35 bash
