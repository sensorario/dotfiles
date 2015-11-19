set nocompatible                      " be iMproved, required

filetype off                          " required
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

Plugin 'sensorario/vim-create'
Plugin 'sensorario/vim-flow'

Plugin 'reedes/vim-pencil'

Bundle 'kristijanhusak/vim-multiple-cursors'

Plugin 'evidens/vim-twig'

call vundle#end()

filetype plugin indent on             " required

colorscheme delek
syntax on

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set cursorline
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set expandtab
set exrc
set ignorecase

" this does not work in mac environment
" @todo create new version of dotfiles for MacOsX?
set list listchars=tab:»·,trail:·

set nu
set secure
set shiftwidth=4
set showbreak=↪
set smartindent
set softtabstop=4
set tabstop=4
set hlsearch
set colorcolumn=120

" this keep current line centered on the screen
" set scrolloff=42

set foldlevel=20
set foldmethod=indent
set linespace=0

set mouse=a
set ttymouse=xterm2


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
nnoremap <Leader>R :!for i in `grep -Rl <C-r><C-w> src/ test/ scripts/`; do sed -i 's/<C-r><C-w>/<C-r><C-w>/g' $i; done;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Move current file
nnoremap <Leader>o :e ++enc=latin1 

" Find current word in all file in a path
nnoremap <Leader>f :!grep -Rn <C-r><C-w> src/ --color -U4<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Show all files that contains current word
nnoremap <Leader>F :!grep -Rnl <C-r><C-w> src/

" Extract content of next function inside a variable
" @todo move this inside a sensorario/vim-php ?
nnoremap <Leader>v 0f(vibc$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>

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
    let newspaper_command = ":!clear; grep function ".expand('%')." | grep -v private | grep -v '*' | awk '{print \" ".expand('%:r')."::\"$3}'"
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
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|output)$'

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
nnoremap <expr> <leader>u RunPHPUnitTest()
function! RunPHPUnitTest()
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
    exec ':!php ./vendor/bin/phpunit --filter ' . l:filter . "\<CR>"
endfunction

" Run complete test suite
" @todo move this inside a sensorario/vim-php ?
nnoremap <Leader>t :!./runtests<CR>

" @todo move this inside a sensorario/vim-git-collection ?
command! DeleteAllMergeBranch :call DeleteAllMergedBranchFunction()
function! DeleteAllMergedBranchFunction()
    exec ':!git branch --merged | grep -v master | xargs -n 1 git branch -d'
endfunction

" vim-pencil plugin configuration
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
    autocmd!
    autocmd FileType php  call pencil#init()
    autocmd FileType md   call pencil#init()
    autocmd FileType text call pencil#init()
augroup END
