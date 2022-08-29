#! /bin/bash

set -e

if which systemd; then
    opt_systemd='--systemd'
else
    opt_systemd=''
fi

dbus-update-activation-environment $opt_systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
exec dbus-launch --sh-syntax --exit-with-session ~/.xlaunch startx
