##############################################################################
# env vars
##############################################################################

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export GIT_CONFIG_GLOBAL=$TERMINAL_DIR/config/git/config
export ATUIN_CONFIG_DIR=$TERMINAL_DIR/config/atuin
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

##############################################################################
# path
##############################################################################

# local path
PATH="$HOME/.local/bin:$PATH"

# go
# GOPATH="$HOME/go"
# PATH="${GOPATH//://bin:}/bin:$PATH"
PATH="$PATH:$HOME/go/bin"
PATH=$PATH:/usr/local/go/bin

# rust
PATH="$HOME/.cargo/bin:$PATH"

# load local scripts
PATH="$TERMINAL_DIR/path:$PATH"

# load local work scripts
if [[ -d "$TERMINAL_DIR/path_work" ]]; then
  PATH="$TERMINAL_DIR/path_work:$PATH"
fi

# tfenv path
PATH="$HOME/.tfenv/bin:$PATH"

# krew path
PATH="$HOME/.krew/bin:$PATH"

# jetbrains path
PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"


##############################################################################
# includes
##############################################################################

#### load terminal configs
source $TERMINAL_DIR/scripts/antidote.sh
source $TERMINAL_DIR/scripts/history.sh
source $TERMINAL_DIR/scripts/aliases.sh
source $TERMINAL_DIR/scripts/aws.sh

#### load work configs
if [[ -f "$TERMINAL_DIR/scripts/work.sh" ]]; then
  source $TERMINAL_DIR/scripts/work.sh
fi

##############################################################################
# terminal tools
##############################################################################

# load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$TERMINAL_DIR/starship.toml"

##############################################################################
# zsh config
##############################################################################

DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS="true"
ZSH="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
plugins=(z git kubectl helm fluxcd docker docker-compose)

#### load omz
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zstyle ':completion:*' menu yes select
source $ZSH/oh-my-zsh.sh
