" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
set nocompatible             
filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8

set clipboard=unnamed

let mapleader=" "
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
noremap <LEADER>j 20J
noremap U <C-r>
noremap ` ~
noremap < <<
noremap > >>
 
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <LEADER>S :w !sudo tee %<CR><CR>
map <LEADER>rc :!vim ~/.vimrc<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>n :set nonu<CR>:set norelativenumber<CR>
map <LEADER>N :set nu<CR>:set relativenumber<CR>
"Greater Indent format for copying from Internet
map <LEADER>p :set paste!<CR>
"map <LEADER>P :set nopaste<CR>
vnoremap Y "+y

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"
"call vundle#end()            " required
filetype plugin indent on    " required

" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"
"  "youcompleteme  默认tab  s-tab 和自动补全冲突
"  "let g:ycm_filetype_whitelist = {'cpp':1, 'c':1, 'python':1}
   let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
"  let g:ycm_use_clangd = 0
"  let g:ycm_key_list_select_completion=['<c-n>']
"  "let g:ycm_key_list_select_completion = ['<Down>']
"  let g:ycm_key_list_previous_completion=['<c-p>']
"  "let g:ycm_key_list_previous_completion = ['<Up>']
"  let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"  
"  let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
"  let g:ycm_min_num_of_chars_for_completion=6	" 从第2个键入字符就开始罗列匹配项
"  let g:ycm_cache_omnifunc=0
"  "reset禁止缓存匹配项,每次都重新生成匹配项,可以保证实时更新候选名单
"  let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"  nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"  "nnoremap <leader>lo :lopen<CR>	"open locationlist
"  "nnoremap <leader>lc :lclose<CR>	"close locationlist
"  "inoremap <leader><leader> <C-x><C-o>
"  "在注释输入中也能补全
"  let g:ycm_complete_in_comments = 1
"  "在字符串输入中也能补全
"  let g:ycm_complete_in_strings = 1
"  "注释和字符串中的文字也会被收入补全
"  let g:ycm_collect_identifiers_from_comments_and_strings = 0
"  
"  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
