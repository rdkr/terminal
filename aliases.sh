alias runner='ssh localhost -i ~/.ssh/google_compute_engine -p 2222 -o StrictHostKeyChecking=no'
alias reload='source ~/.zshrc'
alias zshrc='code $TERMINAL_DIR'
alias tf='terraform'

function today {
  echo "$(date +'%Y-%m-%d %H:%m') $@" >> $HOME/today.log
}

function yday {
  cat $HOME/today.log | grep $(tail $HOME/today.log -n 1 | cut -c 1-10) | cut -c 12-
}

function update {
  antibody bundle < $TERMINAL_DIR/plugins.txt
  antibody update
  brew cleanup
  brew upgrade
  brew cask upgrade
}

function pw () {
	LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?\[\]\(\)" < /dev/urandom | head -c "${1}" | pbcopy
}

function gen_gnupaths {
    for p in $(find -L /usr/local/opt -type d -name "*gnubin")
    do
        echo PATH="$p:\$PATH"
    done
}

function secrets-aws {
  eval $(op signin my)
  eval $(op get item 4toguey34zgtld3kxkneytiyi4 --fields notes)
}

function secrets-hermes {
  eval $(op signin my)
  eval $(op get item ehcdhcrzjbe35ejokjokclu56y --fields notes)
}
