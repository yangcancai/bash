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
