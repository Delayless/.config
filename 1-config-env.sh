#!/bin/sh
# refer to the link [Check the file exists or not in bash](https://www.php.cn/linux-416452.html)

[ ! -f ~/.Xmodmap ] && ln -sf ~/.config/.Xmodmap ~/.Xmodmap || echo '.Xmodmap already exists'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

sudo pacman-mirrors -i -c China -m rank
echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf
echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Sy archlinuxcn-keyring --noconfirm
# update the list of mirrors source
sudo pacman-mirrors -g
sudo pacman -Syyu

# wget -O /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/all/
wget -O /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/?country=CN

echo "Configue Complete! Restart to take effect."
