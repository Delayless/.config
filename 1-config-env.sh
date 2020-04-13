#!/bin/sh
# refer to the link [Check the file exists or not in bash](https://www.php.cn/linux-416452.html)

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

#dir="$HOME/.config"
# $dir to reference
## '!' means if not exist.
cd ~/.config
[ ! -f ~/.vimrc ] &&   ln -sf ~/.config/.vimrc ~/.vimrc || echo '.vimrc already exists'
[ ! -f ~/.Xmodmap ] && ln -sf ~/.config/.Xmodmap ~/.Xmodmap || echo '.Xmodmap already exists'
[ ! -f ~/.zshrc ] &&   ln -sf ~/.config/.zshrc ~/.zshrc || echo '.zshrc already exists'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

sudo pacman-mirrors -i -c China -m rank
sudo echo "[archlinuxcn]" >> /etc/pacman.conf
sudo echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
sudo pacman -Sy archlinuxcn-keyring --noconfirm
# update the list of mirrors source
sudo pacman-mirrors -g
sudo pacman -Syyu

echo "Configue Complete! Restart to take effect."
