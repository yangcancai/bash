# !/bin/bash
. ./util.sh
cmd_exists scl
if [ $? -eq '0' ]; then
	echo_eval yum -y install centos-release-scl
else
	print "scl already exist"
fi

if [ `grep -c "source /opt/rh/devtoolset-8/enable" /etc/profile` -eq '0' ];then
	echo_eval yum -y install devtoolset-8
	echo "source /opt/rh/devtoolset-8/enable" >>/etc/profile
else
        print "devtoolset-8 already append to /etc/profile"
fi
echo_eval scl enable devtoolset-8 bash
# all new shell will enbale
## download cmake 3.17.3
cmd_exists wget
if [ $? -eq '0' ]; then
	echo_eval yum -y install wget openssl openssl-devel
fi
if [ `cmake --version | grep -c "3.17.3"` -eq 0 ]; then
	echo_eval wget https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz
	tar xf cmake-3.17.3.tar.gz
	cd cmake-3.17.3
	./bootstrap
	make
	make install
else
	print "cmake already install"
fi
ret=`cmake --version`	
print "$ret"


