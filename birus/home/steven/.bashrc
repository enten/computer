#
# ~/.bashrc
#

# If not running dwm, starts it
[[ -z $DISPLAY ]] && startx

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load autocompletion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# If not in PATH, add HOME/bin
[[ $PATH =~ $HOME/bin ]] || PATH=$HOME/bin:$PATH

# Aliases
alias grep='grep --colour=auto'
alias l='ls --color=auto'
alias la='ls --color=auto -a'
alias ll='ls --color=auto -l'
alias ls='ls --color=auto'
alias lla='ls --color=auto -la'
alias nano='nano -c'
alias skype='apulse32 skype'

# Exports
export VISUAL="nano"

# PS1
#PS1='[\u@\h \W]\$ '

function _update_ps1() { export PS1="$(/opt/promptastic/promptastic.py $?)"; }
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"


