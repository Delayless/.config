#!/bin/sh
# refer to the link [Check the file exists or not in bash](https://www.php.cn/linux-416452.html)

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

#dir="$HOME/.config"
# $dir to reference
cd ~/.config
[ ! -f ~/.vimrc ] && ln -s ~/.config/.vimrc ~/.vimrc || echo '.vimrc already exists'
[ ! -f ~/.xmodmap ] && ln -s ~/.config/.xmodmap ~/.xmodmap || echo '.xmodmap already exists'
[ ! -f ~/.zshrc ] && ln -s ~/.config/.zshrc ~/.zshrc || echo '.zshrc already exists'

#if [ -f ~/.zshrc ]; then
#	echo '.zshrc already exists'
#else
#	ln -s ~/.config/.zshrc ~/.zshrc 
#fi

## '!' means if not exist. Also the format can like above.

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
sudo cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "export GTK_IM_MODULE=fcitx" >> ~/.xinitrc
echo "export QT_IM_MODULE=fcitx" >> ~/.xinitrc
echo "export XMODIFIERS=\"@im=fcitx\"" >> ~/.xinitrc

echo "Configue Complete! Restart to take effect."
