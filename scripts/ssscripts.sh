#!/bin/bash
TMPFILE=`mktemp -u /tmp/ssclipboard.XXXXXXXX.png`
gnome-screenshot -af $TMPFILE && xclip $TMPFILE -selection clipboard -target image/png; rm $TMPFILE || echo ""
