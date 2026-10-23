##############################################################################
# env vars
##############################################################################

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export GIT_CONFIG_GLOBAL=$TERMINAL_DIR/config/git/config
export ATUIN_CONFIG_DIR=$TERMINAL_DIR/config/atuin
export MISE_GLOBAL_CONFIG_FILE=$TERMINAL_DIR/mise.toml

source $TERMINAL_DIR/scripts/os.sh

export TENV_AUTO_INSTALL=true

##############################################################################
# path
##############################################################################

# local path
PATH="$HOME/.local/bin:$PATH"

# go
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

# krew path
PATH="$HOME/.krew/bin:$PATH"

# jetbrains path
# PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

# mise tools
eval "$(mise activate zsh)"

##############################################################################
# zsh: plugins, completion, history
##############################################################################

COMPLETION_WAITING_DOTS="true"

# which machines get each plugin group (conditional: in antidote_plugins.txt)
# one line per OS that gets the group; comment a line out to turn it off
function k8s-plugins {
  # [[ "$TERMINAL_OS" == "macos" ]] && return 0
  return 1
}

function direnv-plugins {
  # [[ "$TERMINAL_OS" == "macos" ]] && return 0
  return 1
}

source $TERMINAL_DIR/scripts/antidote.sh

zstyle ':completion:*' menu yes select

source $TERMINAL_DIR/scripts/history.sh

##############################################################################
# aliases
##############################################################################

source $TERMINAL_DIR/scripts/aliases.sh
source $TERMINAL_DIR/scripts/aws.sh

##############################################################################
# work
##############################################################################

if [[ -f "$TERMINAL_DIR/scripts/work.sh" ]]; then
  source $TERMINAL_DIR/scripts/work.sh
fi

##############################################################################
# prompt
##############################################################################

# # load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$TERMINAL_DIR/starship.toml"

eval "$(atuin init zsh)"
