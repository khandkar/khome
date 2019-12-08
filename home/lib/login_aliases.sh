alias h='history | fzf -e'
alias   l='ls -lFhv --group-directories-first'
alias  la='l -A'
alias  ll='la --color=auto'
alias lll='la --color=never'
alias tree='tree --dirsfirst'
#alias dotnet='~/.dotnet/dotnet'
alias fsi='ledit dotnet /usr/share/dotnet/sdk/2.1.504/FSharp/fsi.exe'
alias fsc='dotnet /usr/share/dotnet/sdk/2.1.504/FSharp/fsc.exe'
alias tm='tmux'
#alias startx='printf "Use a specialized startx-...\n"'
alias mans='man $(man -k . | sort | fzf -e | awk "{print \$1}")'
alias twread='twtxt timeline --limit 1000 | less'
