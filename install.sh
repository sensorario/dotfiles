#!/bin/bash

clear

echo "Defining colors ..."
information=`tput setaf 2`
reset=`tput sgr0`
echo "${information}Colors defined ...${reset}"

echo "${information}Change directory${reset}"
cd "$(dirname "$0")"
echo "${information}$(pwd)${reset}"

echo "${information}Update git configuration${reset}"
if [[ $1 == "--gitconfig" || ! -f ~/.gitconfig ]]
then
  . ./update-gitconfig.sh
fi

echo "${information}Update neovim${reset}"
. ./update-nvim.sh
