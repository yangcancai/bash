#!/bin/bash

print()
{
        #echo -e “\033[34m 蓝色字 \033[0m” 
        echo -e "\033[32m ==> $1\033[0m"
}
echo_eval()
{
	CMD="$1"
	i=0
	for par in $@; do
	if [ $i -ne 0 ];then
		CMD="$CMD $par"
	fi
	let i=i+1
	done
	print "$CMD"		
	eval $CMD
}
cmd_exists()
{
	local ret=0;
	command -v $1 >/dev/null 2>&1 || { local ret=1; }
	if [ "$ret" -ne 0 ]; then
		return 0;
	fi
	return 1
}
create_dir()
{
	if [ ! -d $1 ]; then
		echo_eval mkdir $1
	else
		print "$1 directory already exists"
	fi
}
create_file()
{
	if [ ! -f $1 ]; then
		touch $1
	fi
}
install_normal()
{
	cmd_exists rz
	if [ $? -eq 0 ]; then
		echo_eval yum -y install lrzsz	
	fi
}
