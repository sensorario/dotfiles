#!/bin/bash
cd "$(dirname "$0")"

# overwrite plugins
rm -rf ~/.vim
if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
sudo vim +PluginInstall! +qall > /dev/null 2>&1

. install-snippets.sh
. install-vimrc.sh

cp -f $PWD/tmux.conf ~/.tmux.conf
