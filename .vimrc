set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set noexpandtab
set ignorecase
set smartcase
set number
set list
set listchars=tab:\_\_,eol:¬,trail:·
set noswapfile
set wildmenu
set wildmode=list:full
set scrolloff=5
set smarttab
set incsearch
set autoread
set cursorline
set showmatch
set hlsearch
set laststatus=0
set mouse-=a
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'valloric/MatchTagAlways'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
call plug#end()

if has("nvim")
	set termguicolors
else
	set nocompatible
	set ttyfast
endif

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_use_errorwindow=0
let g:netrw_list_hide='^\.git/$'
let $FZF_DEFAULT_COMMAND='ag -g ""'

colorscheme gruvbox
set background=dark

filetype plugin on

vmap > >gv
vmap < <gv
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Files .<CR>
nnoremap ,<space> :call StripTrailingWhitespaces()<CR>
nnoremap q: :History:<CR>

if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufNewFile,BufRead *.twig set filetype=html
	autocmd BufEnter * :syntax sync fromstart
endif

function! StripTrailingWhitespaces()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction
