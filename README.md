.vimrc is created by hard link
ln ~/.vimrc ~/.config/.vimrc

============================================================
Add a Google Chrome plugin: vimium(Control Chrome using vim's hotkey)

map K scrollPageUp
map J scrollPageDown
map <C-j> scrollFullPageDown
map <C-k> scrollFullPageUp
map dd removeTab
map <C-r> restoreTab
map u goBack
map U goForward
" Open a Link in current tab using a new tab
map F LinkHints.activateModeToOpenInNewTab
map H previousTab
map L nextTab
===========================================================
"b-bold, s-sliced, i-italic, `-block, c-big block code, t-todo, p-picture, a-link, l-line, f-forward
f <Esc>/<++><CR>:nohlsearch<CR>c4l
w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>,,,, ,,,  
n ---<Enter><Enter>
b **** <++>
s ~~~~ <++>
i ** <++>
` `` <++>
c ``````
t - [ ] <Enter>
p ![](<++>) <++>
a [](<++>) <++>
1 #
2 ##
3 ###
4 ####
l --------<Enter>
```python
import url

def a():
	b=4
	print("%s"%b)
	return 0
a()
```
| jflakja   | jafdkf    |
|-----------|-----------|
| j autocmd | jfdklafjd |
|-----------|-----------|

""
