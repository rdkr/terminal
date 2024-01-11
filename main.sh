##############################################################################
# env vars
##############################################################################

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export GIT_CONFIG_GLOBAL=$TERMINAL_DIR/config/git/config

##############################################################################
# path
##############################################################################

# local path
PATH="$HOME/.local/bin:$PATH"

# go
GOPATH="$HOME/go"
PATH="${GOPATH//://bin:}/bin:$PATH"

# rust
PATH="$HOME/.cargo/bin:$PATH"

# pyenv
PYENV_ROOT="$HOME/.pyenv"
PYENV_VIRTUALENV_DISABLE_PROMPT=1
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# load local imgs
PATH="$TERMINAL_DIR/imgs:$PATH"

# tfenv path
PATH="$HOME/.tfenv/bin:$PATH"

# krew path
PATH="$HOME/.krew/bin:$PATH"

# jetbrains path
PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"


##############################################################################
# includes
##############################################################################

#### load terminal custom configs
source $TERMINAL_DIR/antidote.sh
source $TERMINAL_DIR/starship.sh
source $TERMINAL_DIR/history.sh
source $TERMINAL_DIR/os.sh
source $TERMINAL_DIR/aliases.sh
source $TERMINAL_DIR/aws.sh
source $TERMINAL_DIR/gcp.sh
source $TERMINAL_DIR/five.sh

##############################################################################
# zsh config
##############################################################################

DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS="true"
ZSH="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
plugins=(z git fzf kubectl helm docker docker-compose pyenv)

#### load omz
source $ZSH/oh-my-zsh.sh
