#/bin/bash

git clone https://github.com/Delayless/picom /tmp/picom
cd /tmp/picom
git submodule update --init --recursive

sudo pacman -S ninja meson cmake libev uthash libconfig --noconfirm

rm -rf build
# LDFLAGS="-L/usr/local/lib" CPPFLAGS="-I/usr/local/include" meson --buildtype=release . build
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
