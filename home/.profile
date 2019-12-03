. $HOME/lib/login_variables.private.sh  # Personal data variables

unalias d  # Defined by oh-my-zsh, but I want it for dict/fzf function.

for file in $HOME/lib/login_*.sh
do
    . $file
done
