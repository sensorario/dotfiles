set nocompatible              " be iMproved, required

filetype off                  " required
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " vim bundle manager
Plugin 'kien/ctrlp.vim'    " finder ...
Plugin 'fugitive.vim'      " git integration
call vundle#end()

filetype plugin indent on    " required

colorscheme zellner

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nopaste
set ignorecase
set nu
set list listchars=tab:»·,trail:·
set showbreak=↪

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
