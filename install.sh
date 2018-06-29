#!/bin/bash
cd "$(dirname "$0")"

clear
figlet install

if [[ $1 == "--gitconfig" || ! -f ~/.gitconfig ]]
then
  . ./update-gitconfig.sh
fi

rm -rf ~/.vim;

if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

. ./update-vimrc.sh
. ./update-snippets.sh
. ./update-bash_aliases.sh
. ./update-colorscheme.sh


vim -c 'PluginInstall' -c 'qa!';

cd ~/.vim/bundle/vim-create; git checkout v1.0.3; cd -;

cp -f $PWD/tmux.conf ~/.tmux.conf;

. ./update-nvim.sh
