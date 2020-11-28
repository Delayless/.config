<!-- TOC GFM -->

+ [Download the Repository](#download-the-repository)
+ [config](#config)
	* [config environment](#config-environment)
	* [Install Software](#install-software)
+ [Keyboard layout](#keyboard-layout)
+ [zsh & ohmyzsh](#zsh--ohmyzsh)
+ [vim](#vim)
	* [Install](#install)
	* [ctags](#ctags)
	* [coc](#coc)
	* [keymap](#keymap)
	* [markdown preview](#markdown-preview)
+ [zathura](#zathura)
+ [ranger](#ranger)
	* [Requirements](#requirements)
+ [joplin CLI](#joplin-cli)
+ [Goldendict](#goldendict)
+ [vimium(Chrome plugin)](#vimiumchrome-plugin)
+ [PS](#ps)

<!-- /TOC -->
> Some plugs only work on vim >= 8.1 or neovim. e.g, markdown-preview, vim-deus, coc

# Download the Repository
1. Download my dotfiles by `git clone https://github.com/Delayless/.config`
2. copy config file by `cp -rf ./.config/* ~/.config/`, and open the directory `cd ~/.config`

# config
## config environment
`sudo ./config-env.sh` for:
1. Checking the shell is zsh or no.
2. map the Keyboard, Caps--->Ctrl, Swap the Left_Command and Left_Alt, Left_Crtl --->Esc, Right_Alt--->Command, Right_menu--->Alt.
3. Add the config for Chinese Input.
4. Creat the soft link about the vimrc and zshrc on home directory.
5. Add Source about the Archlinuxcn of Tsinghua.

## Install Software
`sudo ./install.sh`
See [my-packages.txt](./my-packages.txt) for detail.


# Keyboard layout
`setxkbmap us -variant colemak` set colemak keyboard layout or modify xmodmap.
`xmodmap -pke` print keycodes.
'xev': press key to print its keycode. some distro linux need to install `xorg-xev`.

PS: Command `xdotool key Caps_Lock` to toggle Caps_Lock status.


# zsh & ohmyzsh
```
sudo pacman -S zsh
chsh -s /usr/bin/zsh
# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s ~/.config/.zshrc ~/
```

# vim
## Install
1. neovim(recommend)
```
sudo pacman -S neovim
# `:checkhealth`
# python client to neovim.
pip3 install pynvim
# Transition package for pynvim
pip3 install neovim
# vimtex-faq-neovim
pip3 install neovim-remote
# nodejs
sudo npm install -g neovim
# For python2
python2 -m pip install neovim
python2 -m pip install pynvim
```

2. vim
- python3 for vim, ultisnips needs vim to support vim-python3,
```bash
	git clone https://github.com/vim/vim
	cd vim/src
	./configure  --enable-python3interp=yes
	make
	sudo make install
	# vim --version, to check `+python3` or not
```

## ctags
vista.vim is to support LSP(Language Server Protocol) symbols.
Exuberant Ctags is unsupported, ensure you are using universal-ctags.
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

## coc
`curl -sL install-node.now.sh/lts | bash` for installing nodejs but not using pacman/apt. I'm not sure about this.
`:call coc#util#install()` to install coc-util
- [Extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
coc-clangd:The extension does not install clangd for you! You must install clangd separately. `sudo apt install clang`, version >=7.0

coc-snippets configuration:
- [Example](https://github.com/neoclide/coc-snippets/tree/master/tests/snippets)
`:CocCommand snippets.editSnippets`

## keymap
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

## markdown preview
> Modified from `theniceboy/nvim`
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


# zathura
Ctrl+n: Toggle statusbar(title, page number)

# ranger
## Requirements
Picture Preview: ueberzug
Video Preview: ffmpegthumbnailer
Gif: mpv

# joplin CLI
> An open source Cross-platform note taking and to-do application. It supports Linux, MacOS, Windows, iPhone, iPad, Android.
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

**synchronize joplin cli with joplin desktop**
```
mv ~/.config/joplin ~/.config/joplin-terminal-bak
ln -sfn ~/.config/joplin-desktop ~/.config/joplin
```
If the report is wrong:
> Fatal error:
>
> Unknown profile version. Most likely this is an old version of Joplin, while the profile was created by a newer version. Please upgrade Joplin at https://joplinapp.org and try again.
```
sqlite3 \
"~/.config/joplin-desktop/database.sqlite" \
"UPDATE version SET version = 23;"
```

# Goldendict
> Audio player
> WARN: FFmpeg audio Player ao_open_live() failed: can not open the device alsa channel 1, rate 11025, bit 8
Edit -- Preferences -- Audio -- Use external program:
`cvlc  --play-and-stop -Vdummy`

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
