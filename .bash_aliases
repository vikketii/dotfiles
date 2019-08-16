############################################################
## shorts

alias maim-cp='maim -s | xclip -selection clipboard -t image/png'
alias up='sudo pacman -Syu'
alias check='journalctl -p 3 -xb; sudo systemctl --failed'
alias ..='cd ..'
alias all='ls -Alh'
alias c='clear'

alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

alias vcv="cd ~/bin/Rack; ./Rack &"

############################################################
## improving basic programs

alias cat='bat'
alias top='htop'
alias rm='trash'
alias ping='prettyping --nolegend'
alias ls='ls --color=auto'


############################################################
## git

alias gcm='git commit -m'
alias ga='git add'

############################################################
## functions

fen() { # translate from english
    text="$@"
    trans en:fi $text
}
ffi() { # translate from finnish
    text="$@"
    trans fi:en $text
}
