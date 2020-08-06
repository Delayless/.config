" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Open vim display Garbage R^[[>1;4205;0c^[]10;rgb:ffff/ffff/ffff^G
" But one side-effect of this setting is broken setting background auto-detection
set t_RB= t_RF= t_RV= t_u7= t_ut=
" when opening vim have latency and Dispaly >4;2m.Maybe it's because of Xmodmap .
let &t_TI = ""
let &t_TE = ""
" set t_ut=

" Vim overrule your settings with the defaults, use: > `:syntax on`
syntax enable
set nocompatible
filetype on
filetype plugin indent on
set encoding=UTF-8

" Shift+insert paste from system clipboard without any dependency.
" vim version feature must include clipboard. So install gvim or vim-gnome instead of vim.
" \"+y  means to first press \" release then press \+ finally press y
set clipboard=unnamed
" Copy/Paste. vim must be running when using shared clipboard.
vnoremap Y "+y
vnoremap <C-c> "+y
nnoremap <C-b> "+p

" tab to indentation.
vmap <tab> >gv
vmap <s-tab> <gv

" Move up/down the selected lines in visual mode.
vnoremap <c-p> :m '<-2<CR>gv=gv
vnoremap <c-n> :m '>+1<CR>gv=gv
nnoremap <c-p> V:m '<-2<CR>gv=gv<esc>
nnoremap <c-n> V:m '>+1<CR>gv=gv<esc>

let mapleader=" "
set scrolloff=3   "at least 3 lines on the screenup and screendown
set backspace=2
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set list
" set listchars=tab:\|\ ,trail:▫
set listchars=tab:\|\ ,trail:■
set wrap
" close autowrap at insert mode.when textwidth > x, text will auto wrap
set textwidth=0
set ruler
set cursorline
set number
set relativenumber
set autochdir " auto change working directory
set showcmd
set wildmenu
set mouse=nv
" set noswapfile

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set autoindent
set nofoldenable
set foldmethod=manual
"To move to a misspelled word, use ]s and [s.
"use z=, open suggest list.
"use zg, add the word to vim dictionary. zw to mark words as incorrect.
set spell spelllang=en_us
" spell checking
noremap <LEADER>ss :set spell!<CR>
set nospell

set ttimeoutlen=100 " reduce latency of swithing input method for Plug fcitx.vim

" :help keycode
" <m-s> == Alt+s ?, they are unequal in ubuntu.
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap j jzz
" nnoremap k kzz
noremap J 5j
noremap K 5k
noremap H ^
noremap L $
noremap W 5w
noremap B 5b
" nnoremap <CR> o<Esc>
nnoremap <S-CR> i<CR><Esc>
nnoremap <C-k> Hzz
nnoremap <C-j> Lzz

" it would be prone to bugs if mapping : ;.
noremap ; :

" copy current filepath and line
" nnoremap y. :let @+ = expand("%") . ':' . line(".")<cr>

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

" map <LEADER>w <C-w>w
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

" ===
" === Tab Management
" ===
" `N Backpack` go to N tab or N buffer
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmh and tml
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

"noremap <LEADER>j 20J
noremap U <C-r>
noremap ` ~
nnoremap < <<
nnoremap > >>
noremap [f :bn<cr>
noremap ]f :bN<cr>

map S :w<CR>
map Q :q<CR>
map R S:source $MYVIMRC<CR>
map <LEADER>S :w !sudo tee %<CR><CR>
map <LEADER>Q :q!<CR>
map <LEADER>rc :vsp ~/.config/.vimrc<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>n :set nonu<CR>:set norelativenumber<CR>
map <LEADER>N :set nu<CR>:set relativenumber<CR>
"Greater Indent format for copying from Internet or no
set pastetoggle=<F10>
map <LEADER>sp :set paste!<CR>


" ===
" === terminal mode
" ===
" :terminal can open a terminal at vim>=8.1
" ctrl+d exit terminal at insert mode.
noremap <Bslash>py :belowright term python<cr>
noremap <Bslash>t :belowright term<cr>
" Esc exit insert mode into normal mode
tnoremap <Esc> <c-\><c-n>
tnoremap <LEADER>j <C-w>j
tnoremap <LEADER>k <C-w>k
tnoremap <LEADER>l <C-w>l
tnoremap <LEADER>h <C-w>h

" ===
" === Command line mode(cmdline)
" ===
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-l> <Right>
cnoremap <c-h> <Left>
" words backward.
cnoremap <c-b> <S-Left>
" words forward.
cnoremap <c-f> <S-Right>

au BufNewFile *.cpp,*.[ch],*.sh,*.java :call SetTitle()
func SetTitle()
    "if the file is *.sh
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author:<++>")
        "call append(line(".")+2, "\# mail:<++>")
        call append(line(".")+2, "\# Created Time: ".strftime("%c"))
        call append(line(".")+3, "\#########################################################################")
        call append(line(".")+4, "\#!/bin/bash")
        call append(line(".")+5, "")
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
        call append(line(".")+5, "#include<iostream>")
        call append(line(".")+6, "using namespace std;")
        call append(line(".")+7, "")
    endif
    if &filetype == 'c'
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "")
    endif
	"Edit at the endline of file
    autocmd BufNewFile * normal G
endfunc

call plug#begin('~/.vim/plugged')
" Option 'on', means On-demand loading: Commands or <Plug>-mappings
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" Markdown, It only works on vim >= 8.1 and neovim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'Delayless/bullets.vim'  " automated bullet lists, :RenumberSelection.
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Modified by vim-markdown. You can look plasticboy/vim-markdown's documentation for help.
Plug 'mzlogin/vim-markdown-toc'
Plug 'lervag/vimtex'

" Optimize Chinese input experience
" To avoid the Esc delay, please set 'ttimeoutlen' to 100 or some value.
" It's also related to screens's maptimeout
Plug 'lilydjwg/fcitx.vim'

" Install nodejs when necessary:  curl -sL install-node.now.sh/lts | bash
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'

Plug 'Delayless/vim-snippets'

" Requestment: ctags
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'

" Plug 'Konfekt/FastFold'
" Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock

" Pretty Dress
Plug 'liuchengxu/eleline.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight
Plug 'ajmwagar/vim-deus'  " It only works on vim >=8.1 and neovim
Plug 'bling/vim-bufferline'
Plug 'sheerun/vim-polyglot' " language packages for highlight
Plug 'ryanoasis/vim-devicons'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mg979/vim-xtabline'	"Tab manager in the top of windows
" fades your inactive buffers and preserves syntax highlighting.
Plug 'TaDaa/vimade'

Plug 'vim-scripts/restore_view.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vuciv/vim-bujo'	"TODO
" Plug 'vimwiki/vimwiki'
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" ysiw{ ysiw} yss<p1> cs ds{, Visual select and input S<p class="important">
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs' " better than coc-pairs
Plug 'godlygeek/tabular' "Align, :Tabularize /:\zs
Plug 'tpope/vim-repeat' " The . command will work with ds, cs, yss
Plug 'junegunn/vim-after-object' " copy, change, delete, yank after some symbols like `=/:/-/#/<space>`
Plug 'chrisbra/NrrwRgn'		"display narrow region(focus)
Plug 'puremourning/vimspector', { 'do': './install_gadget.py --force-enable-chrome --enable-c' }
Plug 'liuchengxu/vim-which-key'

if has('nvim')
	" Ranger in a floating window. Only support neovim for now 2020-07-08 21:43.
	" `:checkhealth` Run all healthchecks.
	Plug 'kevinhwang91/rnvimr'
	" Plug 'cpiger/NeoDebug'
else
	" ranger's dependency for neovim   "Plug 'rbgrouleff/bclose.vim'
	Plug 'francoiscabrol/ranger.vim'
endif

call plug#end()


" ===
" === restore_view
" ===
set viewoptions=cursor,folds,slash,unix  " autosave cursor position and fold information
" let g:skipview_files = ['*\.vim'] " exclude some files to be autosaved.


" ===
" === NERDtree
" ===
" debug
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


" ===
" === NERDtree-git
" ===
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


" ==
" == GitGutter
" ==
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap ,f :GitGutterFold<CR>
nnoremap ,d :GitGutterPreviewHunk<CR>
nnoremap ,k :GitGutterPrevHunk<CR>
nnoremap ,j :GitGutterNextHunk<CR>
" Git add(stage) this change
nnoremap ,a :GitGutterStageHunk<CR>
" Undo Changed Context
nnoremap ,u :GitGutterUndoHunk<CR>


" ===
" === markdown-preview.nvim
" ===
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
"nmap <F12> <Plug>MarkdownPreview
nmap <Bslash>m <Plug>MarkdownPreview


" bullets.vim
" automated bullet lists, select code at visual mode, :RenumberSelection.
" In Insert mode, <C-t> for child bullet and <C-d> for parent bullet.
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
" === vim-markdown-toc
" ===
" :GenTocGFM generate TOC
" :GenTocGFM for GitHub, :GenTocGitLab for GitLab
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_cycle_list_item_markers = 1 " mark by *-+, not only *.
" Remove lower directory levels
function RToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction

let g:vim_markdown_toc_autofit = 1
function! Toc()
  if &filetype == 'markdown'
    :Toc
    set nofoldenable
    syntax on
  endif
endfunction
nnoremap T :call Toc()<CR>
" autocmd VimEnter,BufReadPost,BufWinEnter  *.m*  call s:Toc()

" ===
" === fzf.vim
" ===
" :GitFiles
" :Ag
"===================================
" Fuzzy-find tags
" map <Leader>w :Windows<cr>
" nmap <Leader>w :Windows<cr>

" This is the default extra key bindings
" In any scenario(fzf,rg,buffers), Open the file in new tab, new split, new vsplit by pressing ctrl-t, ctrl-x, ctrl-v.
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS .= ' --bind ctrl-a:select-all'
let $FZF_DEFAULT_OPTS .= ' --bind ctrl-d:deselect-all'

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above

" the dot\. at end of command means regrex's everychar.
	"\   'rg --column --line-number --no-heading --color=always --smart-case --hidden .'.shellescape(<q-args>), 1,
" set the preview window to hidden by default(add ':hidden'), e.g:
	"\          : fzf#vim#with_preview('right:50%:hidden', '?'),
" search code in current file.
command! -bang -nargs=* RgCurrentFile
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always --smart-case --with-filename . '.fnameescape(expand('%')), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:40%')
	\           : fzf#vim#with_preview('right:50%', '?'),
	\   <bang>0)

command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always --smart-case --hidden .'.shellescape(<q-args>), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:40%')
	\           : fzf#vim#with_preview('right:50%', '?'),
	\   <bang>0)

" Default options are --nogroup --column --color
let s:ag_options = ' --column --one-device --skip-vcs-ignores --smart-case '
command! -bang -nargs=* Ag
	\ call fzf#vim#ag(
	\   <q-args>,
	\   s:ag_options,
	\  <bang>0 ? fzf#vim#with_preview('up:60%')
	\          : fzf#vim#with_preview('right:50%', '?'),
	\   <bang>0
	\ )

command! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview())

" Variables, same as the plug "Vista".
command! -bang BTags
  \ call fzf#vim#buffer_tags('', {
  \     'down': '40%',
  \     'options': '--with-nth 1
  \                 --reverse
  \                 --prompt "> "
  \                 --preview-window="70%"
  \                 --preview "
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
  \                     head -n 16"'
  \ })

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Replace the default dictionary completion with fzf-based fuzzy completion
" if not exist the file, can download from github or `sudo pacman -S words`
" https://raw.githubusercontent.com/eneko/data-repository/master/data/words.txt
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" View commits in fzf
nmap <Bslash>c :Commits<cr>

" [rg](BurntSushi/ripgrep)
" search code in files.
noremap <silent> <c-f> :Rg<CR>
" [Ag](ggreer/the_silver_searcher)
" A code searching tool similar to ack, with a focus on speed.
" `sudo apt install the_silver_searcher`
" search filename
" setting in .bashrc for searching hidden files.:FZF actually would use the_silver_searcher's 'ag'.
noremap <silent> <Bslash>F :FZF<CR>
nnoremap <silent> <Bslash>f :RgCurrentFile<CR>
" The history of the opened files.
noremap <silent> <Bslash>h :History<CR>
noremap <silent> <Bslash>bt :BTags<CR>	" the current file's variables
" Project tags, save all variables.
noremap <silent> <C-t> :Tags<CR>
noremap <silent> <Bslash>bu :Buffers<CR>


" ===
" === vim-bujo
" ===
nmap ,l :Todo<CR>
" Insert a new task:
nmap <c-s> <Plug>BujoAddnormal
imap <c-s> <Plug>BujoAddinsert
" Check off a task:
nmap <c-q> <Plug>BujoChecknormal
imap <c-q> <Plug>BujoCheckinsert
" Change cache directory:
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
" Change todo window width:
let g:bujo#window_width = 50


" ===
" === Different between nvim and vim
" ===
if has('nvim')
	" ===
	" === rnvimr
	" ===
	let g:rnvimr_enable_ex = 1
	let g:rnvimr_enable_picker = 1
	let g:rnvimr_draw_border = 0
	highlight link RnvimrNormal CursorLine
	tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
	nnoremap <silent> <M-o> :RnvimrToggle<CR>
	" nnoremap <silent> <Bslash>r :RnvimrToggle<CR>
	tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
	" Map Rnvimr action
	let g:rnvimr_action = {
				\ '<C-t>': 'NvimEdit tabedit',
				\ '<C-x>': 'NvimEdit split',
				\ '<C-v>': 'NvimEdit vsplit',
				\ 'gw': 'JumpNvimCwd',
				\ 'yw': 'EmitRangerCwd'
				\ }
	" Customize the initial layout
	let g:rnvimr_layout = { 'relative': 'editor',
				\ 'width': &columns,
				\ 'height': &lines,
				\ 'col': 0,
				\ 'row': 0,
				\ 'style': 'minimal' }
	let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0},
						  \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0}]
else
	" ===
	" === Ranger.vim
	" ===
	execute "set <M-o>=\eo"
	nnoremap <M-o> :Ranger<CR>
	let g:ranger_map_keys = 0
endif


" ===
" === tagbar
" ===
" :taglist
" Requestment: ctags
nmap ,t :TagbarToggle<CR><C-w>l
let g:tagbar_width = 30
let g:tagbar_left = 0
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


"  ===
"  === vista.vim
"  ===
noremap <silent> vv :Vista!!<CR>
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


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


" Press F8 to regenerate the tag file
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR><CR>
imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR><CR>
set tags=tags
set tags+=./tags "Search the tags in current filefolder
set tags+=~/ctags/tags "When searching the tags, search the ~/ctags/tags at the same time. Don't move the tags file after 'ctags -R'. Otherwise, prompt the warning "Can't find any souce file" when you press Ctrl+]


" ===
" === vim-deus
" ===
color deus
set t_Co=256
" it's awesome, but I don't like a feature about highlight
" e.g: the word "red" would be highlight red.
" it's awesome for css
set termguicolors
" fix color bug about the display of vim's TrueColor
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set background=dark    " Setting dark mode statusline. or so setting 'light' mode
let g:deus_invert_selection = '0'
colorscheme deus
let g:deus_termcolors=256


" ===
" === Highlight Settings
" ===
" :hi to veiw palette
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText cterm=bold ctermfg=235 ctermbg=109 gui=bold guifg=#2C323B guibg=#83a598
" Python PEP8: Error: line too long (183 > 79 characters). So set colorcolumn=80
highlight ColorColumn ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python call matchadd('ColorColumn', '\%80v', 100)
" OR
" set colorcolumn=81
" highlight ColorColumn term=reverse cterm=reverse
hi NonText ctermfg=gray guifg=grey10
let g:highlightedyank_highlight_duration = 2000
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END


" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
source ~/.config/snippits.vim
" markdown auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === vim-polyglot
" ===
" let g:polyglot_disabled = ['css']


" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mj :BookmarkNext<CR>
    nmap mk :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear
    nmap mx :BookmarkClearAll
    nmap mp :BookmarkMoveUp
    nmap mn :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mj
    unmap mk
    unmap ma
    unmap mc
    unmap mx
    unmap mp
    unmap mn
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()


" ===
" === vimade
" ===
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 0


" ===
" === coc.nvim
" ===
" coc-python can't autofresh the complete item after backspace. coc can't implementation.
" Only manual trigger completion by pressing Tab
" if hidden is not set, TextEdit might fail.
set hidden
set nobackup
set nowritebackup

set cmdheight=2
" if the echo is blinked out in `cmdline`, you cant set updatetime to be larger.
set updatetime=300
" always show signcolumns. Display the sign in the left column.
set signcolumn=yes

let g:coc_config_home = $HOME.'/.config/'
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
" get correct comment highlighting for the configureation file(coc-settings.json)
autocmd FileType json syntax match Comment +\/\/.\+$+
" You can automatically install multiple extensions when the coc.nvim service starts by defining global variable `g:coc_global_extensions`
let g:coc_global_extensions = ['coc-python', 'coc-pyls', 'coc-vimlsp', 'coc-translator',
	\ 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-tailwindcss', 'coc-stylelint',
	\ 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-highlight', 'coc-snippets',
	\ 'coc-cmake', 'coc-clangd', 'coc-explorer', 'coc-emoji', 'coc-dictionary']
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
   		\ pumvisible() ? "\<C-n>" :
   		\ <SID>check_back_space() ? "\<Tab>" :
   		\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" coc-snippets
" supported .tex not only .latex
let g:tex_flavor = "latex"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" remap Ctrl+j to trigger completion.
inoremap <silent><expr> <c-j> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Useful commands
nnoremap <silent> <Bslash>y :<C-u>CocList -A --normal yank<cr>
" `:CocDiagnostics` to check for syntax errors(warning).
" e.g: According to the python's PEP8 syntax rules.
" Use `[e` and `]e` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gr <Plug>(coc-references)
" default "gi": Insert text in the same position as where Insert mode was stopped last time in the current buffer.
" nmap gi <Plug>(coc-implementation)
" rename current word
nmap <F2> <Plug>(coc-rename)

" Use D to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Formatting selected code.
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" ===
" === coc-translator
" ===
" :CocList translator
" press Tab can select operation(yank, append, delete) after `:CocList translator`
" popup
nmap <LEADER>t <Plug>(coc-translator-p)
vmap <LEADER>t <Plug>(coc-translator-pv)
" echo
nmap <LEADER>e <Plug>(coc-translator-e)
vmap <LEADER>e <Plug>(coc-translator-ev)
" replace
nmap <LEADER>r <Plug>(coc-translator-r)
vmap <LEADER>r <Plug>(coc-translator-rv)


" ===
" === Tabular
" ===
" :Tabularize /=<CR>, equal signs(=) could be aligned.
" If you don’t like stacking the colons in a column, you could use the \zs atom to exclude the : character from the search match.
" :Tabularize /:\zs<CR>.
" a(mnemonic for align)
vmap ga :Tabularize /
"If you put [this gist](https://gist.github.com/tpope/287147#file-cucumbertables-vim) in your vimrc file, then it will call the :Tabularize command each time you insert a | character.


" ===
" === vim-repeat
" ===
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


" ===
" === vim-after-object
" ===
" va=  visual after =
" ca=  change after =
" da=  delete after =
" ya=  yank after =
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === NrrwRgn
" ===
vmap <LEADER>nr <Plug>NrrwrgnDo


" ===
" === Remove Unwant Spaces
" ===
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


" ===
" === vimspector
" ===
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimtex_view_general_viewer = 'zathura'
" The last two lines configure the concealment.
set conceallevel=1
let g:tex_conceal='abdmg'


" http://vim.wikia.com/wiki/Copy_search_matches
" https://www.vim.org/scripts/script.php?script_id=4795
" :CopyMatches x, Copy Matched context to register x. `"xp` to paste.
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)


" ===
" === vim-which-key
" ===
set timeoutlen=500
" Executes native commands if keymap is not defined.
" use `:WhichKey 'g'` and get `gg` work correct:
let g:which_key_fallback_to_native_key=1
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

let g:which_key_map = {}
let g:which_key_map.s = {
    \'name': '+set-spell/paste',
    \ 'p': 'toggle paste mode',
    \ 's': 'toggle spell checking mode'
    \}
let g:which_key_map.f = {
    \ 'name': '+format-code',
    \ 'm': '<Plug>(coc-format-selected)'
    \}
let g:which_key_map.w = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , 'other-window']          ,
    \ 'd' : ['<C-W>c'     , 'delete-window']         ,
    \ '-' : ['<C-W>s'     , 'split-window-below']    ,
    \ '|' : ['<C-W>v'     , 'split-window-right']    ,
    \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
    \ 'k' : ['<C-W>k'     , 'window-up']             ,
    \ 'j' : ['<C-W>j'     , 'window-below']          ,
    \ 'h' : ['<C-W>h'     , 'window-left']           ,
    \ 'l' : ['<C-W>l'     , 'window-right']          ,
    \ 'K' : [':resize -5'  , 'expand-window-up']      ,
    \ 'J' : [':resize +5'  , 'expand-window-below']   ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
    \ '=' : ['<C-W>='     , 'balance-window']        ,
    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
    \ '/' : ['Windows'    , 'fzf-window']            ,
    \ }
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ '1' : ['b1'        , 'buffer 1']        ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'H' : ['bfirst'    , 'first-buffer']    ,
    \ 'L' : ['blast'     , 'last-buffer']     ,
    \ 'l' : ['bnext'     , 'next-buffer']     ,
    \ 'h' : ['bprevious' , 'previous-buffer'] ,
    \ '?' : ['Buffers'   , 'fzf-buffer']      ,
    \ }
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> , :WhichKey  ','<CR>
nnoremap <silent> g :WhichKey  'g'<CR>
nnoremap <silent> [ :WhichKey  '['<CR>
nnoremap <silent> ] :WhichKey  ']'<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <Bslash> :WhichKey  '<Bslash>'<CR>
