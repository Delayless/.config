#!/bin/sh

if [ "${HOSTNAME}" == "Manjaro" ]; then
	sudo pacman -S openssl --noconfirm
	sudo pacman -S make --noconfirm
	sudo pacman -S cmake --noconfirm
	sudo pacman -S tree --noconfirm
	sudo pacman -S vim --noconfirm
	sudo pacman -S vlc --noconfirm
	sudo pacman -S xclip --noconfirm
	sudo pacman -S alacritty --noconfirm
	sudo pacman -S fcitx fcitx-im fcitx-configtool fcitx-googlepinyin --noconfirm
	sudo pacman -S pikaur --noconfirm
	sudo pacman -S i3 --noconfirm
	sudo pacman -S dmenu --noconfirm
	sudo pacman -S powerline-fonts --noconfirm
	sudo pacman -S scrot --noconfirm
	sudo pacman -S netease-cloud-music --noconfirm
	sudo pacman -S google-chrome --noconfirm
	sudo pacman -S w3m --noconfirm
	sudo pacman -S nerd-fonts-complete --noconfirm
	# ranger_devicons Prerequisites https://github.com/ryanoasis/nerd-fonts
	sudo pacman -S ranger --noconfirm
	sudo pacman -S feh --noconfirm
	sudo pacman -S code --noconfirm
	sudo pacman -S goldendict --noconfirm
	sudo pacman -S axel --noconfirm
	sudo pacman -S vim-plug --noconfirm
	sudo pacman -S vim-spell-en --noconfirm
	##############compton###############
	sudo pacman -S libx11 libxcomposite libxdamage libxfixes libxext libxrender libxrandr libxinerama ruby-pkg-config xorg-xwininfo libconfig libdrm libdbusmenu-glib asciidoc --noconfirm
	mkdir -p ~/Desktop/tmp/
	cd ~/Desktop/tmp/
	git clone https://github.com/tryone144/compton.git
	cd compton
	sudo make
	sudo make docs
	sudo make install
	cd .. && rm -rf compton && cd ~/
	#############################
	sudo pacman -S ctags --noconfirm
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	pacaur -S ccat
	pacaur -S ccat-git
fi
