export EDITOR=vim
export VISUAL=$EDITOR

### DIRs ###
export DIR_GITHUB="${HOME}/arc/sw/src/repos/remote/github.com"
export DIR_AUDIO="${HOME}/arc/aud"
export DIR_VIDEO="${HOME}/arc/vid"
export DIR_YOUTUBE_VIDEO="${DIR_VIDEO}/web/youtube.com"
export DIR_YOUTUBE_AUDIO="${DIR_AUDIO}/youtube.com"
export DIR_NOTES="$HOME/doc/notes"
export DIR_LOG="$HOME/var/log"
export DIR_LOG_MPD="$DIR_LOG/mpd"
export DIR_NQ="$HOME/var/run/nq"

# ensure all DIRs exist:
env | grep ^DIR_ | awk -F= '{print $2}' | xargs -I% mkdir -p '%'

### FILEs ###
export FILE_LOG_MPD="$DIR_LOG_MPD/mpd.log"
export FILE_VIDEO_CATALOG="$DIR_VIDEO/catalog"

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

# Doom
export PATH=$PATH:$HOME/.emacs.d/bin

# Ruby
export PATH="$PATH":"$HOME"/.gem/ruby/2.5.0/bin

# Go
export GOPATH=$HOME/.go

export PATH=$HOME/bin:$HOME/.local/bin:$GOPATH/bin:/snap/bin:/sbin:/usr/sbin:$PATH
