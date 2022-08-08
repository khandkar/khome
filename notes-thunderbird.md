Moving profile
--------------

    http://kb.mozillazine.org/Moving_your_profile_folder_-_Thunderbird

Starting from CLI allows more options, see:

    thunderbird --help

After copying the profile from another computer, start with the profile manager
and select the desired profile, after which normal starts will use it:

    thunderbird --ProfileManager

### Problem

I copied a profile from 4k resolution computer to a 2k one, now icons and text
are huge. How to scale it back down? Don't see anything relevant-looking in the
settings; I looked for "scale", "zoom" and "size".

### Solution

In config editor, find property:

    layout.css.devPixelsPerPx

then change its value from 2.0 to 1.0,
or to -1.0 (which means match current X11 settings).

#### Source

Make a fresh profile and examine `prefs.js` diff until something looks promising.

    $ thunderbird  # Looks bad. Close it.
    $ mv ~/.thunderbird ~/.thunderbird.bak
    $ thunderbird  # Close it. Now we have a fresh profile.
    $ vimdiff ~/.thunderbird/newxxx.default/prefs.js ~/.thunderbird.bak/oldxxx.default/prefs.js
        # Examine every difference until something looks promising. Value 2.0
        # looks like a zoom value and it is refering to some pixel-to-pixel
        # ratio - looks promising!
    $ rm -rf ~/.thunderbird
    $ mv ~/.thunderbird.bak ~/.thunderbird
    $ thunderbird
        # Open config editor, look for devPixelsPerPx and change to 1.0.
        # Looks good!
