sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release -y

sudo dnf in mangowm foot thunar waybar mako wlsunset swaybg wl-clipboard cliphist gtklock playerctl rofi wlogout blueman-manager pavucontrol nm-connection-editor xorg-x11-server-Xwayland xfce-polkit tar -y

sudo dnf in nwg-look xdg-user-dirs fish -y
xdg-user-dirs-update

#gedit engrampa firefox

cp -r /tmp/config/blueprints/fedora/mangowm-fedora/config/* ~/.config/
curl -Lso ~/.config/mango/wallpaper.png https://w.wallhaven.cc/full/xe/wallhaven-xe7ylv.png

curl -sS https://starship.rs/install.sh | sh -s -- -y
chsh -s /usr/bin/fish
echo "set -g fish_greeting" >> ~/.config/fish/config.fish
echo "starship init fish | source" >> ~/.config/fish/config.fish

mango