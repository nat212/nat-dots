#!/usr/bin/fish

# Setup rofi
mkdir -p ~/.config/rofi
ln -sf ~/nat-dots/rofi ~/.config/rofi/config

# Setup kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
mkdir -p ~/.config/kitty
ln -sf ~/nat-dots/kitty.conf ~/.config/kitty/kitty.conf

# Setup polybar
rm -rf ~/.config/polybar
ln -s ~/nat-dots/polybar ~/.config/polybar
ln -s main.ini ~/.config/polybar/config

# Setup fonts
mkdir -p ~/.local/share/fonts
ln -s ~/nat-dots/fonts ~/.local/share/fonts/nat-dots
fc-cache -fv

# Setup scripts...
mkdir -p ~/.local/bin/
ln -s ~/nat-dots/scripts/patch-font ~/.local/bin/
ln -s ~/nat-dots/scripts/exit ~/.local/bin/wm-exit

# Setup dunst
mkdir -p ~/.config/dunst
ln -sf ~/nat-dots/dunstrc ~/.config/dunst/dunstrc

# Setup picom
mkdir -p ~/.config/picom
ln -sf ~/nat-dots/picom.conf ~/.config/picom/picom.conf

# Setup desktop files
mkdir -p ~/.local/share/applications
ln -sf ~/nat-dots/desktops/browser-select.desktop ~/.local/share/applications/
