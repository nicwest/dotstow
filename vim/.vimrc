" vim:fdm=marker
filetype plugin indent on
syntax on

" {{{ Plugins 
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'haya14busa/incsearch.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'jpythonfold.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
call plug#end()

let g:filebeagle_check_gitignore = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225,E226,E265'

" }}}
" {{{ Settings
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
set colorcolumn=80
set showmode
set novisualbell
set nowrap
set noswapfile
set clipboard=unnamed
" }}}
" {{{ Colors
set background=dark
colorscheme hybrid
" }}}
" {{{ Keybinds
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

nnoremap <tab> %
vnoremap <tab> %

nnoremap Y y$

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap x "_x
xnoremap x "_x

nnoremap cx xp 

nnoremap <c-b> :buffers<CR>:b 


" }}}
" {{{ Leader
let mapleader = "\<Space>"

" clears search
nnoremap <leader><BS> :noh<cr>

" write files
nnoremap <Leader>w :w<CR>

" buffer swap
nnoremap <leader><Tab> <C-^>

" open vertical split
nnoremap <leader>S <C-w>v<C-w>l

" folding and things
nnoremap <leader><leader> za
nnoremap <leader>r zr
nnoremap <leader>m zm

"spelling stuff
map <leader>so :setlocal spell!<cr>
map <leader>sa zg
map <leader>ss z=
map <leader>sg 1z=
" }}}
" {{{ Autocommands
autocmd FileType python source ~/.vim/plugged/jpythonfold.vim/syntax/jpythonfold.vim
" }}}
