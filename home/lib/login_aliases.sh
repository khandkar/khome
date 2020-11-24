alias g=git
alias e='emacs -nw'
alias v=vim
alias c='ncal -Mb'  # -M : start week with Monday, -b : use old format (like in cal)
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
alias drafts='cd ~/doc/drafts && drafts_prepend && vim drafts.md'
alias notes='cd ~/doc/notes && notes_prepend && vim notes.md'
alias bookmarks='cd ~/doc/bookmarks && vim bookmarks.md'
alias ideas='cd ~/doc/ideas && vim ideas.md'
alias quotes='cd ~/doc/quotations && vim quotations.md'
