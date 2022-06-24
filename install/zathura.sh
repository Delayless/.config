#!/bin/bash

sudo pacman -S zathura --noconfirm
# pdf reverse search
# Maybe need to install libsynctex, neovim-remote
# sudo pacman -S libsynctex

sudo pacman -S xdotool --noconfirm
# if this is not installed, zathura will not open the pdf file.
sudo pacman -S zathura-pdf-mupdf --noconfirm
sudo pacman -S zathura-djvu --noconfirm
