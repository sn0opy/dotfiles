set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set ignorecase
set smartcase
set number
set list
set listchars=tab:\_\_,trail:·
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
set mouse=nicr
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set nocompatible
set ttyfast

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'valloric/MatchTagAlways'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'ambv/black'
Plug 'tmhedberg/SimpylFold'
Plug 'Valloric/YouCompleteMe'
Plug 'ap/vim-buftabline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'chaoren/vim-wordmotion'
call plug#end()

let g:gitgutter_map_keys=0
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_fold_import=0
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_min_num_of_chars_for_completion=2
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

colorscheme gruvbox
set background=dark

filetype plugin on

vmap > >gv
vmap < <gv
nnoremap <C-n> :bprev<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap ,<space> :call StripTrailingWhitespaces()<CR>
nnoremap q: :History:<CR>
nnoremap <space> za

if has("autocmd")
  autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
endif

function! StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
