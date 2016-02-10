syntax on
set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noautoindent
set noexpandtab
set ignorecase
set smartcase
set number
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set laststatus=2
set noswapfile
set foldmethod=marker
set wildmenu
set wildmode=list:full
set background=dark
set scrolloff=2
set smarttab
set incsearch
set statusline=%{fugitive#statusline()}
set autoread
set cursorline
set showmatch
set ttyfast

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'ajh17/vimcompletesme'
call plug#end()

colorscheme gruvbox

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gruvbox'
let g:syntastic_check_on_open=1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:gruvbox_contrast_dark='hard'

vmap > >gv
vmap < <gv
nmap <C-h> :bprev<CR>
nmap <C-l> :bnext<CR>
nmap ,<space> :call StripTrailingWhitespaces()<CR>

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufNewFile,BufRead *.twig set filetype=html
endif

function! StripTrailingWhitespaces()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction
