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
filetype plugin indent on
set encoding=utf-8

"Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR><CR>
"when vim version feature include clipboard
"convenient to copy. Of course, We also can use "+y to copy.
"vnoremap Y "+y
"In the normal mode with clipboard feature, press 'p' to paste text from the system clipboard
"set clipboard=unnamedplus


let mapleader=" "
set scrolloff=4   "界面上下方至少保留4行
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set list
"set listchars=tab:▸\ ,trail:▫
set wrap
set ruler
"set cursorline
set number
set relativenumber
set showcmd
set wildmenu
set mouse=a

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set autoindent
set foldenable
"To move to a misspelled word, use ]s and [s.
"use z=, open suggest list.
"use zg, add the word to vim dictionary. zw to mark words as incorrect.
set spell spelllang=en_us
set nospell
"markdown auto spell
"autocmd BufRead,BufNewFile *.md setlocal spell
noremap <LEADER>sp :set spell!<CR>

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

"===
"=== Window Manage
"===
" Disable the default s key
noremap s <nop>
" split the screens
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

map <LEADER>w <C-w>w
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

noremap sv <C-w>t<C-w>H
noremap su <C-w>t<C-w>K

" Rotate screens
noremap sru <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

"noremap <LEADER>j 20J
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
"Greater Indent format for copying from Internet or no
set pastetoggle=<F10>
map <LEADER>p :set paste!<CR>

source ~/.config/snippits.vim

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l


au BufNewFile *.cpp,*.[ch],*.sh,*.java :call SetTitle()
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author:<++>")
        call append(line(".")+2, "\# mail:<++>")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: <++>")
        call append(line(".")+2, "    > Mail: <++>")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 



call plug#begin('~/.vim/plugged')

"Option 'on', means On-demand loading: Commands or <Plug>-mappings
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }"
Plug 'dkarter/bullets.vim'  "automated bullet lists, :RenumberSelection.
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'majutsushi/tagbar'

Plug 'francoiscabrol/ranger.vim'
call plug#end()


"===
"=== NERDtree
"===
map tt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "L"
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let NERDTreeMapToggleHidden="zh"
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']


"===
"=== NERDtree-git
"===
"This was because that vim couldn't execute system function in fish. Add set
"shell=sh in your vimrc.Maybe the issue has been fixed.
set shell=sh
"let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = ''
" set to 1, echo preview page url in command line when open preview page
let g:mkdp_echo_preview_url = 1
" use a custom port to start server or random for empty
let g:mkdp_port = ''
let g:mkdp_browser = ''    "spcify brower
let g:mkdp_browserfunc = ''

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
let g:mkdp_command_for_global = 0
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
nmap <F7> <Plug>MarkdownPreview


" Bullets.vim
" automated bullet lists, :RenumberSelection.
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


"compile function
noremap <LEADER>R :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!google-chrome-stable % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

nmap <LEADER>t :TagbarToggle<CR><C-w>l

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


" ===
" === coc
" ===
" fix the most annoying bug that coc has
set cmdheight=2
set updatetime=300
" always show signcolumns. Display the sign in the left column.
set signcolumn=yes

silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === Ranger.vim
" ===
nnoremap <LEADER>f :Ranger<CR>
let g:ranger_map_keys = 0


" Press F8 to regenerate the tag file
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
set tags=tags
set tags+=./tags "Search the tags in current filefolder
set tags+=~/ctags/tags "When searching the tags, search the ~/ctags/tags at the same time. Don't move the tags file after 'ctags -R'. Otherwise, prompt the warning "Can't find any souce file" when you press Ctrl+]
