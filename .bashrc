# if not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# color mapping
grey='\[\033[1;30m\]'
red='\[\033[0;31m\]'
RED='\[\033[1;31m\]'
green='\[\033[0;32m\]'
GREEN='\[\033[1;32m\]'
yellow='\[\033[0;33m\]'
YELLOW='\[\033[1;33m\]'
magenta='\[\033[0;35m\]'
MAGENTA='\[\033[1;35m\]'
white='\[\033[0;37m\]'
WHITE='\[\033[1;37m\]'
blue='\[\033[0;34m\]'
BLUE='\[\033[1;34m\]'
cyan='\[\033[0;36m\]'
CYAN='\[\033[1;36m\]'
NC='\[\033[0m\]'

if [ $(id -u) -eq 0 ]; then
	PS1="$RED[\u@\h $MAGENTA\W$RED]$CYAN\$$NC "
else
	PS1="$RED[$YELLOW\u$GREEN@$BLUE\h $MAGENTA\W$RED]$CYAN\$$NC "
fi

[ ! -z "$XDG_CONFIG_HOME" ] && [ -f $XDG_CONFIG_HOME/dircolors ] && eval "$(dircolors $XDG_CONFIG_HOME/dircolors)"
[ ! -z "$XDG_CONFIG_HOME" ] && [ -f $XDG_CONFIG_HOME/shell/aliasrc ] && source $XDG_CONFIG_HOME/shell/aliasrc
[ ! -z "$BASH_COMPLETIONS" ] && [ -d "$BASH_COMPLETIONS" ] && [ ! -z "$(ls -A $BASH_COMPLETIONS)" ] && for f in $BASH_COMPLETIONS/*; do source $f; done
