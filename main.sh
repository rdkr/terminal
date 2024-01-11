export XDG_CONFIG_HOME="$TERMINAL_DIR/config"

# go path
GOPATH=$HOME/go
PATH="${GOPATH//://bin:}/bin:$PATH"

#### load plugins
source <(antibody init)
antibody bundle < $TERMINAL_DIR/plugins.txt

#### load local imgs
PATH="$TERMINAL_DIR/imgs:$PATH"

#### set zsh config
DISABLE_AUTO_UPDATE=true
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
COMPLETION_WAITING_DOTS="true"
plugins=(z git kubectl helm gcloud iterm2 fzf gcloud aws sudo docker docker-compose)

#### completes
source <(stern --completion=zsh)

#### load omz
source $ZSH/oh-my-zsh.sh

#### load terminal custom configs
source $TERMINAL_DIR/history.sh
source $TERMINAL_DIR/starship.sh
source $TERMINAL_DIR/os.sh
source $TERMINAL_DIR/aliases.sh
source $TERMINAL_DIR/aws.sh
source $TERMINAL_DIR/gcp.sh
source $TERMINAL_DIR/five.sh
