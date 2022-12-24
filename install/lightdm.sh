#/bin/bash

sudo pacman -S lightdm lightdm-mini-greeter --noconfirm

[ ! -f /usr/share/xsessions/dwm.desktop ] && (sudo mkdir -p /usr/share/xsessions && sudo cp ~/.config/dwm.desktop /usr/share/xsessions/dwm.desktop)
export XDG_SEAT_PATH="/org/freedesktop/DisplayManager/Seat0"

sudo systemctl enable lightdm
sudo systemctl restart lightdm
