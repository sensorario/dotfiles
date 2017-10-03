#!/bin/bash
rm -rf ~/.config;

# recreate folders
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors/
mkdir -p ~/.config/nvim/snippets/

# copy new configuration
cp -r $PWD/vim/colors/ ~/.config/nvim/colors/
ln -s $PWD/vimrc ~/.config/nvim/init.vim
ln -s $PWD/snippets ~/.config/nvim/snippets/

# install deoplete plugin
git clone git@github.com:Shougo/deoplete.nvim.git ~/.config/nvim/deoplete.vim
vim -c ':UpdateRemotePlugins' -c qa
