# Top Disk-Using directories
tdu() {
    du "$1" \
    | sort -n -k 1 -r --parallel="$(nproc)" \
    | head -50 \
    | awk '
        {
            size = $1
            path = $0
            sub("^" $1 "\t+", "", path)
            gb = size / 1024 / 1024
            printf("%f\t%s\n", gb, path)
        }' \
    | cut -c 1-115
}

void_pkgs() {
    curl "https://xq-api.voidlinux.org/v1/query/x86_64?q=$1" | jq '.data'
}

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

alias l='ls -lFhv'
alias ll='l -a'
alias lll='ll --color=never'
alias tree='tree --dirsfirst'
alias fsi='ledit ~/.dotnet/dotnet ~/.dotnet/sdk/2.1.503/FSharp/fsi.exe'
alias tm='tmux'

PATH=$HOME/bin:/snap/bin:/sbin:/usr/sbin:$PATH
EDITOR=vim
