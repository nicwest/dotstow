" vim:fdm=marker
filetype plugin indent on
syntax on

" {{{ Plugins 
call plug#begin('~/.vim/plugged')
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'nicwest/QQ.vim'
Plug 'jpythonfold.vim'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-projectionist'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

let g:filebeagle_check_gitignore = 1

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
