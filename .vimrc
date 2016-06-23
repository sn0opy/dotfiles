set nocompatible
set ttyfast
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noautoindent
set noexpandtab
set ignorecase
set smartcase
set number
set list
set listchars=tab:\ \ ,eol:¬,trail:·
set noswapfile
set foldmethod=syntax
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
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}
set mouse-=a

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'ajh17/vimcompletesme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'alessandroyorba/sierra'
Plug 'morhetz/gruvbox'
call plug#end()

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=4
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open=1
let $FZF_DEFAULT_COMMAND='ag -g ""'
let g:php_folding=1

colorscheme gruvbox
set background=dark

filetype plugin indent off

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
endif

function! StripTrailingWhitespaces()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction
