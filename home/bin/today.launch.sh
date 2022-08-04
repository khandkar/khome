#! /bin/bash

. ~/lib/login_variables.sh # To get $DIR_TODO
. ~/lib/login_functions.sh # To get today

EDITOR=gvim EDITOR_ARGS='-c NERDTreeFind' today
