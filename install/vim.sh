#!/bin/bash

[ ! -f ~/.vimrc ] &&   ln -sf ~/.config/.vimrc ~/.vimrc || echo '.vimrc already exists'
sudo pacman -S neovim python3 python-pip --noconfirm
. ../nvim/install-fix-neovim.sh

# {{{ vim-plug
[ ! -f ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && vim -c "PlugInstall --sync"
# }}}

# Install nodejs for coc.nvim
# bash-language-server will autoinstall nodejs
curl -sL https://install-node.vercel.app/lts | sudo bash
sudo pacman -S bash-language-server ccls --noconfirm

# vista.vim
sudo pacman -S ctags --noconfirm

# mkdx
sudo pacman -S xdg-utils --noconfirm

# For coc.nvim dictionary completion
sudo pacman -S words --noconfirm

# For fzf.vim search code(<Bslash>s)
sudo pacman -S ripgrep --noconfirm

# Autocomplete English words
sudo pacman -S words --noconfirm
