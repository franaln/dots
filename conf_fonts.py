#! /usr/bin/env python

to_add = """
  <match target="font" >
    <edit mode="assign" name="autohint">  <bool>true</bool></edit>
    <edit mode="assign" name="hinting">  <bool>false</bool></edit>
    <edit mode="assign" name="lcdfilter"> <const>lcddefault</const></edit>
    <edit mode="assign" name="hintstyle"> <const>hintslight</const></edit>
    <edit mode="assign" name="antialias"> <bool>true</bool></edit>
    <edit mode="assign" name="rgba">      <const>rgb</const></edit>
  </match>

  <match target="font">
    <test name="pixelsize" qual="any" compare="more"><double>15</double></test>
    <edit mode="assign" name="lcdfilter"><const>lcdlight</const></edit>
    <edit mode="assign" name="hintstyle"><const>hintnone</const></edit>
  </match>

  <match target="font">
    <test name="weight" compare="more"><const>medium</const></test>
    <edit mode="assign" name="hintstyle"><const>hintnone</const></edit>
    <edit mode="assign" name="lcdfilter"><const>lcdlight</const></edit>
  </match>

  <match target="font">
    <test name="slant"  compare="not_eq"><double>0</double></test>
    <edit mode="assign" name="hintstyle"><const>hintnone</const></edit>
    <edit mode="assign" name="lcdfilter"><const>lcdlight</const></edit>
  </match>
"""

def main():

    with open('/etc/fonts.conf', 'w') as f:

        lines = f.read().split('\n')

        for line in lines:
            if '</fontconfig>' in line:


        f.write(to_add)



if __name__ == '__main__':
    main()