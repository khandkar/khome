alias n=notify_done
alias s='echo $?'
alias g=git
alias gr='git remote -v'
alias e='emacs -nw'
alias v=vim
alias c='cal -vm3'  # -v: vertical, -m: start week with Monday, -3: show 3 months (prev, curr, next)
alias h='history | fzf -e'
alias   l='ls -lFhv --group-directories-first --color=auto'
alias  ll='l -a'
alias lll='ll --color=never'
alias tree='tree --dirsfirst'
#alias dotnet='~/.dotnet/dotnet'
alias fsi='ledit dotnet /usr/share/dotnet/sdk/2.1.504/FSharp/fsi.exe'
alias fsc='dotnet /usr/share/dotnet/sdk/2.1.504/FSharp/fsc.exe'
alias tm='tmux'
#alias startx='printf "Use a specialized startx-...\n"'
alias mans='man $(man -k . | sort | fzf -e | awk "{print \$1}")'
alias twread='twtxt timeline --limit 1000 | less'
alias todo='cd ~/doc/TODO && vim TODO.md'
alias work_todo="cd $DIR_WORK/docs/TODO && vim -c NERDTreeFind TODO.txt"
alias drafts='cd ~/doc/drafts && drafts_prepend && vim -c NERDTreeFind drafts.md'
alias notes='cd ~/doc/notes && notes_prepend && vim notes.md'
alias bookmarks='cd ~/doc/bookmarks && vim bookmarks.md'
alias ideas='cd ~/doc/ideas && vim ideas.md'
alias quotes='cd ~/doc/quotations && vim quotations.md'
alias bitcoin='nc ticker.bitcointicker.co 10080'  # https://github.com/chubin/awesome-console-services#Money
alias weather='cat ~/.pista-out/weather-summary'
