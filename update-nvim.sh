#!/bin/bash
rm -rf ~/.config;

# Folder structure
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors/

# File Copy
cp -r $PWD/nvim/init.vim ~/.config/nvim/init.vim
cp -r $PWD/nvim/colors/mustang.vim ~/.config/nvim/colors/mustang.vim
