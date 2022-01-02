#!/bin/bash

sudo pacman -S git curl wget --noconfirm

CONFIG_DIR=$HOME/.config
CONFIG_URL=https://github.com/Delayless/.config
if [ ! -d $CONFIG_DIR ]; then
	git clone $CONFIG_URL $CONFIG_DIR
else
	cd $CONFIG_DIR
	git init
	git remote add origin $CONFIG_URL
	git fetch
	git checkout -t origin/master
	git checkout dev
fi

sh -c $CONFIG_DIR/install/dwm.sh
sh -c $CONFIG_DIR/install/st.sh
sh -c $CONFIG_DIR/install/zsh.sh
sh -c $CONFIG_DIR/install/vim.sh
sh -c $CONFIG_DIR/install/chinese.sh
sh -c $CONFIG_DIR/install/tmux.sh
