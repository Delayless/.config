#!/bin/bash

sudo pacman -S tmux --noconfirm
yay -S rainbarf --noconfirm

[ ! -f ~/.tmux.conf ] &&   ln -sf ~/.config/.tmux.conf ~/.tmux.conf || echo '.tmux.conf already exists'
yay -S rainbarf-git --noconfirm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# Display song title on tmux status bar using listen1
~/.config/tmux/tmux-powerline/generate_rc.sh
mv ~/.tmux-powerlinerc.default ~/.tmux-powerlinerc
sed -i -r 's#TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER=".*"#TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER="file"#' ~/.tmux-powerlinerc
sed -i -r 's#TMUX_POWERLINE_SEG_NOW_PLAYING_FILE_NAME=".*"#TMUX_POWERLINE_SEG_NOW_PLAYING_FILE_NAME="/tmp/nowPlayingsong"#' ~/.tmux-powerlinerc
