set ai                  " set auto-indenting on for programming
set backspace=indent,eol,start  " make that backspace key work the way it should
set colorcolumn=121
set cursorline
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set expandtab
set exrc
set foldlevel=20
set foldmethod=indent
set hlsearch            " highlight searches
set ignorecase          " ignore case when searching
set incsearch           " do incremental searching
set linespace=0
" set list listchars=tab:»·,trail:·
set nobackup            " do not keep a backup file
set nocompatible        " use vim defaults
set novisualbell        " turn off visual bell
set nu
set number              " show line numbers
set rnu
set ruler               " show the current row and column
set runtimepath=$VIMRUNTIME     " turn off user scripts, https://github.com/igrigorik/vimgolf/issues/129
set scrolloff=3         " keep 3 lines when scrolling
set secure
set shiftwidth=4
set showbreak=↪
set showcmd             " display incomplete commands
set showmatch           " jump to matches when entering regexp
set smartcase           " no ignorecase if Uppercase char present
set smartindent
set softtabstop=4
set tabstop=4
set visualbell t_vb=    " turn off error beep/flash
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type
filetype plugin indent on             " required
filetype plugin on             " required for nerdcommenter

" filetype off                          " required

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fugitive.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'tommcdo/vim-lion'
Bundle 'vim-php/vim-composer'
Plugin 'bling/vim-airline'
Plugin 'vim-php/vim-create'
Plugin 'sensorario/vim-flow'
Plugin 'reedes/vim-pencil'
Bundle 'kristijanhusak/vim-multiple-cursors'
Plugin 'evidens/vim-twig'
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'valloric/MatchTagAlways'
Plugin 'gabrielelana/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()



" Open vimrc file ...
nnoremap <Leader><Leader> :tabe ~/.vimrc

" function keyboard mapping
nnoremap <Leader>p :call g:ComposerKnowWhereCurrentFileIs()<CR>

" Sort all uses
" @todo move this inside a sensorario/vim-php ?
map <F3> :call SortAllUseStatements()<CR>

" Replace
nnoremap <F2> :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Replace with confirmation
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>

" Replace in a path
" Move path list inside a configurable variable
" @todo move this inside a sensorario/vim-php ?
nnoremap <Leader>R :!for i in `grep -Rl <C-r><C-w> src/`; do sed -i 's/<C-r><C-w>/<C-r><C-w>/g' $i; done;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Move current file
nnoremap <Leader>o :e ++enc=latin1 

" Find current word in all file in a path
nnoremap <Leader>f :!grep -Rn <C-r><C-w> src/ --color -U4<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Show all files that contains current word
nnoremap <Leader>F :!grep -Rnl <C-r><C-w> src/

" Extract content of next function inside a variable
" @todo move this inside a sensorario/vim-php ?
" @todo this works only for php!! go has no parenthesis
nnoremap <Leader>v 0f(vibc$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>

nnoremap <Leader>] vi[c$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>
nnoremap <Leader>( vi(c$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>

" Git clone a project from github.com
" Create VimClone command?
nnoremap <Leader>g :!git clone git@github.com:sensorario/

" Go to previous buffer
nnoremap T :bprevious<CR>

" Go to next buffer
nnoremap t :bnext<CR>

" @todo move this inside a sensorario/vim-php ?
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
" @todo move this inside a sensorario/vim-php ?
command! Newspaper :call NewspaperMetaphore()<CR>
function! NewspaperMetaphore()
    " @todo: dont call this method when out from a php file
    let newspaper_command = ":!clear; awk '/function/,/\\)/' %"
    exe newspaper_command
endfunction

" @todo move this inside a sensorario/vim-php ?
command! SortUseStatements :call SortAllUseStatements()<CR>
function! SortAllUseStatements()
    " @todo: check if current file is a php file
    exec ':0;/^use /;/^\(use \)\@!/-1:sort'
endfunction

" @todo move this inside a sensorario/vim-php ?
command! Todo :call ShowMeTodoInCurrentFile()<CR>
function! ShowMeTodoInCurrentFile()
    exec '!clear; grep -R "@todo" % --color'
endfunction

" ctrlp configuraation
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|output|vendor|var|sass|bin|app|web)$'

" alwais show status line on all windows
set laststatus=2
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep="\ue0b0"
let g:airline_right_sep="\ue0b2"
let g:airline_symbols.branch='⎇ '
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Run phpunit test for current file
" @todo check  if phpunit is installed or not
nnoremap <expr> <leader>u RunPHPUnitTests()
command! RunUnitTestsCommand :call RunPHPUnitTests()
function! RunPHPUnitTests()
    let l:filename = expand('%')
    if -1 == match(l:filename,'Test\.php')
        let l:filename=substitute(l:filename, 'src', 'test', '')
        let l:filename=substitute(l:filename, '\.php', 'Test\.php', '')
    endif
    if filereadable('./vendor/bin/phpunit')
        return ':!php ./vendor/bin/phpunit ' . l:filename . "\<CR>"
    else
        return ':!php ./bin/phpunit ' . l:filename . "\<CR>"
    endif
endfunction

" Run filtered test
nnoremap <Leader>T :!vendor/bin/phpunit --filter 
function! RunFilteredTests()
    let l:filter = input('Filter test with ... ')
    exec ':!php ./bin/phpunit --filter ' . l:filter . "\<CR>"
endfunction

" Run Behat
command! RunBehat :call RunBehatFunction()
function! RunBehatFunction()
    exec 'pwd'
    exec ':!php ./vendor/bin/behat' . "\<CR>"
endfunction

" Run complete test suite
" @todo move this inside a sensorario/vim-php ?
" @todo check if this file exists, show a message instead
nnoremap <Leader>t :!./runtests<CR>
nnoremap <Leader>u :!./rununits<CR>

" Run complete test suite
" @todo move this inside a sensorario/vim-php ?
nnoremap <Leader>e :!php -d display_errors %<CR>

" @todo move this inside a sensorario/vim-git-collection ?
command! DeleteAllMergedBranch :call DeleteAllMergedBranchFunction()
function! DeleteAllMergedBranchFunction()
    exec ':!git branch --merged | grep -v master | xargs -n 1 git branch -d'
    exec ':!git fetch -a --prune'
endfunction

" vim-pencil plugin configuration
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
    autocmd!
    autocmd FileType md   call pencil#init()
    autocmd FileType text call pencil#init()
augroup END

colorscheme mustang

" Plugin 'valloric/MatchTagAlways' Configuration
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'tmpl' : 1,
    \}
