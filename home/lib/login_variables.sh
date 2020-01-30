export PATH=$HOME/bin:$HOME/.local/bin:/snap/bin:/sbin:/usr/sbin:$PATH
export EDITOR=vim
export VISUAL=$EDITOR
export DIR_GITHUB="${HOME}/Archives/Software/src/repos/remote/github.com"
export DIR_VIDEO="${HOME}/Archives/Videos"
export DIR_YOUTUBE="${DIR_VIDEO}/Web/youtube.com"
export DIR_NOTES="$HOME/Documents/Notes"
export DIR_LOG="$HOME/var/log"
export DIR_LOG_MPD="$DIR_LOG/mpd"
export FILE_LOG_MPD="$DIR_LOG_MPD/mpd.log"
export FILE_VIDEO_CATALOG="$DIR_VIDEO/catalog"

export NQDIR="$HOME/var/run/nq"
mkdir -p "$NQDIR"

# .Net Core
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet

# DPI
. "$HOME/lib/login_variables_dpi.sh"
