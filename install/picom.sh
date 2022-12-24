#/bin/bash

git clone https://github.com/Delayless/picom /tmp/picom
cd /tmp/picom
git submodule update --init --recursive
git checkout implement-window-animations

sudo pacman -S ninja meson cmake libev uthash libconfig --noconfirm

rm -rf build
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
