"set shell=/bin/bash
let mapleader=" "
set nocompatible             
set scrolloff=4   "界面上下方至少保留4行
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F10>
set wrap
set number
set relativenumber
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set autoindent
set encoding=utf-8
"To move to a misspelled word, use ]s and [s.
"use z=, open suggest list.
"use zg, add the word to vim dictionary. zw to mark words as incorrect.
"set spell spelllang=en_us
set nospell

syntax on
filetype off                  " required

noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
noremap W 5w
noremap B 5b
noremap <C-k> Hzz
noremap <C-j> Lzz
noremap <C-h> 0
noremap <C-l> $
"noremap <LEADER>j 20J
noremap U <C-r>
noremap ` ~
noremap < <<
noremap > >>
 
map S :w<CR>
map Q :q<CR>
map R :source ~/.vimrc<CR>
map <LEADER>S :w !sudo tee %<CR><CR>
map <LEADER>rc :!vim ~/.vimrc<CR>
map <LEADER><CR> :nohlsearch<CR>
"convenient to copy. Of course, We also can use "+y to copy.
map <LEADER>n :set nonu<CR>:set norelativenumber<CR>
map <LEADER>N :set nu<CR>:set relativenumber<CR>
"Greater Indent format for copying from Internet or no
map <LEADER>p :set paste!<CR>
vnoremap Y "+y
