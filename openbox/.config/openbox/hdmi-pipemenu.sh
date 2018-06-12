#! /usr/bin/bash

devices=$(xrandr -q | grep [[:upper:]]1)

echo '<openbox_pipe_menu>'

if [[ $devices == *"HDMI1 connected"* ]] ; then

    echo '<item label="--&gt; HDMI">'
    echo '  <action name="Execute">'
    echo '    <command>sh -c "pactl set-card-profile 0 output:hdmi-stereo-extra1 ; xrandr --output HDMI1 --auto ; xrandr --output eDP1 --off"</command>'
    echo '  </action>'
    echo '</item>'

    echo '<item label="&lt;-- HDMI">'
    echo '  <action name="Execute">'
    echo '    <command>sh -c "pactl set-card-profile 0 output:analog-stereo+input:analog-stereo; xrandr --output eDP1 --auto; xrandr --output HDMI1 --off"</command>'
    echo '  </action>'
    echo '</item>'

elif [[ $devices == *"VGA1 connected"* ]] ; then

    echo -e '<item label="--&gt; VGA">'
    echo '  <action name="Execute">'
    echo '    <command>xrandr --output VGA1 --auto ; xrandr --output eDP1 --off</command>'
    echo '  </action>'
    echo '</item>'

    echo '<item label="Laptop + VGA">'
    echo '  <action name="Execute">'
    echo '    <command>xrandr --output eDP1 --auto ; xrandr --output VGA1 --auto</command>'
    echo '  </action>'
    echo '</item>'

else
    echo '<item label="No displays connected"></item>'
fi

echo '</openbox_pipe_menu>'
