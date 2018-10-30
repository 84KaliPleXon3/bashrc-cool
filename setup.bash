#!/bin/bash

if [[ $(whoami) != "root" ]];
then
	echo "ERROR: Please setup using root"
	exit
fi

if [[ -d "/opt" ]];
then
	if [[ -d ${DATA} ]]
	then
		rm -rf ${DATA}
	fi
	mkdir /opt/bashrc-cool
	mkdir /opt/bashrc-cool/themes
	chmod -R 744 /opt/bashrc-cool
	DATA="/opt/bashrc-cool"
else
	echo "ERROR: \"/opt\" not found"
	exit
fi

cp -R themes/* ${DATA}/themes/
touch ${DATA}/bashrc-cool.bash
chmod 755 ${DATA}/bashrc-cool.bash
echo '#!/bin/bash' > ${DATA}/bashrc-cool.bash
echo "DATA=\"${DATA}\"" >> ${DATA}/bashrc-cool.bash
cat src/bashrc-cool.bash >> ${DATA}/bashrc-cool.bash
ln -sf ${DATA}/bashrc-cool.bash /usr/bin/bashrc-cool 2> /dev/null
ln -sf ${DATA}/bashrc-cool.bash /usr/local/bin/bashrc-cool 2> /dev/null
chmod -R 755 ${DATA}
