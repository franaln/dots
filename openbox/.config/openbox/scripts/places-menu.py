#! /usr/bin/env python

file_manager = "nautilus"

print('<openbox_pipe_menu>')

for line in open('/home/fran/.config/gtk-3.0/bookmarks').read().split('\n'):

    if not line:
        continue

    try:
        path, name = line.split()
    except:
        path = line
        name = line.split('/')[-1]

    print("""<item label=\"%s\">
    <action name=\"Execute\">
        <command>
            %s
        </command>
    </action>
</item>""" % (name, ' '.join([file_manager, path])))

print('</openbox_pipe_menu>')
