#!/bin/bash
cd "$(dirname "$0")"

clear
figlet install

if [ $1 == "--gitconfig" ] || [ ! -f ~/.gitconfig ]
then
  echo What is your name?
  read committer_user
  echo What is your email?
  read committer_email
  sed "s/{{committer_user}}/$committer_user/g" <./gitconfig.dist >./temp
  sed "s/{{committer_email}}/$committer_email/g" <./temp >./gitconfig
  . ./update-gitconfig.sh
fi

rm -rf ~/.vim;

if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


// more themes
rm -rf ~/.vim/colors/despacio.vim
git clone https://github.com/AlessandroYorba/Despacio.git && cd despacio.git/colors/ && mv despacio.vim ~/.vim/colors/despacio.git/colors/despacio.vim 

cp -f $PWD/gitignore ~/.gitignore;

. ./update-vimrc.sh
. ./update-snippets.sh
. ./update-bash_aliases.sh
. ./update-colorscheme.sh


vim -c 'PluginInstall' -c 'qa!';

cd ~/.vim/bundle/vim-create; git checkout v1.0.3; cd -;

cp -f $PWD/tmux.conf ~/.tmux.conf;

. ./update-nvim.sh
