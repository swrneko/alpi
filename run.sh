#! /bin/bash

# TYY color varibles
VERSION="v0.0.1 BETA"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PURPLE="\033[35m"
LBLUE="\033[36m"
WHITE="\033[37m"
RESET='\033[0m'

# System varibles
IS_NETWORK_WORKING="None"

# User changing
USER_ACTION_MAIN_MENU="null"
USER_ACTION_LANGUAGE_MENU="null"
ANSWER="null"

# Languages
LANGUAGE="English"
CURRENT_LANGAGE="$GREEN $LANGUAGE $RESET"

# Installation parameters state
STATE_KB_LAYOUT="NO"
STATE_MIRROR_REG="NO"
STATE_DRIVE="NO"
STATE_BOOTLOADER="NO"
STATE_DRIVE_LAYOUT="NO"
STATE_ENCRYPT="NO"
STATE_SWAP="NO"
STATE_HOSTNAME="NO"
STATE_USERS="NO"
STATE_PASSWORD="NO"
STATE_DE="NO"
STATE_AUDIO="NO"
STATE_KERNEL="NO"
STATE_NETWORK="NO"
STATE_TIMEZONE="NO"
STATE_NTP="NO"
STATE_REPOSITORIES="NO"
STATE_GPU_DRIVER="NO"
STATE_GAME_THINGS="NO"
STATE_PROFILES="NO"

# Startup command for check internet and arch linux kernel revision
startup() {
  clear
  if ping -c 1 "google.com" &> /dev/null;
  then
    IS_NETWORK_WORKING="$GREEN On $RESET"
  else
    IS_NETWORK_WORKING="$RED Off$RESET"
  fi

  KERNEL_REV="$GREEN`uname -r`$RESET"
}

alpiMenuHeader() {
  echo "/================================================\\"
  echo -e "|$PURPLE     ~~~~~~~~~~~~~~ [ ALPI ] ~~~~~~~~~~~~~~     $RESET|"
  echo -e "|$PURPLE      Arch Linux Pseudographical Installer      $RESET|"
  echo -e "|$PURPLE     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     $RESET|"
  echo "\\================================================/"
}

# Main menu pseudographical interface
mainMenu() {
echo "/================================================\\"
echo -e "|$LBLUE     ~~~~~~~~~~~ [ Main menu ] ~~~~~~~~~~~~     $RESET|"
echo -e "|$LBLUE       Here you can change some parameters      $RESET|"
echo -e "|$LBLUE     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     $RESET|"
echo "|------------------------------------------------|"
echo "|  Parameters:           |   System info:        |"
echo -e "|  0)  [Change Language] |   Network:$IS_NETWORK_WORKING        |"
echo "|                        |                       |"
echo "|  1)  [Start install]   |   Kernel:             |"
echo -e "|                        |   $KERNEL_REV      |"
echo -e "| $GREEN $VERSION $RESET          |                       |"
echo "|------------------------------------------------|"
echo -e "|                    $RED Q) Quit $RESET                   |"
echo "\\================================================/"
}

# Language changing menu
languageMenu() {
  echo "/================================================\\"
  echo -e "|$LBLUE     ~~~~~ [ Language Changing Menu ] ~~~~~     $RESET|"
  echo -e "|$LBLUE      Here you can change display language      $RESET|"
  echo -e "|$LBLUE     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     $RESET|"
  echo "\\------------------------------------------------/"
  echo "|  Avalible languages:    Current language:      |"
  echo -e "|                        $GREEN $LANGUAGE $RESET               |"
  echo "|  0) [Russian]                                  |"
  echo "|------------------------------------------------|"
  echo -e "|                    $RED B) Back $RESET                   |"
  echo "\\================================================/"
}

# Exit screen pseudographical interface 
exitScreen() {
  echo "/================================================\\"
  echo "|                See you later...                |"
  echo "\\================================================/"
  sleep 0.35
}

# Unknown command hendler
userUnknownCommand() {
  echo "Unknown command, try again"
  readUserActionMainMenu
}

# User action in language menu hendler
readUserActionLanguageMenu() {
  read -p "Await action: " USER_ACTION_LANGUAGE_MENU
  if [ $USER_ACTION_LANGUAGE_MENU = "B" ] || [ $USER_ACTION_LANGUAGE_MENU = "b" ];
  then
    clear
    alpiMenuHeader
    mainMenu
    readUserActionMainMenu
  elif [ $USER_ACTION_LANGUAGE_MENU = "0" ];
  then
    LANGUAGE="Russian"
    clear
    alpiMenuHeader
    languageMenu
    readUserActionLanguageMenu
  fi
}

# User action hendler
readUserActionMainMenu() {
  read -p "Await action: " USER_ACTION_MAIN_MENU
  if [ $USER_ACTION_MAIN_MENU = "Q" ] || [ $USER_ACTION_MAIN_MENU = "q" ]; # Exit program
  then
    clear
    alpiMenuHeader
    exitScreen
  elif [ $USER_ACTION_MAIN_MENU = "0" ]; # Change language
  then
    clear
    alpiMenuHeader
    languageMenu
    readUserActionLanguageMenu
  elif [ $USER_ACTION_MAIN_MENU = "1" ]; # Start installation
  then
    clear
    alpiMenuHeader
    startInstallMenu
  else
    userUnknownCommand
  fi
}

startInstallMenu() {
  echo "/================================================\\"
  echo -e "|$LBLUE     ~~~~~~~~~~ [ Start Install ] ~~~~~~~~~     $RESET|"
  echo -e "|$LBLUE       Here starts new point of your life       $RESET|"
  echo -e "|$LBLUE     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     $RESET|"
  echo "|------------------------------------------------|"
  echo "|  Points:                 |                     |"
  echo "|                          |                     |"
  echo "|  0) Keyboard Layout      |  SET: $STATE_KB_LAYOUT            |"
  echo "|  1) Mirror region        |  SET: $STATE_MIRROR_REG            |"
  echo "|  2) Select drive(s)      |  SET: $STATE_DRIVE            |"
  echo "|  3) Select drive layout  |  SET: $STATE_DRIVE_LAYOUT            |"
  echo "|  4) Select bootloader    |  SET: $STATE_BOOTLOADER            |"
  echo "|  5) Set encrypt          |  SET: $STATE_ENCRYPT            |"
  echo "|  6) Use swap             |  SET: $STATE_SWAP            |"
  echo "|  7) Hostname             |  SET: $STATE_HOSTNAME            |"
  echo "|  8) Create users         |  SET: $STATE_USERS            |"
  echo "|  9) Set password         |  SET: $STATE_PASSWORD            |"
  echo "|  10) Set DE/WM           |  SET: $STATE_DE            |"
  echo "|  11) Set audioserver     |  SET: $STATE_AUDIO            |"
  echo "|  12) Select Kernel       |  SET: $STATE_KERNEL            |"
  echo "|  13) Setup network       |  SET: $STATE_NETWORK            |"
  echo "|  14) Select timezone     |  SET: $STATE_TIMEZONE            |"
  echo "|  15) Set time sync       |  SET: $STATE_NTP            |"
  echo "|  16) Set repositories    |  SET: $STATE_REPOSITORIES            |"
  echo "|  17) Set GPU driver      |  SET: $STATE_GPU_DRIVER            |"
  echo "|  18) Game things         |  SET: $STATE_GAME_THINGS            |"
  echo "|  19) Profiles            |  SET: $STATE_PROFILES            |"
  echo "|                          |                     |"
  echo "|------------------------------------------------|"
  echo -e "|   $RED A) Abort $RESET $YELLOW S) Save profile $RESET $GREEN I) Install $RESET    |"
  echo -e "|   $RED B) Back (with no save) $RESET                     |"
  echo "\\================================================/"
}

# Main body
startup
alpiMenuHeader
mainMenu
readUserActionMainMenu
