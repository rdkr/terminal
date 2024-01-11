alias docker='podman'

alias cat='bat'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias reload='source ~/.zshrc'
alias zshrc='code $TERMINAL_DIR'
alias tf='terraform'

alias kx='kubectx'
alias kn='kubens'

alias ka='kubectl --context=k8s-agent-asm'
alias kd='kubectl --context=k8s-agent-dsm'

function today {
  echo "$(date +'%Y-%m-%d %H:%M') $@" >> $HOME/today.log
}

function yday {
  cat $HOME/today.log | grep $(tail $HOME/today.log -n 1 | cut -c 1-10) | cut -c 12-
}

function pw () {
	LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?\[\]\(\)" < /dev/urandom | head -c "${1:-64}"
}

function secrets-aws {
  eval $(op signin my)
  eval $(op get item 4toguey34zgtld3kxkneytiyi4 --fields notes)
}

function secrets-hermes {
  eval $(op signin my)
  eval $(op get item ehcdhcrzjbe35ejokjokclu56y --fields notes)
}
