#!/bin/bash

printf "\nCopying git configuration"
cp ~/.gitconfig gitconfig

printf "\nCopying bash_aliases configuration"
cp ~/.bash_aliases bash_aliases

printf "\nCopying profile"
cp ~/.profile profile
cp ~/.zshrc zshrc

printf "\nCopying neovim configurations"
cp -r ~/.config/nvim/init.vim nvim/init.vim

printf "\n\n"
