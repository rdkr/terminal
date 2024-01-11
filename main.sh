##############################################################################
# env vars
##############################################################################

export XDG_CONFIG_HOME="$TERMINAL_DIR/config"
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# go path
GOPATH="$HOME/go"
PATH="${GOPATH//://bin:}/bin:$PATH"

# rust path
PATH="$HOME/.cargo/bin:$PATH"

#### load local imgs
PATH="$TERMINAL_DIR/imgs:$PATH"

# tfenv path
PATH="$HOME/.tfenv/bin:$PATH"

# krew path
PATH="$HOME/.krew/bin:$PATH"

##############################################################################
# zsh config
##############################################################################

DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS="true"
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
plugins=(z git kubectl helm gcloud iterm2 fzf gcloud aws sudo docker docker-compose)

#### completes
#source <(stern --completion=zsh)

#### load omz
source $TERMINAL_DIR/antibody_plugins.sh
source $ZSH/oh-my-zsh.sh

##############################################################################
# includes
##############################################################################

#### load terminal custom configs
source $TERMINAL_DIR/history.sh
source $TERMINAL_DIR/starship.sh
source $TERMINAL_DIR/os.sh
source $TERMINAL_DIR/aliases.sh
source $TERMINAL_DIR/aws.sh
source $TERMINAL_DIR/gcp.sh
source $TERMINAL_DIR/five.sh
