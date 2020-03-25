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
set scrolloff=4   "at least 4 lines on the screenup and screendown
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set list
"set listchars=tab:▸\ ,trail:▫
set wrap
set ruler
set cursorline
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
set nofoldenable
"To move to a misspelled word, use ]s and [s.
"use z=, open suggest list.
"use zg, add the word to vim dictionary. zw to mark words as incorrect.
set spell spelllang=en

"set nospell
set fdm=indent
"markdown auto spell
"autocmd BufRead,BufNewFile *.md setlocal spell
noremap <LEADER>sp :hi SpellBad ctermbg=yellow<CR>:set spell!<CR>

noremap J 5j
noremap K 5k
noremap H ^
noremap L $
noremap W 5w
noremap B 5b
noremap <C-k> Hzz
noremap <C-j> Lzz

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
map R S:source $MYVIMRC<CR>
map <LEADER>S :w !sudo tee %<CR><CR>
map <LEADER>rc :!vim ~/.vimrc<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>n :set nonu<CR>:set norelativenumber<CR>
map <LEADER>N :set nu<CR>:set relativenumber<CR>
"Greater Indent format for copying from Internet or no
set pastetoggle=<F10>
map <LEADER>p :set paste!<CR>


" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
source ~/.config/snippits.vim


au BufNewFile *.cpp,*.[ch],*.sh,*.java :call SetTitle()
func SetTitle()
    "if the file is *.sh
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author:<++>")
		"call append(line(".")+2, "\# mail:<++>")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: <++>")
        "call append(line(".")+2, "    > Mail: <++>")
        call append(line(".")+2, "    > Created Time: ".strftime("%c"))
        call append(line(".")+3, " ************************************************************************/")
        call append(line(".")+4, "")
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
	"Edit at the endline of file
    autocmd BufNewFile * normal G
endfunc 


call plug#begin('~/.vim/plugged')
"Option 'on', means On-demand loading: Commands or <Plug>-mappings
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'airblade/vim-gitgutter'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dkarter/bullets.vim'  "automated bullet lists, :RenumberSelection.
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

"Install nodejs when necessary:  curl -sL install-node.now.sh/lts | bash
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'

"ranger's dependency for neovim   "Plug 'rbgrouleff/bclose.vim' 
Plug 'francoiscabrol/ranger.vim'

"Plug 'Konfekt/FastFold'
"Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock

" Pretty Dress
Plug 'liuchengxu/eleline.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight
Plug 'ajmwagar/vim-deus'
Plug 'bling/vim-bufferline'
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


"" ==
"" == GitGutter
"" ==
"let g:gitgutter_map_keys = 0
"let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_preview_win_floating = 1
"autocmd BufWritePost * GitGutter
"nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
"nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
"nnoremap <LEADER>g= :GitGutterNextHunk<CR>


"===
"=== markdown-preview.nvim
"===
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
nmap <F12> <Plug>MarkdownPreview


" Bullets.vim
" automated bullet lists, :RenumberSelection.
"1. 2. 3. autoincrease, - is also.
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


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
" if hidden is not set, TextEdit might fail.
set hidden
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
" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction


""""""""""""""""""""""""""""""
"" ===
"" === fastfold
"" ===
"nmap zuz <Plug>(FastFoldUpdate)
"let g:fastfold_savehook = 1
"let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
"let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
"let g:markdown_folding = 1
"let g:tex_fold_enabled = 1
"let g:vimsyn_folding = 'af'
"let g:xml_syntax_folding = 1
"let g:javaScript_fold = 1
"let g:sh_fold_enabled= 7
"let g:ruby_fold = 1
"let g:perl_fold = 1
"let g:perl_fold_blocks = 1
"let g:r_syntax_folding = 1
"let g:rust_fold = 1
"let g:php_folding = 1


" ===
" === eleline
" ===
set laststatus=2 ruler

" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1

" ===
" ===vim-deus
" ===
set t_Co=256
set termguicolors	" enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1
"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"set background=light
hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


"compile function
noremap <F5> :call CompileRunGcc()<CR>
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


" Press F8 to regenerate the tag file
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR><CR>
imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR><CR>
set tags=tags
set tags+=./tags "Search the tags in current filefolder
set tags+=~/ctags/tags "When searching the tags, search the ~/ctags/tags at the same time. Don't move the tags file after 'ctags -R'. Otherwise, prompt the warning "Can't find any souce file" when you press Ctrl+]

