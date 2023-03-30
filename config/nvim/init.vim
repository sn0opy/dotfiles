set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase
set smartcase
set number
set list
set listchars=tab:\_\_,trail:·
set noswapfile
set wildmode=list:full
set scrolloff=5
set cursorline
set showmatch
set mouse=nicr
set foldmethod=indent
set foldlevel=99
set lazyredraw
set completeopt=menu,menuone,noselect,longest,preview
set termguicolors

let g:gitgutter_map_keys = 0
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_number_column = 'bg1'
let g:ale_completion_enabled = 0
let mapleader = ','

if has('macunix')
  let g:python3_host_prog = '/opt/homebrew/bin/python3'
else
  let g:python3_host_prog = '/usr/bin/python'
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install()} }
Plug 'junegunn/fzf.vim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'airblade/vim-gitgutter' " Git status indicator
Plug 'dense-analysis/ale' " linting + suggestions
Plug 'wakatime/vim-wakatime' " track time spent within vim
Plug 'editorconfig/editorconfig-vim' " auto-apply .editorconfig settings
Plug 'ap/vim-buftabline' " tabs for buffers
Plug 'chaoren/vim-wordmotion' " better word motions
Plug 'gorodinskiy/vim-coloresque' " color preview in vim
Plug 'ervandew/supertab' " use tab for completion
Plug 'davidhalter/jedi-vim' " Python completion
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'itchyny/lightline.vim' " status bar
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
call plug#end()

colorscheme gruvbox-baby

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
nnoremap <leader>f :Rg <C-r><C-w>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FileType go set noexpandtab shiftwidth=2 softtabstop=2 tabstop=2

function! StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
