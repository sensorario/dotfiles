#!/bin/bash
cd "$(dirname "$0")"


clear


rm -rf ~/.vim


if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


. install-vimrc.sh
. install-snippets.sh
. install-bash_aliases.sh


vim -c 'PluginInstall' -c 'qa!'


sudo cp -f $PWD/tmux.conf ~/.tmux.conf
