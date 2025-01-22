#!/bin/bash
# vim:fileencoding=utf-8:foldmethod=marker
#author:	fairdinkum batan
#mail:		12982@tutanota.com
------------------------------------------------------------------------------------------------

#{{{###  clear command and ansi coloring
clear
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
BBlue='\e[0;104m'
BBlack='\e[0;100m'
RRed='\e[0;100m'
GGreen='\e[0;100m'
YYellow='\e[0;100m'
BBlue='\e[0;100m'
PPurple='\e[0;100m'
CCyan='\e[0;100m'
WWhite='\e[0;100m'

#}}}
#{{{###
DIR_BASE="/home/batan/lcrepositories"
DIR_TARGET="/etc/apt"
clear
read -p "Please provide a passphrase   >>>   " passphrase
gpg --batch --yes --passphrase $passphrase --decrypt sources.list.d.tar.gz.gpg >> sources.list.d.tar.gz
gpg --batch --yes --passphrase $passphrase --decrypt trusted.gpg.tar.gz.gpg >> trusted.gpg.tar.gz
sudo tar vfcz /etc/apt/backup.tar.gz /etc/apt/sources.list.d/* /etc/apt/trusted.gpg.d/*
sudo tar vfxz $DIR_BASE/sources.list.d.tar.gz --directory=/etc/apt/sources.list.d
sudo tar vfxz $DIR_BASE/trusted.gpg.tar.gz --directory=/etc/apt/trusted.gpg.d
sudo apt update
sudo trash $DIR_BASE

#}}}




