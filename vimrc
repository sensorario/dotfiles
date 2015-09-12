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
Bundle 'vim-php/vim-composer'
call vundle#end()

filetype plugin indent on             " required

colorscheme default

" ctrlp configuraation
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set cursorline
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set expandtab
set exrc
set ignorecase
set list listchars=tab:»·,trail:·
set nu
set secure
set shiftwidth=4
set showbreak=↪
set smartindent
set softtabstop=4
set tabstop=4
set hlsearch
set laststatus=2
set statusline=%f
set colorcolumn=80
set textwidth=80
set scrolloff=42

" Folding
set foldlevel=20
set foldmethod=indent

" Replace
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Replace in a path
nnoremap <Leader>R :!for i in `grep -Rl <C-r><C-w> src/`; do sed -i 's/<C-r><C-w>/<C-r><C-w>/g' $i; done;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Sort
nnoremap <Leader>s :sort<CR>

" Run all tests
nnoremap <Leader>t :!./runtests<CR>

" Move current file
nnoremap <Leader>m :!mv % 

" Copy current file
nnoremap <Leader>c :!cp % 

" Find current word in all file in a path
nnoremap <Leader>f :!grep -Rn <C-r><C-w> src/ --color -U4<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Show all files that contains current word
nnoremap <Leader>F :!grep -Rnl <C-r><C-w> src/

" Extract content of next function inside a variable
nnoremap <Leader>v 0f(vibc$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>

" Clone a project from github
nnoremap <Leader>g :!git clone git@github.com:sensorario/

" Open vimrc file ...
nnoremap <Leader><Leader> :tabe ~/.vimrc

" function keyboard mapping
nnoremap <Leader>p :call g:ComposerKnowWhereCurrentFileIs()<CR>

" tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap t     :tabnext<CR>

" ...
map      <F2>      :call SortAllUseStatements()<CR>
map      <F12>     :call NewspaperMetaphore()<CR>

" Disable arrows in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable arrows in insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

function! NewspaperMetaphore()
    " todo: dont call this method when out from a php file
    " todo: use awk to hide non method name words
    exec '!clear; grep "function" % | grep -v private'
endfunction

function! SortAllUseStatements()
    " todo: check if current file is a php file
    exec ':0;/^use /;/^\(use \)\@!/-1:sort'
endfunction

" ComposerKnowWhereCurrentFileIs
function! g:VimComposerCustomBehavior(currentWord)
    exec "normal \<c-p>" . a:currentWord
endfunction
