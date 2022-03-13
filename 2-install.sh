#!/bin/sh

if [ "${HOSTNAME}" == "Manjaro" ]; then
	sudo pacman -S curl wget --noconfirm
    sudo pacman -S git --noconfirm
    sudo pacman -S git-annex --noconfirm
	sudo pacman -S openssl --noconfirm
	sudo pacman -S make --noconfirm
	sudo pacman -S cmake --noconfirm
	sudo pacman -S tree --noconfirm
	# sudo pacman -S gvim --noconfirm
	sudo pacman -S xclip --noconfirm
	# clang included in ccls for coc-clangd
	sudo pacman -S ccls --noconfirm
	sudo pacman -S stow --noconfirm
	# nmtui, nmtui-connect
	# netctl, wpa_supplicant && dhcpcd/dhclient
	sudo pacman -S networkmanager --noconfirm
	sudo pacman -S acpi --noconfirm
	# universal-ctags for Debian/Ubuntu instead of ctags.
	sudo pacman -S ctags --noconfirm
	# joplin-desktop, directory: ~/.joplin-bin
	wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
	sudo pacman -S joplin --noconfirm
	sudo pacman -S xtrlock --noconfirm
	# same as above
	# sudo pacman -S slock --noconfirm
	sudo pacman -S the_silver_searcher --noconfirm
	sudo pacman -S vlc --noconfirm
	sudo pacman -S alacritty --noconfirm
	sudo pacman -S brightnessctl --noconfirm
	sudo pacman -S nfs-utils cifs-utils --noconfirm
	# just install fcitx5-im
	# fcitx5-im group provides fcitx5 ontology, #Configuration tool, and necessary #Input method module.
	sudo pacman -S fcitx5-im
	# all the software of input method occupies 250MB of disk space.
    sudo pacman -S fcitx5-git --noconfirm
    # Chinese input support and lexicons.
    sudo pacman -S fcitx5-chinese-addons --noconfirm
	# zhwiki dictionary for fcitx5-pinyin
	sudo pacman -S fcitx5-pinyin-zhwiki --noconfirm
    # For obtain a better experience in gtk/qt4/qt5 programs
    sudo pacman -S fcitx5-gtk-git fcitx5-qt4-git fcitx5-qt5-git --noconfirm
    # fcitx theme
    sudo pacman -S fcitx5-material-color --noconfirm
    # GUI configuration tools, and For tranditional chinese
    sudo pacman -S fcitx5-configtool-git fcitx5-chewing --noconfirm
	sudo pacman -S pikaur --noconfirm
	sudo pacman -S yay --noconfirm
	sudo pacman -S i3 --noconfirm
	sudo pacman -S tmux --noconfirm
	# display memory usage for tmux
	yay -S rainbarf --noconfirm
	# drive the mouse-driven envent by keyboard. mouse pointer mover
	# configuration file ln to home path
	sudo pacman -S keynav --noconfirm
	# create ap(wifi) for sharing network to phone, create_ap alternatively
	# sudo pacman -S linux-wifi-hotspot --noconfirm
	sudo pacman -S wireshark-qt --noconfirm
	# nice log file viewer. journalctl -u v2ray | lnav. lnav /path/to/log
	sudo pacman -S lnav --noconfirm
	# edit gigabit text file smoothly
	yay -S joe --noconfirm
	# docker monitor like top
	sudo pacman -S ctop --noconfirm
	sudo pacman -S kdeconnect --noconfirm
	# Display and control Android device
	sudo pacman -S scrcpy adb --noconfirm
    # auto-hide mouse cursor
    sudo pacman -S unclutter --noconfirm
	# dependency for urlhandler(copy/open url in st)
	# sudo pacman -S dmenu --noconfirm
	sudo pacman -S rofi --noconfirm
	# Scrot is a minimalist command line screen capturing application.
	# sudo pacman -S scrot --noconfirm
	sudo pacman -S flameshot --noconfirm
	# Clouddrive mounts cloud storage services as local file system.
	# https://hub.docker.com/r/cloudnas/clouddrive
	# `rclone` is a command line program to manage files on cloud storage.
	# rsync
	# sudo pacman -S rclone --noconfirm
	sudo pacman -S baidunetdisk-bin --noconfirm
	sudo pacman -S audacious --noconfirm
	sudo pacman -S netease-cloud-music --noconfirm
	sudo pacman -S google-chrome --noconfirm
	sudo pacman -S qutebrowser --noconfirm
	yay -S wechat-uos --noconfirm
	# Python image library.(OCR)
	pip3 install pillow
	# neovim debug python
	# pip3 install debugpy
	# sudo pacman -S nerd-fonts-complete --noconfirm
	# sudo pacman -S powerline-fonts --noconfirm
	sudo pacman -S ttf-fira-code --noconfirm
	# icons for dwm
    sudo pacman -S nerd-fonts-fira-code --noconfirm
	sudo pacman -S ttf-inconsolata ttf-droid --noconfirm
    # not nerd-fonts-noto, it's too bloated.
    sudo pacman -S noto-fonts --noconfirm
    ## Emoji
    yay -S noto-fonts-emoji ttf-joypixels ttf-twemoji ttf-twemoji-color ttf-symbola ttf-linux-libertine ttf-liberation
    ## Chinese
    sudo pacman -S adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts wqy-microhei wqy-zenhei wqy-bitmapfont --noconfirm
	# sudo pacman -S nerd-fonts-dejavu-sans-mono --noconfirm
	# ranger_devicons Prerequisites https://github.com/ryanoasis/nerd-fonts
	sudo pacman -S ranger --noconfirm
	# A better way to navigate directories
	sudo pacman -S broot --noconfirm
	# w3m and ueberzug all are used to preview image.
	# sudo pacman -S w3m --noconfirm
	sudo pacman -S  ueberzug --noconfirm
	# preview video
	sudo pacman -S ffmpegthumbnailer --noconfirm
	# Git preview
	sudo pacman -S mpv --noconfirm
	# many extension for scope, read ~/.config/ranger/scope.sh
	# preview json file with color in ranger
	sudo pacman -S jq --noconfirm
	# Dependency for Archive Compression/Extraction in ranger
	sudo pacman -S atool --noconfirm
	sudo pacman -S odt2txt --noconfirm
    sudo pacman -S mediainfo --noconfirm
    sudo pacman -S perl-image-exiftool --noconfirm
    sudo pacman -S catdoc --noconfirm
    # preview xlsx in ranger
    pip3 install xlsx2csv
    # Offline Documentation Browser
    sudo pacman -S zeal-git --noconfirm
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
	# trans
	sudo pacman -S translate-shell --noconfirm
	# GoldenDict - Edit - Dictionary - Program
	# type: html, command: `python -m googletranslate.googletranslate zh-CN %GDWORD%`
	sudo pacman -S axel --noconfirm
	# alternatively kvm, vmware-workstation
	sudo pacman -S virtualbox --noconfirm
	# Video Editor
	# sudo pacman -S shotcut --noconfirm
	sudo pacman -S kdenlive --noconfirm
	# Screen recording and streaming
	sudo pacman -S obs-studio --noconfirm
	# sudo pacman -S simplescreenrecorder --noconfirm
	# gif recording
	sudo pacman -S simplescreenkey --noconfirm
	sudo pacman -S peek --noconfirm
	sudo pacman -S screenkey --noconfirm
	sudo pacman -S lazygit --noconfirm
	sudo pacman -S neovim neovim-remote --noconfirm
	sudo pacman -S vim-spell-en --noconfirm
	# For dictionary completion
	sudo pacman -S words --noconfirm
	# RSS reader web client
	# yay -S yarr-git --noconfirm
	# RSS reader
	sudo pacman -S fluent-reader --noconfirm
	# pdf viewer using vim shortcuts.
	sudo pacman -S zathura --noconfirm
	# pdf reverse search
	# Maybe need to install libsynctex, neovim-remote
	# sudo pacman -S libsynctex
	sudo pacman -S xdotool --noconfirm
	# if this is not installed, zathura will not open the pdf file.
	sudo pacman -S zathura-pdf-mupdf --noconfirm
	sudo pacman -S zathura-djvu --noconfirm
	sudo pacman -S bash-language-server --noconfirm
	# autodetect connected screens/devices
	sudo pacman -S autorandr --noconfirm
	# laptop power saving settings
	sudo pacman -S tlp --noconfirm
	# glance like htop
	sudo pacman -S glances --noconfirm
	# btm system monitor like htop
	sudo pacman -S bottom --noconfirm
	# Caps2Esc, Press and hold the CapsLk map to Ctrl.
	# map CAPS to CTRL on hold and to ESC on quick press.
	# but have some issues about latency
	# 有些许延迟，不加进去了。
	# sudo pacman -S interception-tools interception-caps2esc --noconfirm
	# turns any device with a web browser into a secondary screen.
	yay -S deskreen --noconfirm
	##############compton###############
	# sudo pacman -S libx11 libxcomposite libxdamage libxfixes libxext libxrender libxrandr libxinerama ruby-pkg-config xorg-xwininfo libconfig libdrm libdbusmenu-glib asciidoc --noconfirm
	# sudo pacman -S nvidia-utils --noconfirm
	sudo pacman -S picom --noconfirm
	# notification daemon
	sudo pacman -S dunst --noconfirm
	# automount removable media. Included in the udisks2.
	sudo pacman -S udiskie --noconfirm
	# files/directories diff/compare
	sudo pacman -S meld --noconfirm
	#############################
	sudo pacman -S zsh --noconfirm
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	yay -S ccat-git --noconfirm
	sudo pacman -S bat --noconfirm
	# Drawing Figures
    sudo pacman -S inkescape --noconfirm
	# Flowchart Maker
	yay -S drawio --noconfirm
    sudo pikaur -S mathpix-snipping-tool --noconfirm
    sudo pacman -S thefuck --noconfirm
	sudo pacman -S tldr --noconfirm
	# manual cppman std::string
	yay -S cppman --noconfirm
    # Desktop annotation.
    yay -S gromit-mpx --noconfirm
	yay -S v2raya --noconfirm
	# research tool for cite
	sudo pacman -S zotero --noconfirm
	sudo pacman -S neofetch --noconfirm
	# system information
	suod pacman -S inxi --noconfirm
	# The break time reminder app
	yay -S stretchly --noconfirm
	# if install fzf using pacman, it's not be enabled by default key bindings in terminal.
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
    # sudo pacman -S ripgrep -no-confirm
    # fzf alt-c find directory
    sudo pacman -S fd -no-confirm
	# updatedb then locate filename to find file.
	sudo pacman -S mlocate --no-confirm
	curl -sL https://install-node.vercel.app/lts | sudo bash
	sudo pacman -S npm --noconfirm
	sudo npm install -g p3x-onenote --unsafe-perm=true --allow-root
	# p3x-onenote &
	# sudo pacman -S bc alsa-utils alsa-lib --noconfirm
fi


