# fonts
xset +fp /usr/share/fonts/envypn
xset +fp ~/.fonts/tamsyn
xset fp rehash

# screen powersave
xset +dpms
xset dpms 0 0 300

# read .Xresource
xrdb ~/.Xresources

# start openbox
exec openbox-session
#exec "$HOME/wmrun.sh"
