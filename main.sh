# set -x

export XDG_CONFIG_HOME="$HOME/.terminal/config"

#### set zsh config
DISABLE_AUTO_UPDATE=true
ZSH="$(antibody path robbyrussell/oh-my-zsh)"
COMPLETION_WAITING_DOTS="true"
plugins=(git kubectl helm gcloud iterm2 fzf)

#### set paths
GOPATH=$HOME/go
PATH="${GOPATH//://bin:}/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/curl/bin:$PATH"

#### load plugins
source <(antibody init)
antibody bundle < ~/.terminal/plugins.txt

#### load terminal custom configs
source ~/.terminal/history.sh
source ~/.terminal/aliases.sh
source ~/.terminal/gcp.sh
source ~/.terminal/spaceship.sh