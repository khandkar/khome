Graphical boot
--------------

### Disable

	sudo systemctl set-default multi-user.target

### Enable

	sudo systemctl set-default graphical.target


Fonts
-----

https://wiki.ubuntu.com/Fonts


Notification system
-------------------

### Disable

    mv /usr/share/dbus-1/services/org.freedesktop.Notifications.service /usr/share/dbus-1/services/org.freedesktop.Notifications.service.disabled
