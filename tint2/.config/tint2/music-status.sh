#/usr/bin/bash

status=$(playerctl status 2>/dev/null)

if [[ $? != 0 ]] ; then
    echo ""

else

    if [[ "$status" == "Playing" ]]; then
        { echo "$(playerctl metadata title | awk -v len=25 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }' | tr -d '&' | awk '{print "  " $0 " |"}')"; echo "<b>$(playerctl metadata artist)</b>"; } | tr "\n" " "

    elif [[ "$status" == "Paused" ]] ; then
        { echo "$(playerctl metadata title | awk -v len=25 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }' | tr -d '&' | awk '{print "  " $0 " |"}')"; echo "<b>$(playerctl metadata artist)</b>"; } | tr "\n" " "
    fi
fi
