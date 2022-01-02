#!/bin/bash

mkdir -p ~/Projects/Delayless/
git clone https://github.com/Delayless/dwm ~/Projects/Delayless/
cd ~/Projects/Delayless/dwm/
sudo pacman -S xorg-server libxft libxinerama --noconfirm
sudo make install
# for dwm-status-refresh.sh
sudo pacman -S bc xorg-xsetroot pulseaudio acpi --noconfirm

# it's necessary for lodging by lightdm
[ ! -f /usr/share/xsessions/dwm.desktop ] && sudo ln -s ~/.config/dwm.desktop /usr/share/xsessions/dwm.desktop
# it's necessary for lodging by startx
[ -f /etc/X11/xinit/xinitrc ] && mv /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak.$(date +"%Y%m%d_%H%M%S")
sudo ln -s ~/.config/.xinitrc /etc/X11/xinit/xinitrc

sudo pacman -S ttf-fira-code nerd-fonts-fira-code --noconfirm
sudo pacman -S rofi xtrlock keynav dmenu feh dunst --noconfirm
# control some settings
sudo pacman -S xorg-xinput xorg-setxkbmap libpulse brightnessctl --noconfirm

git clone https://github.com/Delayless/scripts ~/Projects/Delayless/

# Chinese fonts
# adobe-source-han-mono-cn-fonts
# adobe-source-han-sans-cn-fonts
# adobe-source-han-serif-cn-fonts
# wqy-microhei
# wqy-zenhei
# wqy-bitmapfont
sudo pacman -S adobe-source-han-mono-cn-fonts --noconfirm

echo "Install DWM successfully."
echo "Enjoy it!!!"
