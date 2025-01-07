#! /bin/bash

VERSION="v0.0.1 BETA"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PURPLE="\033[35m"
LBLUE="\033[36m"
WHITE="\033[37m"
RESET='\033[0m'

IS_NETWORK_WORKING="Off"
KERNEL_REV=`uname -r`

clear
if ping -c 1 "google.com" &> /dev/null;
then
  IS_NETWORK_WORKING="$GREEN On $RESET"
else
  IS_NETWORK_WORKING="$RED Off$RESET"
fi

echo "/================================================\\"
echo -e "|$LBLUE      ~~~~~~~~~~~~~~ [ ALPI ] ~~~~~~~~~~~~~~    $RESET|"
echo -e "|$LBLUE      Arch Linux Pseudographical Installer      $RESET|"
echo -e "|$LBLUE     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     $RESET|"
echo "\\================================================/"
echo "/================================================\\"
echo -e "|$LBLUE      ~~~~~~~~~~ [ Main menu ] ~~~~~~~~~~~~     $RESET|"
echo -e "|$LBLUE       Here you can change some parameters      $RESET|"
echo -e "|$LBLUE      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     $RESET|"
echo "|------------------------------------------------|"
echo "|  Parameters:           |   System info:        |"
echo -e "|  0)  [Change Language] |   Network:$IS_NETWORK_WORKING        |"
echo "|                        |                       |"
echo "|  1)  [Start install]   |   Kernel:             |"
echo -e "|                        |  $GREEN $KERNEL_REV $RESET     |"
echo -e "| $GREEN $VERSION $RESET          |                       |"
echo "|------------------------------------------------|"
echo -e "|                    $RED Q) Quit $RESET                   |"
echo "\\================================================/"
