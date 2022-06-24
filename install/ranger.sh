#!/bin/bash
# ranger_devicons Prerequisites https://github.com/ryanoasis/nerd-fonts
# https://github.com/alexanderjeurissen/ranger_devicons
sudo pacman -S ranger --noconfirm

# all of w3m and ueberzug are used to preview image.
# sudo pacman -S w3m --noconfirm
# pip install ueberzug
sudo pacman -S ueberzug --noconfirm

# open Gif
sudo pacman -S mpv --noconfirm

# preview video
sudo pacman -S ffmpegthumbnailer --noconfirm

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
pip3 install xlsx2csv --noconfirm
# Drag and drop
yay -S dragon-drop --noconfirm
