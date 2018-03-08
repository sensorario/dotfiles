#!/bin/bash
cd "$(dirname "$0")"

clear
figlet install

rm -rf ~/.vim;

if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


// more themes
rm -rf ~/.vim/colors/despacio.vim
git clone https://github.com/AlessandroYorba/Despacio.git && cd despacio.git/colors/ && mv despacio.vim ~/.vim/colors/despacio.git/colors/despacio.vim 


cp -f $PWD/gitignore_global ~/.gitignore_global;

. ./update-gitconfig.sh
. ./update-vimrc.sh
. ./update-snippets.sh
. ./update-bash_aliases.sh
. ./update-colorscheme.sh


vim -c 'PluginInstall' -c 'qa!';

cd ~/.vim/bundle/vim-create; git checkout 1.0.2; cd -;

cp -f $PWD/tmux.conf ~/.tmux.conf;

. ./update-nvim.sh
