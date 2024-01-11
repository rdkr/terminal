# set -x

export XDG_CONFIG_HOME="$HOME/.terminal/config"

#### set zsh config
DISABLE_AUTO_UPDATE=true
ZSH="$(antibody path robbyrussell/oh-my-zsh)"
COMPLETION_WAITING_DOTS="true"
plugins=(z git kubectl helm gcloud iterm2 fzf gcloud)

#### set paths
# homebrew sbin
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# go path
GOPATH=$HOME/go
PATH="${GOPATH//://bin:}/bin:$PATH"

# python path
PATH="/Users/neel/Library/Python/3.7/bin:$PATH"
# PATH="/Users/neel/Library/Python/3.8/bin:$PATH"

# gnupaths generated with get_gnupaths from aliases.sh
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=/usr/local/opt/gnu-tar/libexec/gnubin:$PATH
PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
PATH=/usr/local/opt/make/libexec/gnubin:$PATH
PATH=/usr/local/opt/findutils/libexec/gnubin:$PATH

#### load plugins
source <(antibody init)
antibody bundle < ~/.terminal/plugins.txt

#### load terminal custom configs
source ~/.terminal/history.sh
source ~/.terminal/aliases.sh
source ~/.terminal/aws.sh
source ~/.terminal/gcp.sh
source ~/.terminal/spaceship.sh
