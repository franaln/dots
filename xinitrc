# screen powersave
xset +dpms
xset dpms 0 0 900

# read .Xresource
xrdb ~/.Xresources

# start wm
exec openbox-session
