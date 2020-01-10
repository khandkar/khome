#

d() {
    local -r word=$(fzf < /usr/share/dict/words)
    dict "$word"
}

shell_activity_report() {
    # TODO: optional concrete number output
    # TODO: optional combinations of granularities: hour, weekday, month, year
    local group_by="$1"
    case "$group_by" in
        'mon') ;;
        'dow') ;;
        '') group_by='dow';;
        *)
            echo "Usage: $0 [mon|dow]" >&2
            kill -INT $$
    esac
    history \
    | awk -v group_by="$group_by" '
        function date2dow(y, m, d,    _t, _i) {
            # Contract:
            #   y > 1752,  1 <= m <= 12.
            # Source:
            #   Sakamoto`s methods
            #   https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Sakamoto%27s_methods
            _t[ 0] = 0
            _t[ 1] = 3
            _t[ 2] = 2
            _t[ 3] = 5
            _t[ 4] = 0
            _t[ 5] = 3
            _t[ 6] = 5
            _t[ 7] = 1
            _t[ 8] = 4
            _t[ 9] = 6
            _t[10] = 2
            _t[11] = 4
            y -= m < 3
            _i = int(y + y/4 - y/100 + y/400 + _t[m - 1] + d) % 7
            _i = _i == 0 ? 7 : _i  # Make Sunday last
            return _i

        }

        {
            # NOTE: $2 & $3 are specific to oh-my-zsh history output
            date = $2
            time = $3
            d_fields = split(date, d, "-")
            t_fields = split(time, t, ":")
            if (t_fields && d_fields) {
                # +0 to coerce number from string
                year  = d[1] + 0
                month = d[2] + 0
                day   = d[3] + 0
                hour = t[1] + 0
                dow = date2dow(year, month, day)
                g = group_by == "mon" ? month : dow  # dow is default
                c = count[g, hour]++
            }
            if (c > max)
                max = c
        }

        END {
            w[1] = "Monday"
            w[2] = "Tuesday"
            w[3] = "Wednesday"
            w[4] = "Thursday"
            w[5] = "Friday"
            w[6] = "Saturday"
            w[7] = "Sunday"

            m[ 1] = "January"
            m[ 2] = "February"
            m[ 3] = "March"
            m[ 4] = "April"
            m[ 5] = "May"
            m[ 6] = "June"
            m[ 7] = "July"
            m[ 8] = "August"
            m[ 9] = "September"
            m[10] = "October"
            m[11] = "November"
            m[12] = "December"

            n = group_by == "mon" ? 12 : 7  # dow is default

            for (gid = 1; gid <= n; gid++) {
                group = group_by == "mon" ? m[gid] : w[gid]
                printf "%s\n", group;
                for (hour=0; hour<24; hour++) {
                    c = count[gid, hour]
                    printf "  %2d ", hour
                    for (i = 1; i <= (c * 100) / max; i++)
                        printf "|"
                    printf "\n"
                }
            }
        }'
}

top_commands() {
    history \
    | awk '
        {
            count[$4]++
        }

        END {
            for (cmd in count)
                print count[cmd], cmd
        }' \
    | sort -n -r -k 1 \
    | head -50 \
    | awk '
        {
            cmd[NR] = $2
            c = count[NR] = $1 + 0  # + 0 to coerce number from string
            if (c > max)
                max = c
        }

        END {
            for (i = 1; i <= NR; i++) {
                c = count[i]
                printf "%s %d ", cmd[i], c
                scaled = (c * 100) / max
                for (j = 1; j <= scaled; j++)
                    printf "|"
                printf "\n"
            }
        }' \
    | column -t
}

# Top Disk-Using directories
# TODO: Consider using numfmt instead of awk
tdu() {
    du "$1" \
    | sort -n -k 1 \
    | tail -50 \
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

# Top Disk-Using Files
tduf() {
    find "$1" -type f -printf '%s\t%p\0' \
    | sort -z -n -k 1 \
    | tail -z -n 50 \
    | gawk -v RS='\0' '
        {
            size = $1
            path = $0
            sub("^" $1 "\t+", "", path)
            gb = size / 1024 / 1024 / 1024
            printf("%f\t%s\n", gb, path)
        }'
}

# Most-recently modified file system objects
recent() {
    # NOTES:
    # - intentionally not quoting the parameters, so that some can be ignored
    #   if not passed, rather than be passed to find as an empty string;
    # - %T+ is a GNU extension;
    # - gawk is able to split records on \0, while awk cannot.
    find $@ -printf '%T@ %T+ %p\0' \
    | tee >(gawk -v RS='\0' 'END { printf("[INFO] Total found: %d\n", NR); }') \
    | sort -z -k 1 -n -r \
    | head -n "$(stty size | awk 'NR == 1 {print $1 - 5}')" -z \
    | gawk -v RS='\0' '
        {
            sub("^" $1 " +", "")  # Remove epoch time
            sub("+", " ")         # Blank-out the default separator
            sub("\\.[0-9]+", "")  # Remove fractional seconds
            print
        }'
}

recent_dirs() {
    recent "$1" -type d
}

recent_files() {
    recent "$1" -type f
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
    cd "$(~/bin/experiment $@)" || kill -INT $$
}

hump() {
    ledit -l "$(stty size | awk '{print $2}')" ocaml $@
}

howto() {
    cat "$(find  ~/Archives/Documents/HOWTOs -mindepth 1 -maxdepth 1 | sort | fzf)"
}

yt() {
    local _yt_uri
    local _yt_id
    local _yt_title
    local _yt_dir

    _yt_uri="$1"
    _yt_id=$(youtube-dl --get-id "$_yt_uri")
    _yt_title=$(youtube-dl --get-title "$_yt_uri")
    _yt_dir="${DIR_YOUTUBE}/individual-videos/${_yt_title}--${_yt_id}"

    mkdir -p "$_yt_dir"
    cd "$_yt_dir" || kill -INT $$
    echo "$_yt_uri" > 'uri'
    youtube-dl -c --write-description --write-info-json "$_yt_uri"
}

gh_fetch_repos() {
    curl "https://api.github.com/$1/$2/repos?page=1&per_page=10000"
}

gh_clone() {
    gh_user_type="$1"
    gh_user_name="$2"
    gh_dir="${DIR_GITHUB}/${gh_user_name}"
    mkdir -p "$gh_dir"
    cd "$gh_dir" || kill -INT $$
    gh_fetch_repos "$gh_user_type" "$gh_user_name" \
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

gh_clone_repo() {
    gh_username=$(echo "$1" | awk -F / '"$1 == "https" && $3 == github.com" {print $4}')
    gh_dir="${DIR_GITHUB}/${gh_username}"
    mkdir -p "$gh_dir"
    cd "$gh_dir" || kill -INT $$
    git clone "$1"
}

work_log_template() {
cat << EOF
$(date '+%F %A')
==========

Morning report
--------------

### Previous

### Current

### Blockers

Day's notes
-----------
EOF
}

work_log() {
    mkdir -p "$DIR_WORK_LOG"
    file_work_log_today="${DIR_WORK_LOG}/$(date +%F).md"
    if [ ! -f "$file_work_log_today" ]
    then
        work_log_template > "$file_work_log_today"
    fi
    vim -c 'set spell' "$file_work_log_today"

}

note() {
    mkdir -p "$DIR_NOTES"
    vim -c 'set spell' "$DIR_NOTES/$(date +'%Y_%m_%d--%H_%M_%S%z')--$1.md"
}

weather() {
    curl "http://wttr.in/$WEATHER_LOCATION"
}

bt_devs_paired() {
    bluetoothctl -- paired-devices \
    | awk '{print $2}' \
    | xargs bluetoothctl -- info
}

bt_devs() {
    bluetoothctl -- devices \
    | awk '{print $2}' \
    | xargs bluetoothctl -- info
}

run() {
    stderr="$(mktemp)"
    $@ 2> >(tee "$stderr")
    code="$?"
    urgency=''
    case "$code" in
        0) urgency='normal';;
        *) urgency='critical'
    esac
    notify-send -u "$urgency" "Job done: $code" "$(cat $stderr)"
    rm "$stderr"
}
