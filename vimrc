set nocompatible                      " be iMproved, required

filetype off                          " required
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'            " vim bundle manager
Plugin 'kien/ctrlp.vim'               " finder ...
Plugin 'fugitive.vim'                 " git integration
Plugin 'MarcWeber/vim-addon-mw-utils' " add your local vimrc
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'          " add snippets to your vim
Plugin 'scrooloose/nerdtree'          " tree of files and folders
Plugin 'tommcdo/vim-lion'             " align equals
Plugin 'bling/vim-airline'
Plugin 'shawncplus/phpcomplete.vim'
call vundle#end()

filetype plugin indent on             " required

colorscheme darkblue

" ctrlp configuraation
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" airline
set laststatus=2
let g:airline#extensions#tabline#left_sepne#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

set colorcolumn=120
set cursorline
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set expandtab
set exrc
set foldlevel=1
set foldlevelstart=42
set foldmethod=indent
set ignorecase
set list listchars=tab:»·,trail:·
set nu
set secure
set shiftwidth=4
set showbreak=↪
set smartindent
set softtabstop=4
set tabstop=4

" replace current word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap <Leader>R :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

map <Leader>s :sort<CR>

function! NewspaperMetaphore()
    exec '!clear; grep "public function" %'
endfunction

function! SortAllUseStatements()
    exec ':0;/^use /;/^\(use \)\@!/-1:sort'
endfunction

map <F12> :call NewspaperMetaphore()<CR>
map <F2>  :call SortAllUseStatements()<CR>
