Homebrew packages set compliment:

    comm -1 -3 <(brew list | sort) <(./list ./pkgs-brew-install.list | gsed -E 's/[ ]+/\n/g' | sort)

where `gsed` is needed to understand `\n`.


Remove quarantine attribute from an app that is from an unidentified developer:
`xattr -d com.apple.quarantine /Applications/$app.app`


Tiling window managers:
- [yabai](https://github.com/koekeishiya/yabai)
