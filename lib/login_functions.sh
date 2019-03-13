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

pa_def_sink() {
    pactl info | awk '/^Default Sink:/ {print $3}'
}

void_pkgs() {
    curl "https://xq-api.voidlinux.org/v1/query/x86_64?q=$1" | jq '.data'
}

# Colorful man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

experiment() {
    cd "$($HOME/bin/experiment $@)"
}

hump() {
    ledit -l $(stty size | awk '{print $2}') ocaml $@
}

howto() {
    cd $HOME/Archives/Documents/HOWTOs && cat $(fzf) && cd -
}

gh_fetch_repos() {
    curl "https://api.github.com/$1/$2/repos?page=1&per_page=10000"
}

gh_clone() {
    gh_fetch_repos "$1" "$2" \
    | jq --raw-output '.[] | select(.fork | not) | .git_url' \
    | parallel -j 25 \
    git clone {}
}

gh_clone_user() {
    gh_clone 'users' "$1"
}

gh_clone_org() {
    gh_clone 'orgs' "$1"
}
