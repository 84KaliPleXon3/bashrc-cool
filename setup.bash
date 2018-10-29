#!/bin/bash

if [[ $(whoami) != "root" ]];then
	echo "ERROR: Please setup with root";
fi
if [[ -z $(command -v curl) ]];then
	echo "ERROR: curl not found, please install curl";
	exit;
fi
curl -s "https://raw.githubusercontent.com/novranfaathir/bashrc-cool/master/bashrc-cool.bash" > /usr/bin/bashrc-cool
chmod 777 /usr/bin/bashrc-cool
ln -sf /usr/bin/bashrc-cool /usr/bin/local/bashrc-cool
echo "DONE: Please run it with command: bashrc-cool";
