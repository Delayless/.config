set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" source ~/.config/nvim/latex_fenced_language.vim
" Disable automatic comment insertion(new line automatic add ").
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Display translation in a window
let g:translator_target_lang = 'zh'
" 'youdao' will slow down the response speed.
let g:translator_default_engines = ['bing', 'google', 'haici', 'youdao']
" let g:translator_window_borderchars = v:null
let g:translator_history_enable = v:true
" Echo translation in the cmdline
" nmap <silent> <Leader>w <Plug>Translate
" vmap <silent> <Leader>w <Plug>TranslateV
" Display translation in a window
" type <Leader>w again to jump into it and again to jump back
nmap <silent> <Leader>tl :TranslateW --engines=bing<CR>
vmap <silent> <Leader>tl :TranslateW --engines=google<CR>
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX

" ===
" === nvim-bufferline.lua
" ===
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
" nnoremap <silent>[b :BufferLineCyclePrev<CR>
" nnoremap <silent>]b :BufferLineCycleNext<CR>
" nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <silent>th :BufferLineCyclePrev<CR>
nnoremap <silent>tl :BufferLineCycleNext<CR>
nnoremap <silent>t1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent>t2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent>t3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent>t4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent>t5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent>t6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent>t7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent>t8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent>t9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent> tp :BufferLinePick<CR>
nnoremap <silent> tc :BufferLinePickClose<CR>

" ===
" === telescope.nvim
" ===
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
