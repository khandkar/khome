# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
shopt -s histappend

#export PS1='\n\u@\h \w\n\$ '
export PS1='\n\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01m\]\w\[\033[00m\]\n\$ '

. ~/.profile
