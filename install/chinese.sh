# Chinese fonts
# adobe-source-han-mono-cn-fonts
# adobe-source-han-sans-cn-fonts
# adobe-source-han-serif-cn-fonts
# wqy-microhei
# wqy-zenhei
# wqy-bitmapfont
sudo pacman -S adobe-source-han-mono-cn-fonts --noconfirm

# fcitx
ln -sf ~/.config/.xprofile ~/

sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color --noconfirm
