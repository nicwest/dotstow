" vim:fdm=marker
filetype plugin indent on
syntax on

" {{{ Plugins 
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'guns/vim-slamhound'
Plug 'haya14busa/incsearch.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'jpythonfold.vim'
Plug 'luochen1990/rainbow'
Plug 'nicwest/template-bucket'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'vim-jp/vital.vim'
Plug '/home/nic/sideprojects/vim-http'
call plug#end()

let g:filebeagle_check_gitignore = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225,E226,E265'
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1

let g:UltiSnipsSnippetsDir = "~/.vim/snippets/"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"

let g:rainbow_active = 1
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

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

noremap <tab> %

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

autocmd Filetype html,htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css,scss setlocal ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

au BufRead *.md setlocal spell spelllang=en_gb
au BufRead *.markdown setlocal spell spelllang=en_gb
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown,rst setlocal tw=78
autocmd Filetype markdown,rst setlocal wm=4

autocmd BufNewFile,BufRead *.cljx set ft=clojure
" }}}
" {{{ Commands
function! s:set_json_header() abort
  call http#set_header('Content-Type', 'application/json')
endfunction

function! s:clean_personal_stuff() abort
  call http#remove_header('Cookie')
  call http#remove_header('Accept')
  call http#remove_header('User-Agent')
  call http#remove_header('Accept-Language')
endfunction 

command! JSON call s:set_json_header()
command! Anon call s:clean_personal_stuff()
" }}}
