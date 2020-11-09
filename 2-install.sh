#!/bin/sh

if [ "${HOSTNAME}" == "Manjaro" ]; then
    sudo pacman -S git --noconfirm
    sudo pacman -S git-annex --noconfirm
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
	# all the software of input method occupies 250MB of disk space.
    sudo pacman -S fcitx5-git --noconfirm
    # Chinese input support and lexicons.
    sudo pacman -S fcitx5-chinese-addons-git fcitx5-pinyin-zhwiki fcitx5-pinyin-moegirl --noconfirm
    # For obtain a better experience in gtk/qt4/qt5 programs
    sudo pacman -S fcitx5-gtk-git fcitx5-qt4-git fcitx5-qt5-git --noconfirm
    # fcitx theme
    sudo pacman -S fcitx5-material-color --noconfirm
    # GUI configuration tools, and For tranditional chinese
    sudo pacman -S fcitx5-configtool-git fcitx5-chewing --noconfirm
	sudo pacman -S pikaur --noconfirm
	sudo pacman -S i3 --noconfirm
    # auto-hide mouse cursor
    sudo pacman -S unclutter --noconfirm
	# sudo pacman -S dmenu --noconfirm
	sudo pacman -S rofi --noconfirm
	# Scrot is a minimalist command line screen capturing application.
	# sudo pacman -S scrot --noconfirm
	sudo pacman -S flameshot --noconfirm
	sudo pacman -S baidunetdisk-bin --noconfirm
	sudo pacman -S audacious --noconfirm
	sudo pacman -S netease-cloud-music --noconfirm
	sudo pacman -S google-chrome --noconfirm
	# w3m and ueberzug all are used to preview image.
	# sudo pacman -S w3m --noconfirm
	sudo pip3 install ueberzug
	sudo pip3 install pillow
	# sudo pacman -S nerd-fonts-complete --noconfirm
	# sudo pacman -S powerline-fonts --noconfirm
    sudo pacman -S nerd-fonts-fira-code ttf-inconsolata ttf-droid --noconfirm
    # not nerd-fonts-noto, it's too bloated.
    sudo pacman -S noto-fonts --noconfirm
    ## Emoji
    sudo pikaur -S noto-fonts-emoji ttf-joypixels ttf-twemoji ttf-twemoji-color ttf-symbola ttf-linux-libertine ttf-liberation
    ## Chinese
    sudo pikaur -S adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts wqy-microhei wqy-zenhei wqy-bitmapfont
	# sudo pacman -S nerd-fonts-dejavu-sans-mono --noconfirm
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
	# sudo pacman -S texlive-full --noconfirm
    sudo pikaur -S texlive-core texlive-bin texlive-langchinese  texlive-latexextra texlive-pictures --noconfirm
    # sudo pikaur -S texlive-fontsextra --noconfirm
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
	# sudo pacman -S simplescreenrecorder --noconfirm
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
	# notification daemon
	sudo pacman -S dunst --noconfirm
	# automount removable media. Included in the udisks2.
	sudo pacman -S udiskie --noconfirm
	#############################
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo pikaur -S ccat-git --noconfirm
    sudo pacman -S inkescape --noconfirm
    sudo pikaur -S mathpix-snipping-tool --noconfirm
    sudo pacman -S thefuck --noconfirm
    # Desktop annotation.
    sudo pikaur -S gromit-mpx --noconfirm
	# if install fzf using pacman, it's not be enabled by default key bindings in terminal.
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
    # sudo pacman -S ripgrep -no-confirm
    # fzf alt-c find directory
    sudo pacman -S fd -no-confirm
	curl -sL install-node.now.sh/lts | bash
	sudo pacman -S npm --noconfirm
	sudo npm install -g p3x-onenote --unsafe-perm=true --allow-root
	# p3x-onenote &
fi


