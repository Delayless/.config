#!/bin/bash

GITPROXY="https://ghproxy.com/"
sudo pacman -S zsh --noconfirm
sudo pacman -S broot --noconfirm
broot --install
# sudo pacman -S libev glibc --noconfirm
# if install fzf using pacman, it's not be enabled by default key bindings in terminal.
git clone --depth 1 ${GITPROXY}https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sh -c "$(curl -fsSL ${GITPROXY}https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ ! -f ~/.zshrc ] &&   ln -sf ~/.config/.zshrc ~/.zshrc || (mv .zshrc .zshrc.pre.$(date +"%Y%m%d_%H%M%S"); ln -sf ~/.config/.zshrc ~/.zshrc; echo 'move .zshrc to .zshrc.pre, create a new softlink')

# source ~/.config/.zshrc
# If ZSH_CUSTOM is set, install to ZSH_CUSTOM, otherwise install to ~/.oh-my-zsh/custom/
# ${ZSH_CUSTOM:-$ZSH_ANOTHER}
git clone ${GITPROXY}https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone ${GITPROXY}https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone ${GITPROXY}https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone ${GITPROXY}https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

# git submodule update --init --recursive
# git submodule foreach git checkout master
# git submodule foreach git pull origin master

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

# fd: fzf alt-c change directory
sudo pacman -S fd xclip --noconfirm
