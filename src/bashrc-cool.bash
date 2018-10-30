
if [[ ${1} == "--help" ]];then
	echo "Help menu";
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

cd ~

GETBRC="$(pwd)/.bashrc"
GETCUR="$(pwd)/current-bashrc-cool.bash"


### MENU ###
echo -ne "--- BashRC Cool Configuration ---\n"
if [[ -z $(cat ${GETBRC} | grep "${GETCUR}") ]]
then
	echo "${GETCUR}" >> ${GETBRC}
	echo "INFO: Script added to ${GETBRC}\n\n"
else
	echo -ne "INFO: Script already exist in ${GETBRC}\n\n"
fi
echo " * Theme lists :"
for THEME in $(ls ${DATA}/themes/ | sed 's/[.]/ /g' | awk '{print $1}')
do
	echo "   => ${THEME}"
done

echo -ne "\n select-theme~>> "
read SELECTED
### MEOF ###

echo ""
if [[ ! $(ls ${DATA}/themes/ | sed 's/[.]/ /g' | awk '{print $1}' | grep ^"${SELECTED}"$) ]];
then
	echo "ERROR: Themes does not exist!"
	exit
else
	THM=$(ls ${DATA}/themes/ | sed 's/[.]/ /g' | awk '{print $1}' | grep ^"${SELECTED}"$)
	cat ${DATA}/themes/${THM}.bash > ${GETCUR}
	chmod +x ${GETCUR}
	echo "DONE: .bashrc changed!"
fi
