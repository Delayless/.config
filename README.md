<!-- TOC GFM -->

+ [Download the Repository](#download-the-repository)
+ [config](#config)
	* [config environment](#config-environment)
	* [config joplin CLI](#config-joplin-cli)
	* [Install Software](#install-software)
		- [python3 for vim](#python3-for-vim)
		- [Goldendict](#goldendict)
+ [Key Map](#key-map)
+ [vim plug](#vim-plug)
	* [markdown preview](#markdown-preview)
+ [vimium(Chrome plugin)](#vimiumchrome-plugin)
+ [ctag](#ctag)
+ [coc](#coc)
	* [test code block](#test-code-block)
+ [zathura](#zathura)
+ [PS](#ps)

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
    ```bash
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
    ```bash
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
| Shortcut            | Action                                               |
| ------------------- | ---------------------------------------------------- |
| F5                  | Compile sourcefile                                   |
| F8                  | Regenerate the tag file                              |
| F12                 | MarkdownPreview                                      |
| Ctrl+j              | Scroll a half page down                              |
| Ctrl+k              | Scroll a half page up                                |
| Ctrl+a              | add 1                                                |
| Ctrl+x              | subtract 1                                           |
| gf                  | open the file under cursor                           |
| <LEADER>S           | Save file as root after editing as non-root          |
| <LEADER>sp          | Spell check swith                                    |
| <LEADER><Enter>     | Set nohightlight                                     |
| <F10> or <LEADER>sp | Grdapeieater Indent format for copying from Internet |
| Y or <C-c>          | Copy to system clipboard                             |
| <C-v>               | paste from system clipboard                          |
| U or <C-r>          | Undo                                                 |


PS: Command `xdotool key Caps_Lock` to toggle Caps_Lock status.

# vim plug
Modified from `theniceboy/nvim`

## markdown preview
> b-bold, s-sliced, i-italic, \`-block, c-big block code, t-todo(check mark), p-picture, a-link, l-link, f-forward

| Shortcut | Output            |
| -------- | ----------------- |
| `,n`     | ---               |
| `,b`     | **Bold** text     |
| `,s`     | ~~sliced~~ text   |
| `,i`     | *italic* text     |
| `,\`     | code slice        |
| `,c`     | block of code     |
| `,t`     | - [ ] Todo list   |
| `,p`     | picture           |
| `,l`     | [link]()          |
| `,1`     | # H1              |
| `,2`     | ## H2             |
| `,3`     | ### H3            |
| `,4`     | #### H4           |
| `,a`     | --------          |

`,f` to go to the next `<++>` (placeholder)
`,w` to go to the next `<++>` (placeholder) and then press `Enter` for you


# vimium(Chrome plugin)
Add a [Google](Google) Chrome plugin: vimium(Control Chrome using vim's hotkey)

| Shotcut         | Action                                         |
|-----------------|------------------------------------------------|
| `h` `j` `k` `l` | Scroll Left/Down/Up/Right                      |
| `gg` `G`        | Scroll to the top/bottom of the page           |
| `K`             | scrollPageUp                                   |
| `J`             | scrollPageDown                                 |
| `Ctrl+j`        | scrollFullPageDown                             |
| `Ctrl+k`        | scrollFullPageUp                               |
| `f`             | Open a link in the current tab                 |
| `F`             | Open a link in a new tab                       |
| `u`             | goBack                                         |
| `U`             | goForward                                      |
| `H`             | previousTab                                    |
| `L`             | nextTab                                        |
| `gi`            | Focus the first text input on the page         |
| `dd` or `x`     | removeTab                                      |
| `Ctrl+r` or `X` | restoreTab                                     |
| `o` or `O`      | open a link. Edit its URL by typing Ctrl+Enter |

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
`curl -sL install-node.now.sh/lts | bash` for installing nodejs but not using pacman/apt. I'm not sure about this.
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

# zathura
Ctrl+n: Toggle statusbar(title, page number)

# PS
1. dmenu font fullwidth
```bash
# Downgrade `ttf-inconsolata` to older version
sudo pacman -U https://archive.archlinux.org/packages/t/ttf-inconsolata/ttf-inconsolata-1%3A2.0.0.1-3-any.pkg.tar.xz
# Tell pacman to ignore auto-upgrading ttf-inconsolata in the future.
echo "IgnorePkg = ttf-inconsolata" >> /etc/pacman.conf
```
2.` ~/.config/mimeapps.list`: define default application for a filetype.
3. You can retrieve the key sequence for a key combination by pressing Ctrl+v followed by the key combination, e.g. Shift+Enter. these key sequence can be used to keymap by zsh, etc.(Different terminator has different key sequence. ctrl+enter, in st: `^M`. In alacritty: `[13;5u`.
