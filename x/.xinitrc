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

export BROWSER=firefox
# para que funcionen bien las asociaciones de archivos con chrome
export DE=gnome

## Ensure that GTK themes are applied uniformly in the Desktop Environment

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"


## Where the default Home folders have not already been created, generate them

if [ -x /usr/bin/xdg-user-dirs-update ]; then
   /usr/bin/xdg-user-dirs-update
fi

# Iniciar ssh-agent
eval "$(ssh-agent -s)"

# Añadir la configuración de URxvt
xrdb -merge ~/.Xresources
numlockx &
# Cargar la distro de teclado personalizada, "soul_kb" con variante "soul_custom_kbd"
setxkbmap -layout soul_kbd -variant soul_custom_kbd
# volumeicon &
urxvtd -q -o -f &
redshift -l 37.94008:-1.144509 -t 5500K:3400K &
# Para que midori se maneje con certificados de seguridad
export `gnome-keyring-daemon –start`
# Basic compositing effects
# Opcion de compton 100% por software
# compton --opengl --vsync opengl-swc --paint-on-overlay -b &
compton --opengl --paint-on-overlay -b &
## Optionally enable file manager in daemon mode for automounting
#(sleep 1s && thunar --daemon) &
(sleep 1s && pcmanfm --daemon-mode) &
# Abrir el nitrogen, para establecer el fondo
(sleep 1s && nitrogen --restore) &

# Sesion is invoqued with «xinit session_name». Qtile is kept as default.
session=${1:-qtile}

case $session in
    awesome           ) exec awesome;;
    mate              ) exec mate-session;;
    openbox           ) exec dbus-launch --exit-with-session openbox-session;;
    qtile             ) exec qtile;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
