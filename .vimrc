syntax on
filetype off
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noautoindent
set ignorecase
set smartcase
set number
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_whitespace = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_theme='wombat'
let g:hybrid_use_iTerm_colors = 1

colorscheme hybrid

set wildmenu
set wildmode=list:full

vmap > >gv
vmap < <gv
nmap <C-h> :bprev<CR>
nmap <C-l> :bnext<CR>


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
