
<!-- TOC GFM -->

+ [Download the Repository](#download-the-repository)
+ [config](#config)
	* [config environment](#config-environment)
	* [config joplin CLI](#config-joplin-cli)
	* [Install Software](#install-software)
		- [python3 for vim](#python3-for-vim)
		- [Goldendict](#goldendict)
+ [Key Map](#key-map)
+ [vim-plug](#vim-plug)
	* [markdown-preview](#markdown-preview)
+ [vimium(Chrome plugin)](#vimiumchrome-plugin)
+ [ctag](#ctag)
+ [coc](#coc)
	* [test code block](#test-code-block)

<!-- /TOC -->

> Some plugs only work on vim >= 8.1 or neovim. e.g, markdown-preview, vim-deus, coc

# Download the Repository
1. Download my config file by `git clone https://github.com/Delayless/.config`
2. copy config file by`cp -rf ./.config/* ~/.config/`, and open the directory`cd ~/.config`

# config
## config environment
`sudo ./config-env.sh`
1. Checking the shell is zsh or no.
2. map the Keyboard, Caps--->Ctrl, Swap the Left_Command and Left_Alt, Left_Crtl --->Esc, Right_Alt--->Command, Right_menu--->Alt.
3. Add the config for Chinese Input.
4. Creat the soft link about the vimrc and zshrc on /home.
5. Add Source about the Archlinuxcn of Tsinghua.
## config joplin CLI
```
sudo pacman -S nodejs npm
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
sudo ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin
```
For Dropbox, type `:config sync.target 7`. Then type `sync` to login to the service and start the synchronisation process.

It is possible to also synchronise outside of the user interface by typing joplin sync from the terminal. This can be used to setup a cron script to synchronise at regular interval. For example, this would do it every 30 minutes:
```
*/30 * * * * /path/to/joplin sync
```

## Install Software
`sudo ./install.sh`
### python3 for vim
ultisnips needs vim to support vim-python3,
Compile Vim
```
git clone https://github.com/vim/vim
cd vim/src
./configure  --enable-python3interp=yes
make
sudo make install
# vim --version, to check `+python3` or not
```
See [my-packages.txt](./my-packages.txt) for detail.
### Goldendict
> Audio player
> WARN: FFmpeg audio Player ao_open_live() failed: can not open the device alsa channel 1, rate 11025, bit 8
Edit -- Preferences -- Audio -- Use external program:
`cvlc  --play-and-stop -Vdummy`


# Key Map
`setxkbmap us -variant colemak` set colemak keyboard layout or modify xmodmap.
`xmodmap -pke` print keycodes.
'xev': press key to print its keycode. some distro linux need to install `xorg-xev`.

<LEADER> is <Space>
| Shortcut | Action                     |   |   | Shortcut            | Action                                               |
| -------- | ------------------------   | - | - | ------------------- | ---------------------------------------------------- |
| F5       | Compile sourcefile         | - | - | <LEADER>S           | Save file as root after editing as non-root          |
| F8       | Regenerate the tag file    | - | - | <LEADER>sp          | Spell check swith                                    |
| F12      | MarkdownPreview            | - | - | <LEADER><Enter>     | Set nohightlight                                     |
| Ctrl+j   | Scroll a half page down    | - | - | <F10> or <LEADER>sp | Grdapeieater Indent format for copying from Internet |
| Ctrl+k   | Scroll a half page up      | - | - | Y or <C-c>          | Copy to system clipboard                             |
| Ctrl+a   | add 1                      | - | - | <C-v>               | paste from system clipboard                          |
| Ctrl+x   | subtract 1                 | - | - | U or <C-r>          | Undo                                                 |
| gf       | open the file under cursor | - | - |



PS: Command `xdotool key Caps_Lock` to toggle Caps_Lock status.

# vim-plug
Modified from`theniceboy/nvim`

## markdown-preview
> b-bold, s-sliced, i-italic, \`-block, c-big block code, t-todo(check mark), p-picture, a-link, l-link, f-forward

| Shortcut   | Output            |   |   | Shortcut   | Output     |
| ---------- | ----------------- | - | - | ---------- | ---------- |
| `,n`       | ---               |   |   | `,p`       | picture    |
| `,b`       | **Bold** text     |   |   | `,l`       | [link]()   |
| `,s`       | ~~sliced~~ text   |   |   | `,1`       | # H1       |
| `,i`       | *italic* text     |   |   | `,2`       | ## H2      |
| ,\`        | code slice        |   |   | `,3`       | ### H3     |
| `,c`       | block of code     |   |   | `,4`       | #### H4    |
| `,t`       | - [ ] Todo list   |   |   | `,a`       | --------   |

`,f` to go to the next `<++>` (placeholder)

`,w` to go to the next `<++>` (placeholder) and then press `Enter` for you


# vimium(Chrome plugin)
Add a Google Chrome plugin: vimium(Control Chrome using vim's hotkey)

| Shotcut         | Action                                 |
|-----------------|----------------------------------------|
| `h` `j` `k` `l` | Scroll Left/Down/Up/Right              |
| `gg` `G`        | Scroll to the top/bottom of the page   |
| `K`             | scrollPageUp                           |
| `J`             | scrollPageDown                         |
| `Ctrl+j`        | scrollFullPageDown                     |
| `Ctrl+k`        | scrollFullPageUp                       |
| `f`             | Open a link in the current tab         |
| `F`             | Open a link in a new tab               |
| `u`             | goBack                                 |
| `U`             | goForward                              |
| `H`             | previousTab                            |
| `L`             | nextTab                                |
| `gi`            | Focus the first text input on the page |
| `dd` or `x`     | removeTab                              |
| `Ctrl+r` or `X` | restoreTab                             |

Press 'v' enter visual mode, and use 'c' to enter caret mode from visual mode(press 'v' then 'c' from normal mode).
'v' and 'c' can be used to switch between visual and caret modes.

# ctag
```
# install libjansson first
sudo apt-get install libjansson-dev

# then compile and install universal-ctags.

# NOTE: Don't use `sudo apt install ctags`, which will install exuberant-ctags and it's not guaranteed to work with vista.vim.

git clone https://github.com/universal-ctags/ctags.git --depth=1
cd ctags
./autogen.sh
./configure
make
sudo make install
```

# coc
- [Extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
coc-clangd:The extension does not install clangd for you! You must install clangd separately.sudo apt install clang<Tab>, version >=7.0

coc-snippets configuration:
- [Example](https://github.com/neoclide/coc-snippets/tree/master/tests/snippets)
`:CocCommand snippets.editSnippets`


```
snippet main "main(int argc, char *argv[]){}" b
main(int argc, char *argv[]){$1};
endsnippet

snippet cl "class .. (class)"
class ${1:`!p snip.rv = snip.basename or "name"`}
{
public:
	${1/(\w+).*/$1/} (${2:arguments});
	virtual ~${1/(\w+).*/$1/} ();

private:
	${0:/* data */}
};
endsnippet
```
## test code block
```python
import url

def a():
	b=4
	print("%s"%b)
	return 0

if __name__ == "__main__":
	a()
```

