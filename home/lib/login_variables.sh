export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:/snap/bin:/sbin:/usr/sbin:$PATH
export EDITOR=vim
export VISUAL=$EDITOR
export DIR_GITHUB="${HOME}/arc/soft/src/repos/remote/github.com"
export DIR_AUDIO="${HOME}/arc/aud"
export DIR_VIDEO="${HOME}/arc/vid"
export DIR_YOUTUBE_VIDEO="${DIR_VIDEO}/Web/youtube.com"
export DIR_YOUTUBE_AUDIO="${DIR_AUDIO}/youtube.com"
export DIR_NOTES="$HOME/doc/notes"
export DIR_LOG="$HOME/var/log"
export DIR_LOG_MPD="$DIR_LOG/mpd"
export FILE_LOG_MPD="$DIR_LOG_MPD/mpd.log"
export FILE_VIDEO_CATALOG="$DIR_VIDEO/catalog"

export NQDIR="$HOME/var/run/nq"
mkdir -p "$NQDIR"

# .Net Core
#DOTNET_ROOT_path=$(which dotnet)
#DOTNET_ROOT_realpath=$(realpath "$DOTNET_ROOT_path")
#DOTNET_ROOT_dirname=$(dirname "$DOTNET_ROOT_realpath")
#export DOTNET_ROOT="$DOTNET_ROOT_dirname"
export PATH=$PATH:$HOME/.dotnet/tools

# Rust / cargo
export PATH=$PATH:$HOME/.cargo/bin

# Racket packages
# WARN: ensure the version is correct
export PATH=$PATH:$HOME/.racket/7.9/bin

# Gambit Scheme
export PATH=$PATH:/usr/local/Gambit/bin

# DPI
. "$HOME/lib/login_variables_dpi.sh"
