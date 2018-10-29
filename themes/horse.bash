#!/bin/bash
RED='\e[1;31m'
GREEN='\e[1;32m'
WHITE='\e[1;37m'
RESET='\e[39m';
echo "";
echo -e "${WHITE}                    ::     ";
echo -e "                  ,::'\    ";
echo -e "       __       ,::' ' \   ";
echo -e "     /'  '\'~~'~' \ /'\.)  ";
echo -e "  ,:(      )    /  |       ";
echo -e " ,:' \    /-.,,(   )       ";
echo -e "      ) /       ) /        ";
echo -e "      ||        ||         ";
echo -e "      (_\       (_\        ";
echo "";
echo -e " ${RED}Hello! ${GREEN}$(whoami)${RED}...${RESET}";
echo -e " Now is $(date +"%d-%b-%Y %H:%M")${RESET}";
echo "";
