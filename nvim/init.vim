set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" source ~/.config/nvim/latex_fenced_language.vim
" Disable automatic comment insertion(new line automatic add ").
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Display translation in a window
let g:translator_target_lang = 'zh'
" 'youdao' will slow down the response speed.
let g:translator_default_engines = ['google', 'bing', 'baicizhan', 'haici']
" let g:translator_window_borderchars = v:null
let g:translator_history_enable = v:true
" Echo translation in the cmdline
" nmap <silent> <Leader>w <Plug>Translate
" vmap <silent> <Leader>w <Plug>TranslateV
" Display translation in a window
" type <Leader>w again to jump into it and again to jump back
nmap <silent> <Leader>tl <Plug>TranslateW
vmap <silent> <Leader>tl <Plug>TranslateWV
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX


" press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
