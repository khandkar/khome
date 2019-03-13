. $HOME/lib/login_variables.private.sh  # Personal data variables

for file in $HOME/lib/login_*.sh
do
    . $file
done
