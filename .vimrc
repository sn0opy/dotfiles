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
set noswf
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set laststatus=2
set fdm=marker

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

filetype plugin indent on

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='wombat'
let g:hybrid_use_iTerm_colors = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set background=dark
colorscheme hybrid

set wildmenu
set wildmode=list:full

vmap > >gv
vmap < <gv
nmap <C-h> :bprev<CR>
nmap <C-l> :bnext<CR>
nmap ,<space> :call StripTrailingWhitespaces()<CR>

autocmd BufNewFile,BufRead *.twig set filetype=html

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! StripTrailingWhitespaces()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction
