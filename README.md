khome
=====

Environment.

![Screenshot on T420s](screenshot-tiling-t420s.png)


Hardware
--------
- Laptops:
    - Purism Librem 15 v4
    - ThinkPad T400
    - ThinkPad T420s
    - ThinkPad T570
- Monitors:
    - Asus ROG PG348Q 34" 3440 x 1440
    - Dell 1920x1080
- Keyboard:
    - DREVO Tyrfing V2
- Mice:
    - PICTEC GEPC034AB
    - Apple Mighty Mouse USB (A1152)


Software
--------

- OS:
    - Debian GNU/Linux 10 (Buster)
- Dictionary:
    - `dict`
- File browsing:
    - `ls` and `tree` (primary)
    - `pcmanfm` (secondary)
    - `ranger` (occasional)
    - `nnn` (occasional)
- IRC:
    - `ii`
    - `ii-tools`
- Multimedia:
    - Image:
        - Editing:
            - `gimp`
        - Viewing:
            - `sxiv` (primary)
            - `eog` (secondary)
    - Music:
        - Local:
            - `ripit` (rip CDs)
            - `mpd`
            - `mpc`
            - `ncmpcpp`
            - `ncmpc` (to delete from playlist, which doesn't work in `ncmpcpp`)
        - Streaming:
            - [soma fm](http://somafm.com/) (primary) (via `mpd`)
            - `spotify` (occasional)
    - Video:
        - `mpv`
        - `mplayer`
        - `vlc`
- PDF:
    - `okular`
    - `mupdf`
    - `pdftotext`
- Search:
    - `locate`
    - `find`
    - `grep`
- Terminal:
    - `st`
    - `tmux`
    - `zsh`
- Text editing:
    - `vim`
    - `gvim`
- Web browsing:
    - `qutebrowser` (primary)
    - `chromium` (fallback)
    - `elinks` (occasional)
    - `ddgr` (occasional small web search)
- X
    - `dwm`
    - `khatus` (currently x2)
    - `dunst`
    - `compton`
    - `xscreensaver`
    - `xbindkeys`
    - `hsetroot` (background color)
    - `feh` (background image)

### Potentially useful

- Desktop search:
    - [doodle](https://grothoff.org/christian/doodle/)

Reading list
------------
- https://wiki.archlinux.org/index.php/Xinit
- https://aur.archlinux.org/cgit/aur.git/tree/?h=xinit-xsession
- https://wiki.archlinux.org/index.php/PCManFM
- https://www.ibm.com/developerworks/library/os-xapianomega/

Directory tree organization
---------------------------
An incomplete sketch.

```
Archives
    Audio
    Backups
        $machine_1
        ...
        $machine_n
    Documents
    Image
        Photos
            $year
                $month
                    $day
                        ?$event_name
        Screenshots
    Video
Projects
Work
```
