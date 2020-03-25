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

#### test code block
```python
import url

def a():
	b=4
	print("%s"%b)
	return 0

if __name__ == "__main__":
	a()
```

<LEADER> is <Space>
| Shortcut           | Action                                             |
|--------------------|----------------------------------------------------|
| F5                 | Compile sourcefile                                 |
| F8                 | Regenerate the tag file                            |
| F12                | MarkdownPreview                                    |
| Y                  | Copy to system clipboard by 'xclip' in visual mode |
| <LEADER>sp         | Spell check swith                                  |
| Ctrl+j             | Scroll a half page down                            |
| Ctrl+k             | Scroll a half page up                              |
| <LEADER>S          | Save file as root after editing as non-root        |
| <LEADER><Enter>    | Set nohightlight                                   |
| U                  | Undo                                               |
| <F10> or <LEADER>p | Greater Indent format for copying from Internet    |
| Ctrl+a             | add 1                                              |
| Ctrl+x             | subtract 1                                         |







