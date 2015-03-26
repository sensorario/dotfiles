set nocompatible              " be iMproved, required

filetype off                  " required
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " vim bundle manager
Plugin 'kien/ctrlp.vim'    " finder ...
Plugin 'fugitive.vim'      " git integration
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
call vundle#end()

filetype plugin indent on    " required

colorscheme delek

set expandtab
set foldlevel=1
set foldlevelstart=4
set foldmethod=indent
set ignorecase
set list listchars=tab:»·,trail:·
set nopaste
set nu
set shiftwidth=4
set showbreak=↪
set softtabstop=4
set tabstop=4

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
