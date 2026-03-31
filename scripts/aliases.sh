alias reload='source ~/.zshrc'
alias rc='code $TERMINAL_DIR ~/.kube ~/.aws'

alias cat='bat'

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias tf='terraform'

elif [[ -f /etc/lsb-release ]] && grep -qi ubuntu /etc/lsb-release; then
  alias tf='tofu'

elif [[ -f /etc/arch-release ]]; then
  alias tf='tofu'

  alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'

fi

alias tfa='tf apply'
alias tfu='tf force-unlock'

alias kx='kubie ctx'
alias kn='kubie ns'

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

function kgetall {
  kubectl api-resources --verbs=list --namespaced -o name | grep -v events | xargs -n 1 kubectl get --show-kind --ignore-not-found -n $1 --no-headers | cut -d ' ' -f 1
}
