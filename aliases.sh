alias gcat="$(which cat)"
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

alias myip="curl -s http://checkip.amazonaws.com/"

function 2d {
  read
  echo "$(date +'%Y-%m-%d %H:%M') ${REPLY}" >> $HOME/today.log
}

function yd {
  cat $HOME/today.log | grep $(tail $HOME/today.log -n 1 | cut -c 1-10) | cut -c 12-
}

function pw () {
	LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?\[\]\(\)" < /dev/urandom | head -c "${1:-64}"
}

function secret {
  eval $(op signin --session my)
  eval $(op get item env-$1 --fields notes)
}
