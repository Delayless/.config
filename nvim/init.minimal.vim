set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
syntax enable
set nocompatible
filetype on
filetype plugin indent on
set encoding=UTF-8

set autoindent
set nofoldenable
set foldmethod=manual


call plug#begin('~/.vim/plugged')

" Plug 'SidOfc/mkdx'

call plug#end()
