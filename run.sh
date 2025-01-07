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
    startInstallMenu
  else
    userUnknownCommand
  fi
}

# Main body
startup
alpiMenuHeader
mainMenu
readUserActionMainMenu
