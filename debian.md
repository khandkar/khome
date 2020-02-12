Multiarch
---------

https://wiki.debian.org/Multiarch/HOWTO

```
dpkg --add-architecture i386
apt update
apt install $PKG_NAME:i386
```

Backports
---------

List installed:

`dpkg-query -W | grep '~bpo'`
