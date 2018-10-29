#!/bin/bash
VERSION="1.2";

if [[ ${1} == "--help" ]];then
	echo "Help menu";
	exit;
elif [[ ${1} == "--update" ]];then
	if [[ -z $(command -v curl) ]];then
		echo "ERROR: curl not found, please install curl";
		exit;
	fi
	echo "INFO: Updating...";
	curl -s "https://raw.githubusercontent.com/novranfaathir/bashrc-cool/master/bashrc-cool.bash" > /usr/bin/bashrc-cool
	echo "INFO: Done!"
	exit;
elif [[ -z ${1} ]];then
	echo -ne "";
else
	echo "ERROR: Invalid parameter, please using --help";
	exit;
fi

if [[ -z $(command -v curl) ]];then
	echo "ERROR: curl not found, please install curl";
	exit;
fi

if [[ -z $(ls -la ~ | grep '[.]bashrc') ]];then
	echo "ERROR: ~/.bashrc not found";
	exit;
fi

echo " BashRC-Cool 1.0 Configuration ";
echo "";
echo " Select your themes : ";
echo " [1]. Rose";
echo " [2]. Horse";
echo -ne " >> ";read SELECTED;

cd ~
CURTHEME=$(echo "$(pwd)/bashrc-cool-current.bash");

if [[ -z $(cat ~/.bashrc | grep bashrc-cool-current.bash) ]];then
	cd ~
	CURTHEME=$(echo "$(pwd)/bashrc-cool-current.bash");
	echo "${CURTHEME}" >> ~/.bashrc
fi
if [[ ! -f "${CURTHEME}" ]];then
	touch ${CURTHEME}
	chmod 777 ${CURTHEME}
fi
if [[ ${SELECTED} == "1" ]];then
	curl -s "https://raw.githubusercontent.com/novranfaathir/bashrc-cool/master/themes/rose.bash" > ${CURTHEME}
elif [[ ${SELECTED} == "2" ]];then
	curl -s "https://raw.githubusercontent.com/novranfaathir/bashrc-cool/master/themes/horse.bash" > ${CURTHEME}
else
	echo "ERROR: Invalid parameter";
fi
