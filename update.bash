#!/bin/bash

if [[ $(whoami) != "root" ]]
then
	echo "ERROR: Please update with user root"
	exit
fi

if [[ -d "/tmp/bashrc-cool" ]]
then
	rm -rf /tmp/bashrc-cool
fi

git clone https://github.com/panophan/bashrc-cool.git /tmp/bashrc-cool

cd /tmp/bashrc-cool
chmod +x setup.bash
./setup.bash
echo "DONE: Update success!"
