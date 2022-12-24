#!/bin/bash

GITPROXY="https://ghproxy.com/"
mkdir -p ~/Projects/Delayless/
git clone ${GITPROXY}https://github.com/Delayless/dwm ~/Projects/Delayless/
cd ~/Projects/Delayless/dwm/
# sudo pacman -S xorg --noconfirm
# Or just install the necessary softwares
sudo pacman -S xorg-server libxft libxinerama --noconfirm
sudo make install
# for dwm-status-refresh.sh
sudo pacman -S bc xorg-xsetroot pulseaudio acpi   --noconfirm
# solve icons display abnormally(e.g, udiskie, joplin)
sudo pacman -S adwaita-icon-theme libappindicator-gtk3 --noconfirm
# it's necessary for login-in by startx
[ -f /etc/X11/xinit/xinitrc ] && sudo mv /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak.$(date +"%Y%m%d_%H%M%S")
sudo ln -s ~/.config/.xinitrc /etc/X11/xinit/xinitrc

sudo pacman -S ttf-fira-code nerd-fonts-fira-code --noconfirm
sudo pacman -S rofi xtrlock keynav dmenu feh dunst flameshot --noconfirm
# control some settings
sudo pacman -S xorg-xinput xorg-setxkbmap libpulse brightnessctl --noconfirm

git clone ${GITPROXY}https://github.com/Delayless/scripts ~/Projects/Delayless/
ln -s ~/Projects/Delayless/scripts ~/.local/share/

sudo pacman -S neofetch --noconfirm
sudo pacman -S feh --noconfirm
yay -S acpitool --noconfirm

echo "Install DWM successfully."
echo "Enjoy it!!!"
