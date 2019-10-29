
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
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
set lazyredraw
set completeopt=menu,menuone,noselect,longest,preview

let g:gitgutter_map_keys = 0
let g:black_fast = 1
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow'
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_number_column = 'bg1'
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 0
let g:python3_host_prog = '/usr/bin/python'

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter' " Git status indicator
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fuzzy search all the things
Plug 'morhetz/gruvbox' " Theme
Plug 'valloric/MatchTagAlways' " show matching parantheses
Plug 'dense-analysis/ale' " linting + suggestions
Plug 'wakatime/vim-wakatime' " track time spent within vim
Plug 'editorconfig/editorconfig-vim' " auto-apply .editorconfig settings
Plug 'ap/vim-buftabline' " tabs for buffers
Plug 'chaoren/vim-wordmotion' " better word motions
Plug 'gorodinskiy/vim-coloresque' " color preview in vim
Plug 'ervandew/supertab' " use tab for completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim' " Python completion
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

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
  autocmd FileType python setlocal completeopt-=preview
endif

function! StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
