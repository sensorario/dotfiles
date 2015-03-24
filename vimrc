set nocompatible              " be iMproved, required

filetype off                  " required
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
call vundle#end()

filetype plugin indent on    " required

colorscheme zellner
