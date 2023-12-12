let g:rainbow_active = 1
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'

let g:vim_http_split_vertically = 1

set backspace=indent,eol,start
set hidden
set incsearch
set gdefault
set ignorecase
set smartcase
set wildmenu
set wildmode=longest:full,full
set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cursorline
set encoding=utf-8
set colorcolumn=80
set showmode
set showmatch
set hlsearch
set novisualbell
set nowrap
set noswapfile
set laststatus=2
set clipboard=unnamed
set spelllang=en_gb

noremap L $
noremap H ^
noremap $ L
noremap ^ H

noremap Q @q

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap < <V`]
vnoremap > >V`]
noremap <tab> %
nnoremap Y y$
nnoremap x "_x
xnoremap x "_x
nnoremap cx xp 

let g:mapleader = "\<Space>"

nnoremap <leader><BS> :noh<cr>
nnoremap <Leader>w :w<CR>
nnoremap <leader><Tab> <C-^>
nnoremap <leader>S <C-w>v<C-w>l
nnoremap <leader><leader> za
nnoremap <leader>r zr
nnoremap <leader>m zm

map <leader>so :setlocal spell!<cr>
map <leader>sa zg
map <leader>ss z=
map <leader>sg 1z=
