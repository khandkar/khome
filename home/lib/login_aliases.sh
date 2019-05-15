alias   l='ls -lFhv'
alias  la='l -A'
alias  ll='la --color=auto'
alias lll='la --color=never'
alias tree='tree --dirsfirst'
alias dotnet="$HOME/.dotnet/dotnet"
alias fsi="dotnet $HOME/.dotnet/sdk/2.1.503/FSharp/fsi.exe"
alias tm='tmux'
alias startx='printf "Use a specialized startx-...\n"'
alias mans='man $(man -k . | sort | fzf -e | awk "{print \$1}")'
