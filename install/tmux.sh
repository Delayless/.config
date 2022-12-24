#!/bin/bash

GITPROXY="https://ghproxy.com/"
sudo pacman -S tmux --noconfirm

[ ! -f ~/.tmux.conf ] &&   ln -sf ~/.config/.tmux.conf ~/.tmux.conf || echo '.tmux.conf already exists'
git clone ${GITPROXY}https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone ${GITPROXY}https://github.com/creaktive/rainbarf ~/.tmux/plugins/rainbarf
sudo pacman -S perl perl-module-build --noconfirm
cd ~/.tmux/plugins/rainbarf
perl Build.PL
sudo ./Build install

# Display song title on tmux status bar using listen1
~/.config/tmux/tmux-powerline/generate_rc.sh
mv ~/.tmux-powerlinerc.default ~/.tmux-powerlinerc
sed -i -r 's#TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER=".*"#TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER="file"#' ~/.tmux-powerlinerc
sed -i -r 's#TMUX_POWERLINE_SEG_NOW_PLAYING_FILE_NAME=".*"#TMUX_POWERLINE_SEG_NOW_PLAYING_FILE_NAME="/tmp/nowPlayingsong"#' ~/.tmux-powerlinerc
