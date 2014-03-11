# screen powersave
xset +dpms
xset dpms 0 0 300

# read .Xresource
xrdb ~/.Xresources

# start openbox
exec openbox-session
#exec cinnamon-session
#exec gnome-session --session=gnome-classic