#!/bin/bash
# @todo add colors
# @todo add progress bar

cd "$(dirname "$0")"


clear


rm -rf ~/.vim


if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


. ./update-gitconfig.sh
. ./update-vimrc.sh
. ./update-snippets.sh
. ./update-bash_aliases.sh


vim -c 'PluginInstall' -c 'qa!'


cp -f $PWD/tmux.conf ~/.tmux.conf
