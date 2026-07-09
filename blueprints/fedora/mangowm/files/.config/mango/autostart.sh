#! /bin/bash

export XDG_CURRENT_DESKTOP=wlroots

# lock
gtklock -b ~/.config/mango/wallpaper.png -T 60 &

# theme
gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-Dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#gsettings set org.gnome.desktop.interface cursor-theme ''
#gsettings set org.gnome.desktop.interface icon-theme ''
#gsettings set org.gnome.desktop.interface font-name ''

# fast launch GTK/Qt apps
fc-cache -f &
gtk-update-icon-cache -q &

# night light
wlsunset -T 3501 -t 3500 &

# wallpaper
swaybg -i ~/.config/mango/wallpaper.png &

# bar
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css &

# notifications daemon
mako -c ~/.config/mango/mako/config &

# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# clipboard content manager
wl-paste --type text --watch cliphist store &

# polkit (auth)
if ! pgrep -x "xfce-polkit" >/dev/null; then
  /usr/libexec/xdg-desktop-portal & /usr/libexec/xdg-desktop-portal-gtk &
fi

# autostart apps
#ghostty -e nvim &
