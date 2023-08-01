#!/bin/python3 

# Replace the code in the file
file="/etc/xdg/openbox/rc.xml"
code="<!-- Keybindings for windows -->"
new_code="""  <!-- Keybindings for Audio -->
    <keybind key=\"XF86AudioMute\">
      <action name=\"Execute\">
        <command>pactl set-sink-mute 0 toggle</command>
      </action>
    </keybind>
    <keybind key=\"XF86AudioRaiseVolume\">
      <action name=\"Execute\">
        <command>sh -c \"pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%\"</command>
      </action>
    </keybind>
    <keybind key=\"XF86AudioLowerVolume\">
      <action name=\"Execute\">
        <command>sh -c \"pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%\"</command>
      </action>
    </keybind>

    <!-- Keybindings for screen brightness -->
    <keybind key=\"XF86MonBrightnessUp\">
    <action name=\"Execute\">
        <command>light -As \"sysfs/backlight/auto\" 10</command>
    </action>
    </keybind>
    <keybind key=\"XF86MonBrightnessDown\">
    <action name=\"Execute\">
        <command>light -Us \"sysfs/backlight/auto\" 10</command>
    </action>
    </keybind>

    <!-- Keybindings for windows -->
"""

# Get all lines of file in a list

with open(file, 'r') as f:
    lines = f.readlines()

for i in range(len(lines)):
    if code in lines[i]:
        lines[i] = new_code

# Write the file again
with open(file, 'w') as f:
    f.writelines(lines)
