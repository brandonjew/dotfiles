#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Aliases
alias ls='ls --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Tmux aliases
alias sesh='tmux new-session -s'
alias attach='tmux a -t'

# Autocomplete for tmux attach
_attach(){
  noSessions=$(tmux ls 2>&1 >/dev/null)
  if [ $COMP_CWORD -ne 1 ]; then
    :
  elif [[ -z $noSessions ]]; then
    possSessions=$(for item in $(tmux ls | awk '{print $1}'); do echo $item | rev | cut -c 2- | rev; done)
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$possSessions" -- $cur) )
  else
    :
  fi
}
complete -F _attach attach

