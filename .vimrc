syntax on
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noautoindent
set noexpandtab
set ignorecase
set smartcase
set number
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set laststatus=2

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'kchmck/vim-coffee-script'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neocomplete'

call plug#end()

filetype plugin indent on

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline_powerline_fonts=0
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='wombat'
let g:hybrid_use_iTerm_colors = 1
let g:neocomplete#enable_at_startup = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

colorscheme hybrid

set wildmenu
set wildmode=list:full

vmap > >gv
vmap < <gv
nmap <C-h> :bprev<CR>
nmap <C-l> :bnext<CR>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
