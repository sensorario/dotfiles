#!/bin/bash
cd "$(dirname "$0")"

if [[ $1 == "--gitconfig" || ! -f ~/.gitconfig ]]
then
  . ./update-gitconfig.sh
fi

rm -rf ~/.vim;

. ./update-vimrc.sh

cp -f $PWD/tmux.conf ~/.tmux.conf;

# vim 8
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/default/start/typescript-vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/default/start/nerdtree-vim
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight ~/.vim/pack/default/start/vim-nerdtree-syntax-highlight
git clone https://github.com/gmarik/Vundle.vim ~/.vim/pack/default/start/Vundle.vim
git clone https://github.com/fugitive.vim ~/.vim/pack/default/start/fugitive.vim
git clone https://github.com/MarcWeber/vim-addon-mw-utils ~/.vim/pack/default/start/vim-addon-mw-utils
git clone https://github.com/tomtom/tlib_vim ~/.vim/pack/default/start/tlib_vim
git clone https://github.com/tommcdo/vim-lion ~/.vim/pack/default/start/vim-lion
git clone https://github.com/vim-php/vim-composer ~/.vim/pack/default/start/vim-composer
git clone https://github.com/bling/vim-airline ~/.vim/pack/default/start/vim-airline
git clone https://github.com/vim-php/vim-create ~/.vim/pack/default/start/vim-create
git clone https://github.com/sensorario/vim-flow ~/.vim/pack/default/start/vim-flow
git clone https://github.com/reedes/vim-pencil ~/.vim/pack/default/start/vim-pencil
git clone https://github.com/kristijanhusak/vim-multiple-cursors ~/.vim/pack/default/start/vim-multiple-cursors
git clone https://github.com/fatih/vim-go ~/.vim/pack/default/start/vim-go
git clone https://github.com/gabrielelana/vim-markdown ~/.vim/pack/default/start/vim-markdown
git clone https://github.com/airblade/vim-gitgutter ~/.vim/pack/default/start/vim-gitgutter
git clone https://github.com/scrooloose/nerdcommenter ~/.vim/pack/default/start/nerdcommenter
git clone https://github.com/ryanoasis/vim-devicons ~/.vim/pack/default/start/vim-devicons
git clone https://github.com/vim-syntastic/syntastic ~/.vim/pack/default/start/syntastic
git clone https://github.com/kshenoy/vim-signature ~/.vim/pack/default/start/vim-signature
