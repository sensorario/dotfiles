#!/bin/bash
cd "$(dirname "$0")"

clear
figlet install


if [ $# -eq 0 ]
  then
    echo "Install starts ..."
  else
    echo $1
    if [ $1 == "--gitconfig" ]
    then
      # Build custom giconfig file
      echo What is your name?
      read committer_user
      echo What is your email?
      read committer_email
      sed "s/{{committer_user}}/$committer_user/g" <./gitconfig.dist >./temp
      sed "s/{{committer_email}}/$committer_email/g" <./temp >./gitconfig
      . ./update-gitconfig.sh
    else
      echo "Wrong parameter value"
      echo "Available ones:"
      echo ""
      echo "--gitconfig"
      echo ""
      exit
    fi
fi

rm -rf ~/.vim;

if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


// more themes
rm -rf ~/.vim/colors/despacio.vim
git clone https://github.com/AlessandroYorba/Despacio.git && cd despacio.git/colors/ && mv despacio.vim ~/.vim/colors/despacio.git/colors/despacio.vim 


cp -f $PWD/gitignore_global ~/.gitignore_global;

. ./update-vimrc.sh
. ./update-snippets.sh
. ./update-bash_aliases.sh
. ./update-colorscheme.sh


vim -c 'PluginInstall' -c 'qa!';

cd ~/.vim/bundle/vim-create; git checkout v1.0.3; cd -;

cp -f $PWD/tmux.conf ~/.tmux.conf;

. ./update-nvim.sh
