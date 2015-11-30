#!/bin/bash
# @todo add som other source file to copy from local machine to this folder

printf "\nCopying vimrc configuration"
cp ~/.vimrc vimrc

printf "\nCopying tmux configuration"
cp ~/.tmux.conf tmux.conf

printf "\nCopying tmux configuration"
cp ~/.tmux.conf tmux.conf

printf "\nCopying git configuration"
cp ~/.gitconfig gitconfig

printf "\nCopying bash_aliases configuration"
cp ~/.bash_aliases bash_aliases

printf "\nCopying snippets"
cp -Rf ~/.vim/snippets/* ./snippets/

printf "\n\n"
