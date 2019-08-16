# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_secret_aliases ]; then
    . ~/.bash_secret_aliases
fi

eval "$(thefuck --alias)"
