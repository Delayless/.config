
<!-- TOC GFM -->

+ [Download the Repository](#download-the-repository)
	* [config-env](#config-env)
	* [Install Software](#install-software)
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
## config-env
`sudo ./config-env.sh`
1. Checking the shell is zsh or no.
2. map the Keyboard, Caps--->Ctrl, Swap the Left_Command and Left_Alt, Left_Crtl --->Esc, Right_Alt--->Command, Right_menu--->Alt.
3. Add the config for Chinese Input.
4. Creat the soft link about the vimrc and zshrc on /home.
5. Add Source about the Archlinuxcn of Tsinghua.
## Install Software
`sudo ./install.sh`

See [my-packages.txt](./my-packages.txt) for detail.

# Key Map
| Shortcut    | Action        |  |  | Shortcut | Action |
|-------------|---------------|--|--|----------|--------|

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
Every extensions should be installed by CocInstall.
- [Extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
`CocInstall coc-python coc-pyls coc-pairs coc-snippets coc-vimlsp coc-translator coc-html coc-json coc-css coc-tsserver coc-tailwindcss coc-stylelint coc-yank coc-lists coc-gitignore coc-highlight coc-cmake coc-clangd coc-explorer`
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
