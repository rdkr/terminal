alias reload='source ~/.zshrc'
alias rc='code $TERMINAL_DIR ~/.kube ~/.aws'

alias cat='bat'
# alias ls='lsd'
# alias l='ls -l'
# alias la='ls -a'
# alias lla='ls -la'
# alias lt='ls --tree'

alias tf='terraform'
alias tfa='terraform apply'
alias tfu='terraform force-unlock'


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

function notebook {

  deactivate || true

  if [[ -z "$1" ]]; then
    notebook_path="$HOME/notebooks/misc"
  else;
    notebook_path="$HOME/notebooks/$1"
  fi;

  mkdir -p $notebook_path
  cd $notebook_path

  if [[ ! -d "venv" ]]; then
    python3 -m venv venv
    . venv/bin/activate
    pip install jupyterlab
  else;
    . venv/bin/activate
  fi;

  pip freeze > requirements-auto-gen.txt
  jupyter lab --no-browser
}

function notebooks-update {
  cd /home/neel/five/notebooks
  . venv/bin/activate
  python -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 python -m pip install --upgrade
}

function kgetall {
  kubectl api-resources --verbs=list --namespaced -o name | grep -v events | xargs -n 1 kubectl get --show-kind --ignore-not-found -n $1 --no-headers | cut -d ' ' -f 1
}
