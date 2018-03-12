# .bashrc

if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
  startx
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="/opt/anaconda/bin:$PATH"
export OPENSSL_CONF=/opt/anaconda/ssl/openssl.cnf
export TERM="xterm-256color"

PS1=' > '

alias ls='ls --color=auto'

# file safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# tmux
alias sesh='tmux -2 new-session -s'
alias attach='tmux a -t'

_attach(){
  local noSessions=$(tmux ls 2>&1 >/dev/null)
  if [ $COMP_CWORD -ne 1 ]; then
    :
  elif [[ -z $noSessions ]]; then
    local possSessions=$(for item in $(tmux ls | awk '{print $1}'); do echo $item | rev | cut -c 2- | rev; done)
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$possSessions" -- $cur) )
  else
    :
  fi
}

complete -F _attach attach

# start tmux session
! tmux ls > /dev/null && [[ $TERM == *"xterm"* ]] && { sesh main && exit 0; }
