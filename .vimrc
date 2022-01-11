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
" set t_RB= t_RF= t_RV= t_u7= t_ut=
" when opening vim have latency and Dispaly >4;2m.Maybe it's because of Xmodmap .
" let &t_TI = ""
" let &t_TE = ""
" Change cursor shape in different modes
" [Refer](https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes)
let &t_SI.="\e[6 q" "SI = INSERT mode  6 -> solid vertical bar
let &t_SR.="\e[4 q" "SR = REPLACE mode 4 -> solid underscore
let &t_EI.="\e[2 q" "EI = NORMAL mode  2 -> solid block

" Vim overrule your settings(Highlight colors) with the defaults, use: > `:syntax on`
syntax enable
set nocompatible
filetype on
filetype plugin indent on
set encoding=UTF-8
set fileencodings=utf-8,gbk

" Shift+insert paste from system clipboard without any dependency.
" vim version feature must include clipboard.
" I recommend nvim more.
" `"+y` means to first press `"` release then press `+` finally press `y`
set clipboard=unnamedplus
" Copy/Paste. vim must be running when using shared clipboard.
vnoremap Y "+y
" nnoremap <C-b> "*p

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
noremap <LEADER>sb :set scrollbind!<CR>
set tabstop=4
autocmd FileType python,nas set expandtab
set shiftwidth=4
set softtabstop=4
" :help 'whichwrap, [Automatically wrap left and right].
" By default, when pressing left/right cursor keys
" Vim will not move to the previous/next line after reaching first/last character in the line.
set whichwrap+=<,>,[,]
" :help 'backspace
set backspace=indent,eol,start

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
""" setlocal spell
""" set spelllang=nl,en_gb
""" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
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
" ^ to first non-blank character, 0 to first character.
" noremap H 0
" noremap L $
noremap W 5w
noremap B 5b
" nnoremap <CR> o<Esc>
nnoremap <S-CR> i<CR><Esc>
nnoremap <C-k> Hzz
nnoremap <C-j> Lzz

" it would be prone to bugs if mapping : ;.
" noremap ; :

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

" has() is a system command. use it  as little as possible. Maybe, not sure.
" Maybe conflict with your terminator's shortcuts.
" Please resolve conflicts
if !has('nvim')
    execute "set <M-w>=\ew"
    execute "set <M-h>=\eh"
    execute "set <M-j>=\ej"
    execute "set <M-k>=\ek"
    execute "set <M-l>=\el"
    execute "set <M-0>=\e0"
    execute "set <M-1>=\e1"
    execute "set <M-2>=\e2"
    execute "set <M-3>=\e3"
    execute "set <M-4>=\e4"
    execute "set <M-5>=\e5"
    execute "set <M-6>=\e6"
    execute "set <M-7>=\e7"
    execute "set <M-8>=\e8"
    execute "set <M-9>=\e9"
endif
" Terminal mode:
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-w> <Esc><c-w>w
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
" Normal mode:
nnoremap <LEADER>h <c-w>h
nnoremap <LEADER>j <c-w>j
nnoremap <LEADER>k <c-w>k
nnoremap <LEADER>l <c-w>l
map <LEADER>1 1<C-w><C-w>
map <LEADER>2 2<C-w><C-w>
map <LEADER>3 3<C-w><C-w>
map <LEADER>4 4<C-w><C-w>
map <LEADER>5 5<C-w><C-w>
map <LEADER>6 6<C-w><C-w>
map <LEADER>7 7<C-w><C-w>
map <LEADER>8 8<C-w><C-w>
map <LEADER>9 9<C-w><C-w>
map <LEADER>0 10<C-w><C-w>
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
map <M-1> 1<C-w><C-w>
map <M-2> 2<C-w><C-w>
map <M-3> 3<C-w><C-w>
map <M-4> 4<C-w><C-w>
map <M-5> 5<C-w><C-w>
map <M-6> 6<C-w><C-w>
map <M-7> 7<C-w><C-w>
map <M-8> 8<C-w><C-w>
map <M-9> 9<C-w><C-w>
map <M-0> 10<C-w><C-w>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" use 'M' to maximize and 'm' to balance windows.
nnoremap <LEADER>wM <C-W>\| <C-W>_
nnoremap <LEADER>wm <C-W>=

noremap sv <C-w>t<C-w>H
noremap su <C-w>t<C-w>K
" Rotate screens
noremap srv <C-w>b<C-w>K
noremap sru <C-w>b<C-w>H

" ===
" === Tab Management
" ===
" `N Backpack` go to N tab or N buffer
" Create a new tab with tu
noremap ti :tabe<CR>
noremap tc :tabclose<CR>
noremap tC :tabonly<CR>
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

map S :w<CR>
" Alt+Shift+q to Switch to Ex mode.
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <LEADER>Q :q!<CR>
map <LEADER>R S:source $MYVIMRC<CR>
map <LEADER>rc :tabedit ~/.config/.vimrc<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>n :set nonu<CR>:set norelativenumber<CR>
map <LEADER>N :set nu<CR>:set relativenumber<CR>
"Greater Indent format for copying from Internet or no
set pastetoggle=<F10>
map <LEADER>sp :set paste!<CR>


" ===
" === terminal mode
" ===
"This was because that vim couldn't execute system function in fish. Add set
"shell=sh in your vimrc.Maybe the issue has been fixed.
set shell=zsh
" :terminal can open a terminal at vim>=8.1
" ctrl+d exit terminal at insert mode.
if has('nvim')
    autocmd TermOpen term://* startinsert
    noremap <Bslash>py :set splitbelow<CR>:split term://ipython3<CR>
    noremap <Bslash>t :set splitbelow<CR>:split term://zsh<CR>
    noremap <c-g> :tabe term://lazygit<CR>

else
    noremap <Bslash>py :belowright term ipython3<CR>
    noremap <Bslash>t :belowright term<CR>
    noremap <c-g> :tab term lazygit<CR>
endif
" <C-v><Esc> exit insert mode into normal mode
tnoremap <C-v><Esc> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:bd!<CR>
tnoremap <C-o> <C-\><C-n><C-o>


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
inoremap <c-a> <HOME>
inoremap <c-e> <END>
inoremap <c-f> <Right>
inoremap <c-b> <Left>


call plug#begin('~/.vim/plugged')
" Option 'on', means On-demand loading: Commands or <Plug>-mappings
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'

" Markdown, It only works on vim >= 8.1 and neovim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}
Plug 'Delayless/bullets.vim'  " automated bullet lists, :RenumberSelection.
Plug 'SidOfc/mkdx'  "used for jump headline from Toc.
" Plug 'plasticboy/vim-markdown'
Plug 'ferrine/md-img-paste.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex'
Plug 'Yggdroot/indentLine'    " mess up vimwiki's conceallevel and highlight.
Plug 'skywind3000/vim-rt-format', { 'do': 'pip3 install autopep8' }

" Optimize Chinese input experience
" To avoid the Esc delay, please set 'ttimeoutlen' to 100 or some value.
" It's also related to screens's maptimeout
" Plug 'lilydjwg/fcitx.vim'

" Install nodejs when necessary:  curl -sL install-node.now.sh/lts | bash
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips'
Plug 'Delayless/vim-snippets'

" Requestment: universal-ctags for debian family, ctags for arch
Plug 'liuchengxu/vista.vim'

" Plug 'Konfekt/FastFold'
" Plug 'tpope/vim-capslock' " Ctrl+L (insert) to toggle capslock

" Pretty Dress
" Plug 'liuchengxu/eleline.vim' " statusbar
Plug 'itchyny/lightline.vim' " Lightline statusbar
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight
Plug 'Delayless/vim-deus'  " It only works on vim >=8.1 and neovim
Plug 'frazrepo/vim-rainbow'
Plug 'joshdick/onedark.vim'
Plug 'bling/vim-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'Delayless/vim-bookmarks'
" fades your inactive buffers and preserves syntax highlighting.
Plug 'TaDaa/vimade'
Plug 'mhinz/vim-startify'   " StartPage
Plug 'junegunn/goyo.vim'    " focus read/write
Plug 'junegunn/limelight.vim' " Hyperfocus on a range

Plug 'vim-scripts/restore_view.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Delayless/vim-bujo'   "TODO
Plug 'mtth/scratch.vim'  " Open a scratch window.
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'  " vimwiki daily Index in calendar.

" ysiw{ ysiw} yss<p1> cs ds{, Visual select and input S<p class="important">
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim' " Enter to select the closest text object(brackets).
Plug 'jiangmiao/auto-pairs' " better than coc-pairs, Alt+p toggle autopairs.
Plug 'airblade/vim-matchquote'  " %-style motion for single/double quotation mark, ` (backtick), and | (pipe).
Plug 'zef/vim-cycle' " toggle true/false....(ctrl+a, ctrl+x)
Plug 'voldikss/vim-translator' " better than coc-translator in nvim.
Plug 'godlygeek/tabular' "Align, :Tabularize /】\zs<CR>
Plug 'tpope/vim-repeat' " The . command will work with ds, cs, yss
Plug 'junegunn/vim-after-object' " copy, change, delete, yank after some symbols like `=/:/-/#/<space>`
Plug 'chrisbra/NrrwRgn'     "display narrow region(focus)
Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-python --enable-c --enable-go'}
Plug 'liuchengxu/vim-which-key'
Plug 'mboughaba/i3config.vim'
Plug 'ron89/thesaurus_query.vim'
" if the filetype isn't supported, adjust 'commentstring'
" autocmd FileType apache setlocal commentstring=#\ %s
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'rbgrouleff/bclose.vim'    "Dependency for ranger.vim
Plug 'francoiscabrol/ranger.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'

if has('nvim')
    " Plug 'cpiger/NeoDebug'
    Plug 'lambdalisue/suda.vim'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'akinsho/nvim-bufferline.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	map <LEADER>S :SudaWrite<CR>
else
    map <LEADER>S :w !sudo tee %<CR><CR>
	Plug 'mg979/vim-xtabline'   "Tab manager in the top of windows
	Plug 'tenfyzhong/joplin.vim'
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
map ff :NERDTreeToggle<CR>
" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "u"
let NERDTreeMapUpdirKeepOpen = "U"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "L"
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "h"
let NERDTreeMapChangeRoot = "o"
let NERDTreeMapToggleHidden="I"
let NERDTreeMapMenu = ","
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']


" ===
" === nerdtree-git-plugin
" ===
"let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
" autocmd VimEnter * unlet g:NERDTreeUpdateOnCursorHold
" let g:NERDTreeGitStatusLogLevel = 3

" ==
" == vim-gitgutter
" ==
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gd :GitGutterPreviewHunk<CR>
nnoremap <LEADER>gk :GitGutterPrevHunk<CR>
nnoremap <LEADER>gj :GitGutterNextHunk<CR>
" Git add(stage) this change
nnoremap <LEADER>ga :GitGutterStageHunk<CR>
" Undo Changed Context
nnoremap <LEADER>gu :GitGutterUndoHunk<CR>


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
let g:mkdp_auto_close = 1
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
" markdown auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === bullets.vim
" ===
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
" === mkdx
" ===
" The last two lines configure the concealment. focus
" LaTeX code is replaced or made invisible when your cursor is not on that line.
" e.g, conceal link on `[name](link)`, replaces `\bigcap` by ∩, \in by ∈ etc.
set conceallevel=2
" hi Conceal ctermbg=none
let g:tex_conceal='abdmg'
" folding function conflicts with tpope/vim-markdown.
" disable mkdx's folding by `let g:markdown_folding = 1`
" let g:markdown_folding = 1
let g:mkdx#settings = { 'highlight' : { 'enable': 1 },
                      \ 'enter'     : { 'enable': 1, 'o': 0 },
                      \ 'checkbox'  : { 'toggles': [' ', 'o', 'x'] } ,
                      \ 'map'       : { 'enable': 1, 'prefix': '<leader>m'},
                      \ 'tab'       : { 'enable': 1 },
                      \ 'links'     : { 'external': { 'enable': 1 } },
                      \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
                      \ 'fold'      : { 'enable': 0, 'components': ['fence', 'toc']},
                      \ 'tokens'    : { 'strike': '~~' },
                      \ 'auto_update': { 'enable': 0 },
                      \ 'toc': { 'details': { 'summary': 'Click to expand {{toc.text}}' }} }
" make sure the xdg-utils package is installed
let g:mkdx#settings.gf_on_steroids = 1
let g:mkdx#settings.restore_visual = 0
let g:mkdx#settings.tab.enable = 0
autocmd FileType markdown nmap <CR> <Plug>(mkdx-jump-to-header)


" ===
" === vim-table-mode
" ===
" <Leader>tic insert column, <Leader>tdc delete column
noremap <LEADER>tm :TableModeToggle<CR>
noremap <LEADER>tM :TableModeRealign<CR>
vmap <LEADER>tM :TableModeRealign<CR>


" ===
" === vim-markdown
" ===
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_no_default_key_mappings = 1
" " LaTeX code is replaced or made invisible when your cursor is not on that line.
" " e.g, conceal link on `[name](link)`, replaces `\bigcap` by ∩, \in by ∈ etc.
" " To enable conceal use Vim's standard conceal configuration.
" let g:vim_markdown_math = 1
" let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_auto_extension_ext = 'txt'   "open txt using markdonw
" let g:vim_markdown_auto_insert_bullets = 0
" " open a new file in 'tab', 'vsplit', 'hsplit', 'current'
" let g:vim_markdown_edit_url_in = 'tab'
" " map `gx`: open the link under the cursor <Plug>Markdown_OpenUrlUnderCursor
" " map `ge`: open the link under the cursor in Vim for editing.
" " Useful for relative markdown links. <Plug>Markdown_EditUrlUnderCursor
" " See help documentation for more information.
" " e.g. `]]`, '[[`, `][', '[]', `]c`, ']u', ':Toc', 'InsertToc'
" map ge <Plug>Markdown_EditUrlUnderCursor
" map ]c <Plug>Markdown_MoveToCurHeader


" ===
" === md-img-paste.vim
" ===
autocmd FileType markdown nmap <buffer><silent> <leader>pi :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
" let cwd = $PWD . 'static/img'
" let g:mdip_imgdir_absolute = cwd
" let g:mdip_imgdir_intext = '/static/img'
function! g:LatexPasteImage(relpath)
    execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    let ipos = getcurpos()
    execute "normal! a" . "mage}"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'


" ===
" === vim-markdown-toc
" ===
" :GenTocGFM generate TOC
" :GenTocGFM for GitHub, :GenTocGitLab for GitLab
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_cycle_list_item_markers = 1 " mark by *-+, not only *.
" let g:vmt_include_headings_before = 1


" ===
" === indentLine
" ===
" Add one of the two following lines.
" Otherwise, it will mess up vimwiki's conceallevel and highlight.
let g:indentLine_setConceal = 0
" let g:indentLine_concealcursor = ''


" ===
" === vim-rt-format
" ===
" By default, it will be triggered by `ENTER` in insert mode.
" set this to 1 to use `CTRL+ENTER` instead, and keep the
" default `ENTER` behavior unchanged.
let g:rtf_ctrl_enter = 0
" Enable formatting when leaving insert mode
let g:rtf_on_insert_leave = 1


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
    \   'rg --column --line-number --no-heading --color=always --smart-case --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --hidden .'.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:40%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

command! -bang -nargs=* SearchVariableInProject
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden .'.shellescape(expand('<cword>')), 1,
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
" search code in files. [s]ource code
noremap <silent> <Bslash>s :Rg<CR>
" [Ag](ggreer/the_silver_searcher)
" A code searching tool similar to ack, with a focus on speed.
" `sudo apt install the_silver_searcher`
" search filename
" setting in .bashrc for searching hidden files.:FZF actually would use the_silver_searcher's 'ag'.
nnoremap <silent> <Bslash>f :FZF<CR>
nnoremap <silent> <c-f> :RgCurrentFile<CR>
" `gr` go to references use coc.nvim.
nnoremap <silent> gR :SearchVariableInProject<CR>
" The history of the opened files.
noremap <silent> <Bslash>h :History<CR>
" the current file's variables
noremap <silent> <Bslash>bt :BTags<CR>
" Project tags, save all variables.
noremap <silent> <C-t> :Tags<CR>
noremap <silent> <Bslash>bu :Buffers<CR>


" ===
" === ctrlp.vim
" ===
let g:ctrlp_map = '<M-f>'
let g:ctrlp_cmd = 'CtrlP'


" ===
" === vim-bujo
" ===
nmap <Bslash>l :Todo<CR>
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
" === vimwiki
" ===
" :h vimwiki-local-mappings
let g:vimwiki_table_mappings = 0
" If set 1, vimwiki will set all markdown files' filetype to vimwiki.
let g:vimwiki_global_ext = 0
" let g:vimwiki_tab_key = '<F7>'
" let g:vimwiki_shift_tab_key = '<F8>'
" One or more wikis can be registered using the `g:vimwiki_list` variable.
" autocmd FileType mdvimwiki UltiSnipsAddFiletypes vimwiki
" use my custom folder, markdown syntax and custom extension
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki_html/', 'auto_toc': 1 },
					\ {'path': '~/mdwiki/', 'syntax': 'markdown', 'ext': '.mdvimwiki'}]
nmap <LEADER>wj <Plug>VimwikiNextLink
nmap <LEADER>wk <Plug>VimwikiPrevLink
nmap <LEADER>wha <Plug>VimwikiAll2HTML
nmap <LEADER>wV <Plug>VimwikiSplitLink
nmap <LEADER>wv <Plug>VimwikiVSplitLink
" the same as glp and gln.
" At the same time, only one shortcut can take effect.
" after the map <Plug>, the original shortcut keys will be invalid.
" nmap <LEADER>w- <Plug>VimwikiDecrementListItem
" nmap <LEADER>w= <Plug>VimwikiIncrementListItem


" ===
" === ranger.vim
" ===
if !has("nvim")
    execute "set <M-o>=\eo"
    execute "set <M-i>=\ei"
endif
let g:ranger_map_keys = 0
nnoremap <M-o> :Ranger<CR>
nnoremap <M-i> :RangerNewTab<CR>
let g:NERDTreeHijackNetrw = 0   " add this line if you use NERDTree
let g:ranger_replace_netrw = 1  " open ranger when vim open a directory


"  ===
"  === vista.vim
"  ===
noremap <silent> vv :Vista!!<CR>
let g:vista_close_on_jump = 1
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
        exec "!g++ -g % -o %<.o"
        :below sp
		:res -5
        exec "term time ./%<.o"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 -g % -Wall -o %<.o"
        :sp
        :res -15
        exec "term time ./%<.o"
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
let g:eleline_powerline_fonts = 1


" ===
" === lightline.vim
" ===
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }


" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1


" Press F8 to regenerate the tag file
" map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR><CR>
" imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR><CR>
" set tags=tags
" set tags+=./tags "Search the tags in current filefolder
" set tags+=~/ctags/tags "When searching the tags, search the ~/ctags/tags at the same time. Don't move the tags file after 'ctags -R'. Otherwise, prompt the warning "Can't find any souce file" when you press Ctrl+]


" ===
" === Pretty Dress, Highlight Settings
" ===
" :hi to veiw palette
if exists('+termguicolors')
    " e.g: the word "red" would be highlight red.
    set termguicolors
    " fix color bug about the display of vim's TrueColor.
    " ctrl+v then press <Esc> to generate 
    let &t_8f = "[38;2;%lu;%lu;%lum"
    let &t_8b = "[48;2;%lu;%lu;%lum"
	let &t_Co = "256"
	" set t_Co=256
	" set t_8f=[38;2;%lu;%lu;%lum
	" set t_8b=[48;2;%lu;%lu;%lum
endif
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" effect on the color of eleline
set background=dark
" colorscheme deus
colorscheme onedark
" Python PEP8: Error: line too long (183 > 79 characters). So set colorcolumn=80
" set colorcolumn=81
" highlight ColorColumn term=reverse cterm=reverse
" OR
highlight ColorColumn ctermbg=red ctermfg=white guibg=#5e2020
autocmd FileType python call matchadd('ColorColumn', '\%80v', 100)
" highlight Visual ctermbg=2 gui=NONE guibg=#3E4452
" highlight Search ctermfg=235 ctermbg=180 guifg=#282C34 guibg=#E0A431
" highlight IncSearch ctermfg=180 ctermbg=59 guifg=#E0A431 guibg=#3E454F
highlight BookmarkSign ctermfg=33 guibg=#19202b guifg=#0d87d9
highlight BookmarkLine cterm=italic ctermfg=232 ctermbg=33 guibg=#181a33
highlight BookmarkAnnotationSign ctermfg=28 guibg=#19202b guifg=#09e017
highlight BookmarkAnnotationLine ctermfg=232 ctermbg=28 gui=bold,italic guibg=#183319


" ===
" === vim-rainbow
" ===
au FileType c,cpp,hpp,h,objc,objcpp,go call rainbow#load()
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
" let g:bookmark_sign = '♥'
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_highlight_lines = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mj :BookmarkNext<CR>
    nmap mk :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear
    nmap mx :BookmarkClearAll
    nmap mp :BookmarkMoveUp<CR>
    nmap mn :BookmarkMoveDown<CR>
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
let g:vimade = {
    \ "fadelevel": 0.8,
    \ "colbufsize": 1,
    \ "rowbufsize": 1,
    \ "enablesigns": 0,
    \}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 0


" ===
" === goyo.vim
" ===
" :q to quit even when Goyo is active.
noremap <LEADER>gy :Goyo<CR>
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ===
" === coc.nvim
" ===
" coc-python can't autofresh the complete item after backspace. coc can't implementation.
" Only manual trigger completion by pressing Tab
" if hidden is not set, TextEdit might fail.
set hidden
" set nobackup
" set nowritebackup

" if the echo is blinked out in `cmdline`, you cant set updatetime to be larger.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" always show signcolumns. Display the sign in the left column.
set signcolumn=yes

let g:coc_config_home = $HOME.'/.config/'
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
" get correct comment highlighting for the configureation file(coc-settings.json)
autocmd FileType json syntax match Comment +\/\/.\+$+
" You can automatically install multiple extensions when the coc.nvim service starts by defining global variable `g:coc_global_extensions`
let g:coc_global_extensions = [  'coc-dictionary', 'coc-word', 'coc-emoji', 'coc-marketplace', 'coc-diagnostic',
            \ 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-highlight', 'coc-snippets', 'coc-actions',
            \ 'coc-cmake', 'coc-python', 'coc-pyright', 'coc-vimlsp', 'coc-translator', 'coc-texlab',
            \ 'coc-html', 'coc-prettier', 'coc-css', 'coc-tailwindcss', 'coc-stylelint', 'coc-go',
            \ 'coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-eslint', 'coc-snippets']
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-@> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
" Use D to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> D :call <SID>show_documentation()<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Formatting selected code.
" `<LEADER>fm{motion}` in normal mode.
" `<space>fmac` format classobj in normal mode.
xmap <LEADER>fm  <Plug>(coc-format-selected)
nmap <LEADER>fm  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
nnoremap <c-c> :CocCommand<CR>
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Map function and class text objects.
" e.g: map ac to class operation(ac is a new {motion}). `dac` delete whole class.
" use in omap(:h Operator-pending) and xmap(:h visual-mode)
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Commands
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gr <Plug>(coc-references)
" default "gi": Insert text in the same position as where Insert mode was stopped last time in the current buffer.
" nmap gi <Plug>(coc-implementation)
" rename current word
nmap <F2> <Plug>(coc-rename)
nmap <LEADER>rn <Plug>(coc-rename)
nnoremap <silent> <Bslash>y :<C-u>CocList -A --normal yank<cr>
" open application market.
nnoremap <silent> <Bslash>a :CocList marketplace<CR>
" coc-diagnostic
" `:CocDiagnostics` to check for syntax errors(warning).
noremap <silent><nowait> <LEADER>dd :CocList diagnostics<cr>
nmap <silent> <LEADER>ek <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>ej <Plug>(coc-diagnostic-next)
" coc-snippets
" supported .tex not only .latex
let g:tex_flavor = "latex"
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
" let g:coc_snippet_next = '<c-j>'
" let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'Delayless'
" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
source ~/.config/snippits.vim


" ===
" === ultisnips
" ===
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/', $HOME.'/.config/UltiSnips/']


" ===
" === coc-translator
" ===
" :CocList translator
" pressing Tab can select operation(yank, append, delete) after `:CocList translator`
" popup
nmap <LEADER>tt <Plug>(coc-translator-p)
vmap <nowait> <LEADER>tt <Plug>(coc-translator-pv)
" echo
" nmap <LEADER>e <Plug>(coc-translator-e)
" vmap <LEADER>e <Plug>(coc-translator-ev)
" replace
" nmap <LEADER>r <Plug>(coc-translator-r)
" vmap <LEADER>r <Plug>(coc-translator-rv)


" ===
" === Tabular
" ===
" :Tabularize /=<CR>, equal signs(=) could be aligned.
" If you don’t like stacking the colons in a column, you could use the \zs atom to exclude the : character from the search match.
" :Tabularize /:\zs<CR>.
" a(mnemonic for align)
vmap <LEADER>tb :Tabularize /
"If you put [this gist](https://gist.github.com/tpope/287147#file-cucumbertables-vim) in your vimrc file, then it will call the :Tabularize command each time you insert a | character.


" ===
" === wildfire.vim
" ===
let g:wildfire_fuel_map = "<ENTER>"
let g:wildfire_water_map = "<BS>"
let g:wildfire_objects =  ["i'", 'i"', "i)", "i]", "i}", "ip", "it", "i>", "i`"]

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
" === vimtex
" ===
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_use_temp_files = 1
" Backward search requires `xdotool` for zathura
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_autoclose_after_keystrokes=1
nmap <leader>vi  <plug>(vimtex-info)
nmap <leader>vI  <plug>(vimtex-info-full)
nmap <leader>vt  <plug>(vimtex-toc-open)
nmap <leader>vT  <plug>(vimtex-toc-toggle)
nmap <leader>vq  <plug>(vimtex-log)
nmap <leader>vv  <plug>(vimtex-view)
nmap <leader>vr  <plug>(vimtex-reverse-search)
nmap <leader>vl  <plug>(vimtex-compile)
nmap <leader>vL  <plug>(vimtex-compile-selected)
nmap <leader>vk  <plug>(vimtex-stop)
nmap <leader>vK  <plug>(vimtex-stop-all)
nmap <leader>ve  <plug>(vimtex-errors)
nmap <leader>vo  <plug>(vimtex-compile-output)
nmap <leader>vg  <plug>(vimtex-status)
nmap <leader>vG  <plug>(vimtex-status-all)
nmap <leader>vc  <plug>(vimtex-clean)
nmap <leader>vC  <plug>(vimtex-clean-full)
nmap <leader>vm  <plug>(vimtex-imaps-list)
nmap <leader>vx  <plug>(vimtex-reload)
nmap <leader>vX  <plug>(vimtex-reload-state)
nmap <leader>vs  <plug>(vimtex-toggle-main)


" ===
" === vimspector
" ===
" let g:vimspector_enable_mappings = 'HUMAN'
let g:ycm_semantic_triggers =  {'VimspectorPrompt': [ '.', '->', ':', '<']}
" the mapping refers to the abbreviation of gdb commands
" When debugging, continue. Otherwise start debugging.
nmap <leader>dc  <Plug>VimspectorContinue
nmap <leader>dq  <Plug>VimspectorStop
" equal gdb command `run`
nmap <leader>dr  :call CompileRunGcc()<CR><Esc>:q<CR><Plug>VimspectorRestart<CR><Esc><Esc>
nmap <leader>dP  <Plug>VimspectorPause
" Toggle line breakpoint on the current line.
nmap <leader>db  <Plug>VimspectorToggleBreakpoint
" set a conditional breakpoint
nmap <leader>dif  <Plug>VimspectorToggleConditionalBreakpoint
" Add a function breakpoint for the expression under cursor
nmap <leader>dB  <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>dn  <Plug>VimspectorStepOver
nmap <leader>ds  <Plug>VimspectorStepInto
" equal gdb command `finish`
nmap <leader>df  <Plug>VimspectorStepOut
nmap <leader>dw :VimspectorWatch
nmap <leader>de :VimspectorEval
nmap <leader>do :VimspectorShowOutput
let g:vimspector_json_path=$HOME . "/.config/vimspector_template/"
" command! -bang -nargs=* LoadVimSpectorJson call fzf#run({
"             \   'source': 'ls -d ' . vimspector_json_path . '*',
"             \   'sink': 'e .vimspector.json | 0r',
"             \   'down': '25%',
"             \   'options': '--preview-window=hidden'
"             \ })

command! -bar -nargs=1 LoadVimSpectorTemplate
    \ execute "0r ".g:vimspector_json_path.<q-args>
command! -bang -nargs=* LoadVimSpectorJson call fzf#run({
            \   'source': 'ls ' . vimspector_json_path,
            \   'sink': 'e .vimspector.json | LoadVimSpectorTemplate',
            \   'down': '25%',
            \   'options': '--preview-window=hidden'
            \ })
noremap <leader>dvs :LoadVimSpectorJson<CR>
" The configuration(autocmd TermOpen term://* startinsert) lead to (the vimspector's default debug window) entering insert mode instead of normal mode
" add the follow configuration
autocmd BufEnter vimspector.Console stopinsert


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


" [Refer](https://vim.fandom.com/wiki/Capture_ex_command_output)
" :TabMessage highlight
function! TabMessage(cmd)
    redir => message
    silent execute a:cmd
    redir END
    if empty(message)
        echoerr "no output"
    else
        " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
        tabnew
        setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
        silent put=message
    endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)


" ===
" === vim-which-key
" ===
set timeoutlen=800
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
    \ 'm' : 'minimize-windows'  ,
    \ 'M' : 'maximize-window'   ,
    \ '+' : ['\<C-W>=' , 'balance-window'   ] ,
    \ '/' : ['Windows' , 'fzf-window'       ] ,
    \ }
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ '1' : [':b1'        , 'buffer 1'            ] ,
    \ '2' : [':b2'        , 'buffer 2'            ] ,
    \ '3' : [':b3'        , 'buffer 3'            ] ,
    \ '4' : [':b4'        , 'buffer 4'            ] ,
    \ '5' : [':b5'        , 'buffer 5'            ] ,
    \ '6' : [':b6'        , 'buffer 6'            ] ,
    \ '7' : [':b7'        , 'buffer 7'            ] ,
    \ '8' : [':b8'        , 'buffer 8'            ] ,
    \ 'd' : [':bd'        , 'delete-buffer'       ] ,
    \ 'W' : [':bw!'       , 'force-delete-buffer' ] ,
    \ 'H' : ['bfirst'    , 'first-buffer'        ] ,
    \ 'L' : ['blast'     , 'last-buffer'         ] ,
    \ 'l' : ['bnext'     , 'next-buffer'         ] ,
    \ 'h' : ['bprevious' , 'previous-buffer'     ] ,
    \ '?' : ['Buffers'   , 'fzf-buffer'          ] ,
    \ }
call which_key#register('<Space>', "g:which_key_map")

" nnoremap <silent> , :WhichKey  ','<CR>
" vnoremap <silent> , :WhichKeyVisual ','<CR>
nnoremap <silent> [ :WhichKey  '['<CR>
nnoremap <silent> ] :WhichKey  ']'<CR>
" nnoremap <silent> <F1> :WhichKey! g:which_key_help_map<CR>
nnoremap <silent> <LEADER> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <LEADER> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <Bslash> :WhichKey  '<Bslash>'<CR>


" ===
" === i3config
" ===
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end


" ===
" === vim-go
" ===
let g:go_doc_keywordprg_enabled = 0
let g:go_auto_sameids = 0
let g:go_auto_type_info = 1
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1


" ===
" === coc-go
" ===
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')


" ===
" === vim-multiple-cursor
" ===
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-b>'
let g:multi_cursor_select_all_word_key = '<M-n>'
let g:multi_cursor_start_key           = 'g<C-b>'
let g:multi_cursor_select_all_key      = 'g<M-n>'
let g:multi_cursor_next_key            = '<C-b>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ===
" === vim-visual-multi
" ===
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-b>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-b>'           " replace visual C-n


" ===
" === nvim-telescope/telescope.nvim
" ===
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" ===
" === joplin
" ===
let g:joplin_token = ''
let g:joplin_port = 41184
function CdParentDir()
    " Error when open a root file, because index outbound.
    " let parentDir=split(getcwd(), '\/')[-2]
    let cwd=split(getcwd(), '\/')
    for dir in cwd
        if dir == "joplin" && cwd[-1] != "joplin"
            echom dir
            :lcd %:p:h
            :lcd ..
        endif
    endfor
endfunction
autocmd FileReadPost,VimEnter,InsertLeave *.md call CdParentDir()


" ===
" === thesaurus_query.vim
"===
" ctrl+x ctrl+u in insert mode.
" these dicts downloaded from https://github.com/Ron89/thesaurus_query.vim#configuration
let g:tq_mthesaur_file="~/Downloads/mthesaur.txt"
let g:tq_openoffice_en_file="~/Downloads/MyThes-1.0/th_en_US_new"
let g:tq_enabled_backends=["mthesaur_txt", "openoffice_en", "datamuse_com"]
let g:tq_online_backends_timeout = 0.4
" nnoremap <LEADER>cs :ThesaurusQueryReplaceCurrentWord<CR>
" phrase
" vnoremap <LEADER>cs y:ThesaurusQueryReplace <C-r>"<CR>


" :r !w3m -dump https://xxx.com/
" :ViewHtml<CR> view the current html file.
command! ViewHtml execute ':!w3m -dump % | less'


" === gitcommit
" use gq to format the commit message.
au FileType gitcommit setlocal tw=72
au FileType gitcommit setlocal cc=+1
" spell checking
au FileType gitcommit setlocal spell


" ===
" === Searching for all characters as normal text
" ===
" `:SS content`: search characters without escape(ignore regex)
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '/\')|normal! /<C-R>/<CR>
vnoremap * :SS<CR>
" Search selected text in visual mode.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" fast scrolling?
" set lazyredraw
" set regexpengine=1


autocmd InsertLeave * :silent !fcitx5-remote -c
autocmd BufCreate * :silent !fcitx5-remote -c
autocmd BufEnter  * :silent !fcitx5-remote -c
autocmd BufLeave  * :silent !fcitx5-remote -c


au BufNewFile *.cpp,*.[ch],*.sh,*.java :call SetTitle()
func SetTitle()
    "if the file is *.sh
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Function: <++>")
        call append(line(".")+2, "\# Author: <++>")
        "call append(line(".")+2, "\# mail: <++>")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Function: <++>")
        call append(line(".")+2, "    > Author: <++>")
        "call append(line(".")+2, "    > Mail: <++>")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "# include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "# include <stdio.h>")
        call append(line(".")+7, "")
    endif
    "Edit at the endline of file
    autocmd BufNewFile * normal G
endfunc

