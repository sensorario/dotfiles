" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'itchyny/vim-cursorword'
call plug#end()

" Config
set number " Display row number on the left side
set ignorecase " Innore command case
set cursorline
set cursorbind

" Tabs and spaces
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" FZF bindings
nnoremap <silent> <Leader>s :call fzf#run({ 'sink': 'edit' })<CR>
let $FZF_DEFAULT_OPTS=" --border --height=40% --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4"
let g:fzf_buffers_jump = 66
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  call nvim_open_win(buf, v:true, {})
endfunction

" Airline
let g:airline_powerline_fonts = 1
