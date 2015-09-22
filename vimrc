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
Plugin 'bling/vim-airline'
call vundle#end()

filetype plugin indent on             " required

colorscheme default

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
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
set colorcolumn=80
set textwidth=80
set scrolloff=42
set foldlevel=20
set foldmethod=indent

" Open vimrc file ...
nnoremap <Leader><Leader> :tabe ~/.vimrc

" function keyboard mapping
nnoremap <Leader>p :call g:ComposerKnowWhereCurrentFileIs()<CR>

" Sort all uses
map <F3> :call SortAllUseStatements()<CR>

" Replace
nnoremap <F2> :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Replace with confirmation
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>

" Replace in a path
nnoremap <Leader>R :!for i in `grep -Rl <C-r><C-w> src/`; do sed -i 's/<C-r><C-w>/<C-r><C-w>/g' $i; done;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Sort
nnoremap <Leader>s :sort<CR>

" Run all tests
nnoremap <Leader>t :!./runtests<CR>

" Run filtered test
nnoremap <Leader>T :!vendor/bin/phpunit --filter 

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

" Git clone a project from github.com
nnoremap <Leader>g :!git clone git@github.com:sensorario/

" Start new PHP Project
nnoremap <Leader>P :call StartPHPPRoject()<CR>

" tab navigation
nnoremap T :tabNext<CR>

" buffer navigation
nnoremap t :bNext<CR>

" ...
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

" ComposerKnowWhereCurrentFileIs
function! g:VimComposerCustomBehavior(currentWord)
    exec "normal \<c-p>" . a:currentWord
endfunction

" Show method names to verify the newspaper metaphore
command! Newspaper :call NewspaperMetaphore()<CR>
function! NewspaperMetaphore()
    " @todo: dont call this method when out from a php file
    " @todo: use awk to hide non method name words
    exec '!clear; grep "function" % | grep -v private | grep -v "*"'
endfunction

command! SortUseStatements :call SortAllUseStatements()<CR>
function! SortAllUseStatements()
    " @todo: check if current file is a php file
    exec ':0;/^use /;/^\(use \)\@!/-1:sort'
endfunction

" Create new PHP Project
command! CreateNewPHPProject :call StartPHPPRoject()<CR>
function! StartPHPPRoject()
    exec "!curl -Ss https://getcomposer.org/installer | php"
    let project_name = input('Enter project name: ')
    exec '!php composer.phar create-project sensorario/starter ' . project_name . ' 1.0.0'
    exec '!mv composer.phar ' . project_name . '/'
    exec 'qa'
endfunction

command! SymfonyDownloadInstaller :call InstallSymfonyInstaller()<CR>
function! InstallSymfonyInstaller()
    exec '!clear'
    exec '!sudo curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony'
    exec '!sudo chmod a+x /usr/local/bin/symfony'
endfunction

command! Todo :call ShowMeTodoInCurrentFile()<CR>
function! ShowMeTodoInCurrentFile()
    exec '!clear; grep -R "@todo" % --color'
endfunction

command! SymfonyNewProject :call StartNewSymfonyLtsProject()<CR>
function! StartNewSymfonyLtsProject()
    exec '!symfony new ' . input('Project name: ')
endfunction

" ctrlp configuraation
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" alwais show status line on all windows
set laststatus=2
set encoding=utf-8
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:Powerline_symbols = 'fancy'
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_symbols.branch='⎇ '
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
