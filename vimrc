set ai                  " set auto-indenting on for programming
set backspace=indent,eol,start  " make that backspace key work the way it should

set cursorline
set cursorcolumn
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set expandtab
set exrc
set foldlevel=20
set foldmethod=indent
set hlsearch            " highlight searches
set ignorecase          " ignore case when searching
set incsearch           " do incremental searching
set linespace=0
set mouse=a
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

set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" show tabs and tailing spaces
autocmd FileType php set list listchars=tab:»·,trail:·
autocmd FileType go set list listchars=tab:»·,trail:·

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
Plugin 'craigemery/vim-autotag'
Bundle 'stephpy/vim-php-cs-fixer'
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

" Move path list inside a configurable variable
nnoremap <Leader>R :!for i in `grep -Rl <C-r><C-w> src/`; do sed -i 's/<C-r><C-w>/<C-r><C-w>/g' $i; done;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Move current file
nnoremap <Leader>o :e ++enc=latin1 

" Extract content of next function inside a variable
autocmd FileType php nnoremap <Leader>v 0f(vibc$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>
autocmd FileType go nnoremap <Leader>v 0f(vibcv<ESC>Ovariable<SPACE>:=<SPACE><ESC>pA;<ESC>:%s/v//g<Left><Left>

nnoremap <Leader>] vi[c$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>
nnoremap <Leader>( vi(c$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;<ESC>:%s/variable//g<Left><Left>

" Git clone a project from github.com
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
    let newspaper_command = ":!clear; cat % | grep class; echo ''; echo 'METHODS:'; echo ''; awk '/function/,/\\)/' %"
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
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|output|var|sass|bin|node_modules|web)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'doc': '\v\.(md|rst)$',
    \ 'coverage': '\v[\/](html)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

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


" Run Behat
command! RunBehat :call RunBehatFunction()
function! RunBehatFunction()
    exec 'pwd'
    exec ':!php ./bin/behat' . "\<CR>"
endfunction

" Php files configuration
autocmd FileType php nnoremap<buffer> <Leader>t :call PhpTests()<cr>
function! PhpTests()
    if filereadable('./bin/phpunit')
        exec ':!./bin/phpunit --stop-on-failure'
    else
        exec ':!./vendor/bin/phpunit --stop-on-failure'
    endif
endfunction

nnoremap <Leader>f :call g:TestOnlyCurrenfFunction()<CR>
function! g:TestOnlyCurrenfFunction()
    exec 'normal [[2w'
    let g:currentWord = expand('<cword>')
    if filereadable('./bin/phpunit')
        let g:lastExecutedTest = ':!php ./bin/phpunit --filter=' . g:currentWord . ' --stop-on-failure'
    else
        let g:lastExecutedTest = ':!php ./vendor/bin/phpunit --filter=' . g:currentWord . ' --stop-on-failure'
    endif
    exec g:lastExecutedTest
    exec 'normal <c-o>'
endfunction

nnoremap <Leader>l :call g:RepeatLastTestFunction()<CR>
function! g:RepeatLastTestFunction()
    exec g:lastExecutedTest
endfunction

" Run phpunit test for current file
" @todo check  if phpunit is installed or not
nnoremap <expr> <leader>u RunPHPUnitTests()
command! RunUnitTestsCommand :call RunPHPUnitTests()
function! RunPHPUnitTests()
    let l:filename = expand('%')
    if -1 == match(l:filename,'Test\.php')
        let l:filename=substitute(l:filename, 'src', 'tests', '') " symfony3 folder
        let l:filename=substitute(l:filename, '\.php', 'Test\.php', '')
    endif
    if filereadable('./bin/phpunit')
        return ':!clear; php ./bin/phpunit --color ' . l:filename . "\<CR>"
    else
        return ':!clear; php ./vendor/bin/phpunit --color ' . l:filename . "\<CR>"
    endif
endfunction

" Go files configurations
autocmd FileType go nnoremap<buffer> <Leader>b :call GoBuild()<cr>
function! GoBuild()
    exec ':GoBuild'
endfunction
autocmd FileType go nnoremap<buffer> <Leader>t :call GoTest()<cr>
function! GoTest()
    exec ':GoTest'
endfunction

" Javascript files configuration
autocmd FileType javascript nnoremap<buffer> <Leader>t :call JsTest()<cr>
function! JsTest()
    exec ':!npm test'
endfunction

" Run complete test suite
" @todo move this inside a sensorario/vim-php ?
nnoremap <Leader>e :!php -d display_errors %<CR>

" @todo move this inside a sensorario/vim-git-collection ?
command! DeleteAllMergedBranch :call DeleteAllMergedBranchFunction()
function! DeleteAllMergedBranchFunction()
    exec ':!git checkout testing | git branch --merged | grep -v testing | xargs -n 1 git branch -d'
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

" Enable mouse
command! EnableMouse :call EnableMouseFunction()
function! EnableMouseFunction()
    let command = ":set mouse=a"
    exe command
endfunction

" Disable mouse
command! DisableMouse :call DisableMouseFunction()
function! DisableMouseFunction()
    let command = ":set mouse="
    exe command
endfunction

" Show git tree
command! ShowGitTree :call ShowGitTreeFunction()
function! ShowGitTreeFunction()
    let command = ":!git t"
    exe command
endfunction

let g:autotagTagsFile = ".git/tags"
set tags=tags

let NERDTreeShowBookmarks=1
"autocmd VimEnter * NERDTree

" color limit column
set colorcolumn=121
hi colorcolumn ctermbg=10

" code fixer
let g:php_cs_fixer_config = "default"         " options: --config
let g:php_cs_fixer_dry_run = 0                " Call command with dry-run option
let g:php_cs_fixer_enable_default_mapping = 1 " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_level = "symfony"          " options: --level (default:symfony)
let g:php_cs_fixer_php_path = "php"           " Path to PHP
let g:php_cs_fixer_rules = "@PSR2"            " options: --rules (default:@PSR2)
let g:php_cs_fixer_verbose = 0                " Return the output of command if 1, else an inline information.

fun! ExtractMethod() range
    let g:selection = s:get_visual_selection()
    exec ":normal! Gko\<esc>o\<esc>Spublic function ()\<esc>"
    exec ":normal! o{\<esc>"
    exec ":set paste"
    exec ":normal! o" . g:selection . "\<esc>"
    exec ":set nopaste"
    exec ":normal! o}\<esc>%k2w"
endfun
function! s:get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - 2]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction
vnoremap <Leader>r :call ExtractMethod()<cr>
