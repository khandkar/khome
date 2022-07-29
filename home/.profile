# XXX Setting the scaling variables causes inconsistent response from apps.
#     However, launching mate-appearance-properties after startx - causes
#     something to be adjusted and most apps scale up correctly. With some
#     exceptions, like zeal.
#. $HOME/lib/login_variables_dpi.sh

. $HOME/lib/login_variables.private.sh
. $HOME/lib/login_variables.sh
. $HOME/lib/login_functions.sh
unalias d 2> /dev/null || true  # Defined by oh-my-zsh, but I want it for dict/fzf function.
. $HOME/lib/login_aliases.sh

umask 077

if test ! "$SSH_AGENT_PID"
then
    eval "$(ssh-agent)"
fi

## TODO Rename status to motd
case "$-" in
    # Only execute if shell is interactive.
    *i*) status;;
esac

printf '\n'

# TODO File per quote. Seed rng with date and select quote of the day.
#awk \
#    -v RS='' \
#    'BEGIN {srand()} {fortunes[n++] = $0} END {print fortunes[int(n * rand())]}' \
#    ~/arc/doc/fortunes/orangebook_.txt \
#| fold -s
