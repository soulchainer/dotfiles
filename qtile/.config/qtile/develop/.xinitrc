#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export BROWSER=firefox-aurora
# Ensure file associations with some applications
export DE=gnome
# Ensure that GTK themes are applied uniformly in the Desktop Environment
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

exec ~/github/qtile/bin/qtile -c "$QTILE_DEV/config.py" -l DEBUG >> ~/.qtile.dev.log
