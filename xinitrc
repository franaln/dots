# screen powersave
xset +dpms
xset dpms 0 0 300

# read .Xresource
xrdb ~/.Xresources

# start wm
exec openbox-session
#autostart.sh &
#exec compiz ccp
