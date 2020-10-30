. $HOME/lib/login_variables.private.sh  # Personal data variables

unalias d 2> /dev/null || true  # Defined by oh-my-zsh, but I want it for dict/fzf function.

for file in $HOME/lib/login_*.sh
do
    . $file
done

umask 077

if test ! "$SSH_AGENT_PID"
then
    eval "$(ssh-agent)"
fi

# https://rustup.rs/
export PATH="$HOME/.cargo/bin:$PATH"

motd
