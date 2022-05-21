" vim:fdm=marker
filetype plugin indent on
syntax on

"  Plugins 
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'hashivim/vim-terraform'
Plug 'haya14busa/incsearch.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

Plug '/Users/nic.west/sideprojects/vim-http'
"Plug '/home/nic.west/sideprojects/vim-generate'
"Plug '/home/nic.west/sideprojects/vim-camelsnek'
"Plug '/home/nic.west/sideprojects/vim-workman'
"Plug '/home/nic.west/sideprojects/vim-loot'
call plug#end()

let g:filebeagle_check_gitignore = 1

let g:ale_linters = {
      \'go': ['go build', 'golint', 'govet'],
      \'typescript': ['tslint'],
      \'javascript': ['eslint'],
      \ }

let g:ale_fixers = {
      \'typescript': ['prettier'],
      \'javascript': ['prettier'],
      \'terraform': ['terraform'],
      \ }
let g:ale_fix_on_save = 1


let g:rainbow_active = 1
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'

let g:vim_http_split_vertically = 1
"let g:workman_insert_workman = 1

" 
"  Settings
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
" 
"  Colors
"set background=light
"colorscheme plain
"highlight SpellBad   ctermfg=15 ctermbg=1
"highlight SpellCap   ctermfg=15 ctermbg=9
"highlight SpellRare  ctermfg=15 ctermbg=10
"highlight SpellLocal ctermfg=15 ctermbg=2
"highlight CursorLine ctermfg=0  ctermbg=251
set background=dark
colorscheme hybrid
" 
"  Keybinds
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

imap <C-g>nf <Plug>GenerateFirstName
imap <C-g>ny <Plug>GenerateFirstMaleName
imap <C-g>nx <Plug>GenerateFirstFemaleName
imap <C-g>nl <Plug>GenerateLastName
imap <C-g>nn <Plug>GenerateFullName
imap <C-g>ns <Plug>GenerateStubName
imap <C-g>nu <Plug>GenerateUserName
imap <C-G>em <Plug>GenerateEmail
imap <C-G>id <Plug>GenerateDomain
imap <C-G>ip <Plug>GenerateIPV4
imap <C-G>ix <Plug>GenerateIPV6
imap <C-g>uu <Plug>GenerateUUID4
imap <C-g>dt <Plug>GenerateIso8601DateTime
imap <C-g>dd <Plug>GenerateIso8601Date
imap <C-g>ds <Plug>GenerateSQLDateTime
imap <C-g>ut <Plug>GenerateUNIXTime

nnoremap gennf :Generate first name<CR>
nnoremap genny :Generate first male name<CR>
nnoremap gennx :Generate first female name<CR>
nnoremap gennl :Generate last name<CR>
nnoremap gennn :Generate full name<CR>
nnoremap genns :Generate stub<CR>
nnoremap gennu :Generate user<CR>
nnoremap genem :Generate email<CR>
nnoremap genid :Generate domain<CR>
nnoremap genip :Generate ipv4<CR>
nnoremap genix :Generate ipv6<CR>
nnoremap genuu :Generate uuid<CR>
nnoremap gendt :Generate isodatetime<CR>
nnoremap gendd :Generate isodate<CR>
nnoremap gends :Generate sqldatetime<CR>
nnoremap genut :Generate unixtime<CR>


" 
"  Leader
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

nnoremap <leader>e :Errors<CR>

nnoremap <leader>i :Imports<CR>
nnoremap <leader>a <C-w>v<C-w>l:A<CR>

nnoremap <leader>m :w<CR>:make test<CR>

nmap <leader>dd <Plug>DictDictionary
nmap <leader>dt <Plug>DictThesaurus

nmap <leader>qa A  # noqa
nmap <leader>bh :Behave<CR>

" 
"  Autocommands
"autocmd FileType python source ~/.vim/plugged/jpythonfold.vim/syntax/jpythonfold.vim

autocmd Filetype html,htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css,scss setlocal ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd FileType objc,objcpp setlocal noexpandtab ts=8 sts=8 sw=8  
autocmd FileType typescriptreact setlocal tw=120 cc=120


autocmd BufRead *.md setlocal spell spelllang=en_gb
autocmd BufRead *.markdown setlocal spell spelllang=en_gb
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown,rst setlocal tw=78
autocmd Filetype markdown,rst setlocal wm=4

autocmd BufNewFile,BufRead *.cljx set ft=clojure
autocmd BufNewFile,BufRead *.joke set ft=clojure

" 
"  Commands
function! s:set_json_header() abort
  call http#set_header('Content-Type', 'application/json')
endfunction

function! s:clean_personal_stuff() abort
  call http#remove_header('Cookie')
  call http#remove_header('Accept')
  call http#remove_header('User-Agent')
  call http#remove_header('Accept-Language')
endfunction 

function! s:add_compression() abort
  call http#set_header('Accept-Encoding', 'deflate, gzip')
  let g:vim_http_additional_curl_args = '--compressed'
endfunction

function! s:imports() abort
  if &filetype ==# 'go'
    GoImports
  endif
  if &filetype ==# 'clojure'
    Slamhound
  endif
endfunction

command! JSON call s:set_json_header()
command! Anon call s:clean_personal_stuff()
command! Compression call s:add_compression()
command! Imports call s:imports()
command! Behave execute "norm! yypV:Snek\<CR>Idef \<ESC>A(context):"
