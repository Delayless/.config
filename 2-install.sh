#!/bin/sh

if [ "${HOSTNAME}" == "Manjaro" ]; then
	sudo pacman -S openssl --noconfirm
	sudo pacman -S make --noconfirm
	sudo pacman -S cmake --noconfirm
	sudo pacman -S tree --noconfirm
	# sudo pacman -S gvim --noconfirm
	sudo pacman -S xclip --noconfirm
	sudo pacman -S clang --noconfirm
	sudo pacman -S ccls --noconfirm
	# joplin-desktop, directory: ~/.joplin-bin
	wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
	sudo pacman -S joplin --noconfirm
	sudo pacman -S the_silver_searcher --noconfirm
	sudo pacman -S vlc --noconfirm
	sudo pacman -S alacritty --noconfirm
	sudo pacman -S brightnessctl --noconfirm
	sudo pacman -S fcitx fcitx-im fcitx-configtool fcitx-googlepinyin --noconfirm
	sudo pacman -S pikaur --noconfirm
	sudo pacman -S i3 --noconfirm
	sudo pacman -S dmenu --noconfirm
	sudo pacman -S rofi --noconfirm
	sudo pacman -S powerline-fonts --noconfirm
	# Scrot is a minimalist command line screen capturing application.
	sudo pacman -S scrot --noconfirm
	sudo pacman -S baidunetdisk-bin --noconfirm
	sudo pacman -S audacious --noconfirm
	sudo pacman -S netease-cloud-music --noconfirm
	sudo pacman -S google-chrome --noconfirm
	sudo pacman -S w3m --noconfirm
	sudo pacman -S nerd-fonts-complete --noconfirm
	# ranger_devicons Prerequisites https://github.com/ryanoasis/nerd-fonts
	sudo pacman -S ranger --noconfirm
	# preview json file with color in ranger
	sudo pacman -S jq --noconfirm
	# Dependency for Archive Compression/Extraction in ranger
	sudo pacman -S atool --noconfirm
    sudo pacman -S mediainfo --noconfirm
    sudo pacman -S perl-image-exiftool --noconfirm
    sudo pacman -S catdoc --noconfirm
    # preview xlsx in ranger
    sudo pip3 install xlsx2csv
    # Offline Documentation Browser
    sudo pacman -S zeal --noconfirm
	sudo pacman -S pandoc --noconfirm
	sudo pacman -S texlive-core --noconfirm
	sudo pacman -S feh --noconfirm
	sudo pacman -S code --noconfirm
	sudo pacman -S kicad --noconfirm
	sudo pacman -S goldendict --noconfirm
	# google translate for goldendict
	pip3 install google-translate-for-goldendict
	# GoldenDict - Edit - Dictionary - Program
	# type: html, command: `python -m googletranslate.googletranslate zh-CN %GDWORD%`
	sudo pacman -S axel --noconfirm
	sudo pacman -S virtualbox --noconfirm
	# Video Editor
	sudo pacman -S kdenlive --noconfirm
	# Screen recording and streaming
	sudo pacman -S obs-studio --noconfirm
	# gif recording
	sudo pacman -S simplescreenkey --noconfirm
	sudo pacman -S screenkey --noconfirm
	sudo pacman -S lazygit --noconfirm
	sudo pacman -S vim-plug --noconfirm
	sudo pacman -S vim-spell-en --noconfirm
	# pdf viewer using vim shortcuts.
	sudo pacman -S zathura --noconfirm
	sudo pacman -S zathura-pdf-mupdf --noconfirm
	sudo pacman -S zathura-djvu --noconfirm
	sudo pacman -S bash-language-server --noconfirm
	##############compton###############
	# sudo pacman -S libx11 libxcomposite libxdamage libxfixes libxext libxrender libxrandr libxinerama ruby-pkg-config xorg-xwininfo libconfig libdrm libdbusmenu-glib asciidoc --noconfirm
	# sudo pacman -S nvidia-utils --noconfirm
	sudo pacman -S picom --noconfirm
	#############################
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo pikaur -S ccat-git
    sudo pacman -S thefuck --noconfirm
	# if install fzf using pacman, it's not be enabled by default key bindings in terminal.
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
    # fzf alt-c find directory
    sudo pacman -S fd -no-confirm
	sudo pacman -S npm --noconfirm
	sudo npm install -g p3x-onenote --unsafe-perm=true --allow-root
	# p3x-onenote &
fi


