#!/bin/bash
cd "$(dirname "$0")"

# overwrite plugins
rm -rf ~/.vim
cp -f $PWD/vimrc ~/.vimrc
if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +PluginInstall! +qall > /dev/null 2>&1

. install-snippets.sh

# overwrite tmux configuration
cp -f $PWD/tmux.conf ~/.tmux.conf
