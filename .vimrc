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
set laststatus=0
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}
set mouse-=a

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'ajh17/vimcompletesme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'alessandroyorba/sierra'
call plug#end()

let g:sierra_Midnight = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=4
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open=1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:gruvbox_contrast_dark='hard'

colorscheme sierra

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
