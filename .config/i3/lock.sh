#!/bin/bash
TMPBG=/tmp/screen.png
scrot /tmp/screen.png -o
convert $TMPBG -scale 10% -blur 0x3 -scale 1000% $TMPBG
#convert $TMPBG -gravity center -composite -matte $TMPBG
i3lock -i $TMPBG
