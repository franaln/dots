#! /usr/bin/env python

import re
import subprocess

def get_cmd_output(cmd_list):
    try:
        output = subprocess.check_output(cmd_list, stderr=subprocess.DEVNULL)
    except subprocess.CalledProcessError:
        return ''

    return output.decode('utf8').strip()

def check_devices():

    devices = []
    output = get_cmd_output(['xrandr', '-q'])
    for line in output.split('\n'):
        splitline = line.split()

        if not splitline[1] == 'connected':
            continue

        device = re.findall(r'^[a-zA-Z]+', splitline[0])[0]

        devices.append(device)

    return devices


devices = check_devices()


print('<openbox_pipe_menu>')

if len(devices) == 1 and devices[0] == 'eDP':
    print('<item label="No external displays connected"></item>')

elif 'HDMI' in devices:

    print( '<item label="HDMI (only video)">' )
    print( '  <action name="Execute">' )
    print( '    <command>sh -c "xrandr --output HDMI1 --auto ; xrandr --output eDP1 --off"</command>' )
    print( '  </action>' )
    print( '</item>' )

    print( '<item label="HDMI (video+audio)">' )
    print( '  <action name="Execute">' )
    print( '    <command>sh -c "pactl set-card-profile 0 output:hdmi-stereo-extra1 ; xrandr --output HDMI1 --auto ; xrandr --output eDP1 --off"</command>' )
    print( '  </action>' )
    print( '</item>' )

    print( '<item label="eDP + HDMI (HDMI above)">' )
    print( '  <action name="Execute">' )
    print( '    <command>sh -c "xrandr --output eDP1 --auto --output HDMI1 --auto --above eDP1"</command>' )
    print( '  </action>' )
    print( '</item>' )

    print( '<item label="eDP">' )
    print( '  <action name="Execute">' )
    print( '    <command>sh -c "pactl set-card-profile 0 output:analog-stereo+input:analog-stereo; xrandr --output eDP1 --auto; xrandr --output HDMI1 --off"</command>' )
    print( '  </action>' )
    print( '</item>' )

else:
    print('<item label="External displays connected. Check script"></item>')


print('</openbox_pipe_menu>')



# echo '<openbox_pipe_menu>'

# if [[ $devices == *"HDMI1 connected"* ]] ; then

# elif [[ $devices == *"VGA1 connected"* ]] ; then

#     echo -e '<item label=" VGA">'
#     echo '  <action name="Execute">'
#     echo '    <command>xrandr --output VGA1 --auto ; xrandr --output eDP1 --off</command>'
#     echo '  </action>'
#     echo '</item>'

#     echo '<item label="Laptop + VGA">'
#     echo '  <action name="Execute">'
#     echo '    <command>xrandr --output eDP1 --auto ; xrandr --output VGA1 --auto</command>'
#     echo '  </action>'
#     echo '</item>'

# else
#     echo '<item label="No external displays connected"></item>'
# fi

# echo '</openbox_pipe_menu>'
