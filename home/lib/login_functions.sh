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
    # mb: begin blink
    # md: begin bold
    # me: end   bold, blink and underline
    #
    # so: begin standout (reverse video)
    # se: end   standout
    #
    # us: begin underline
    # ue: end   underline

    LESS_TERMCAP_md=$'\e[01;30m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
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

_yt() {
    local -r base_dir="$1"
    local -r opts="$2"
    local -r uri="$3"

    local -r id=$(youtube-dlc --get-id "$uri")
    local -r title=$(youtube-dlc --get-title "$uri" | sed 's/[^A-Za-z0-9._-]/_/g')
    local -r dir="${base_dir}/${title}--${id}"

    mkdir -p "$dir"
    cd "$dir" || kill -INT $$
    echo "$uri" > 'uri'
    youtube-dlc $opts -c --write-description --write-info-json "$uri"
}

yt_audio() {
    local -r uri="$1"
    _yt "${DIR_YOUTUBE_AUDIO}/individual" '-f 140' "$uri"
}

yt_video() {
    local -r uri="$1"
    _yt "${DIR_YOUTUBE_VIDEO}/individual" "$uri"
}

gh_fetch_repos() {
    curl "https://api.github.com/$1/$2/repos?page=1&per_page=10000"
}

gh_clone() {
    local -r gh_user_type="$1"
    local -r gh_user_name="$2"

    local -r gh_dir="${DIR_GITHUB}/${gh_user_name}"
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

### Prev

### Curr

### Next

### Blockers

Day's notes
-----------
EOF
}

work_log() {
    mkdir -p "$DIR_WORK_LOG"
    local -r file_work_log_today="${DIR_WORK_LOG}/$(date +%F).md"
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
    local _weather_location
    case "$1" in
        '') _weather_location="$WEATHER_LOCATION";;
         *) _weather_location="$1"
    esac
    curl "http://wttr.in/$_weather_location?format=v2"
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
    local -r stderr="$(mktemp)"

    local code urgency

    $@ 2> >(tee "$stderr")
    code="$?"
    case "$code" in
        0) urgency='normal';;
        *) urgency='critical'
    esac
    notify-send -u "$urgency" "Job done: $code" "$(cat $stderr)"
    rm "$stderr"
}

bar_gauge() {
    local -r width="$1"

    awk -v width="$width" '
        {
            used  = $1
            total = $2

            u = num_scale(used, total, 1, width)

            printf "["
            for (i=1; i<=width; i++) {
                c = i <= u ? "|" : "-"
                printf "%s", c
            }
            printf "]\n"
        }

        function num_scale(src_cur, src_max, dst_min, dst_max) {
            return dst_min + ((src_cur * (dst_max - dst_min)) / src_max)
        }
    '
}

motd_mem() {
    local -r bar_width="$1"

    printf 'mem '
    free \
    | awk '$1 == "Mem:" {total=$2; used=$3; print used, total}' \
    | bar_gauge "$bar_width"
}

motd_disk() {
    local -r bar_width="$1"

    printf 'disk '
    df ~ \
    | awk 'NR == 2 {used=$3; avail=$4; total=used+avail; print used, total}' \
    | bar_gauge "$bar_width"
}

motd_batt() {
    local -r bar_width="$1"

    case "$(uname)" in
        'Linux')
            printf 'batt '
            upower --dump \
            | awk '
                /^Device:[ \t]+/ {
                    device["path"] = $2
                    next
                }

                /  battery/ && device["path"] {
                    device["is_battery"] = 1
                    next
                }

                /    percentage:/ && device["is_battery"] {
                    device["battery_percentage"] = $2
                    sub("%$", "", device["battery_percentage"])
                    next
                }

                /^$/ {
                    if (device["is_battery"] && device["path"] == "/org/freedesktop/UPower/devices/DisplayDevice")
                        print device["battery_percentage"], 100
                    delete device
                }
            ' \
            | bar_gauge "$bar_width"
        ;;
    esac
}

indent() {
    awk -v unit="$1" '{printf "%s%s\n", unit, $0}'
}

motd() {
    local -r bar_width='60'
    local -r indent_unit='    '

    uname -srvmo
    hostname | figlet
    uptime

    echo

    printf 'tmux sessions: %d\n' "$(tmux ls 2> /dev/null | wc -l)"

    echo

    echo 'Resources'
    (
        motd_mem "$bar_width"
        motd_disk "$bar_width"
        motd_batt "$bar_width"
    ) \
    | column -t \
    | indent "$indent_unit"

    echo

    echo 'Network'
    echo "${indent_unit}interfaces:"
    (ifconfig; iwconfig) 2> /dev/null \
    | awk '
        /^[^ ]/ {
            device = $1
            sub(":$", "", device)
            if ($4 ~ "ESSID:") {
                _essid = $4
                sub("^ESSID:\"", "", _essid)
                sub("\"$", "", _essid)
                essid[device] = _essid
            }
            next
        }

        /^ / && $1 == "inet" {
            address[device] = $2
            next
        }

        /^ +Link Quality=[0-9]+\/[0-9]+ +Signal level=/ {
            split($2, lq_parts_eq, "=")
            split(lq_parts_eq[2], lq_parts_slash, "/")
            cur = lq_parts_slash[1]
            max = lq_parts_slash[2]
            link[device] = cur / max * 100
            next
        }

        END {
            for (device in address)
                if (device != "lo") {
                    l = link[device]
                    e = essid[device]
                    l = l ? sprintf("%.0f%%", l) : "--"
                    e = e ? e : "--"
                    print device, address[device], e, l
                }
        }
        ' \
    | column -t \
    | indent "${indent_unit}${indent_unit}"

    echo "${indent_unit}servers:"
    # WARN: ensure: $USER ALL=(ALL) NOPASSWD:/bin/netstat
    sudo netstat -tlnp \
    | awk 'NR > 2 {print $7}' \
    | awk -F/ '{printf "%s%s", sep, $2; sep = " "} END {printf "\n"}' \
    | column -t \
    | indent "${indent_unit}${indent_unit}"
}
