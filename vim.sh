#!/bin/bash

. ./util.sh
echo_eval yum remove vim
echo_eval yum install -y ruby ruby-devel lua lua-devel luajit \
luajit-devel ctags git python python-devel \
python3 python3-devel tcl-devel \
perl perl-devel perl-ExtUtils-ParseXS \
perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
perl-ExtUtils-Embed libX11-devel
echo_eval yum install ncurses-devel -y
echo_eval git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope --prefix=/usr/local/vim/
make
make install
if [ `grep -c "/usr/local/vim/bin" /etc/profile` -eq 0 ]; then
	echo "PATH=$PATH:/usr/local/vim/bin" >> /etc/profile
	echo "export PATH" >> /etc/profile
	source /etc/profile
fi
