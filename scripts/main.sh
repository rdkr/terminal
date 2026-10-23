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

# tfenv path
PATH="$HOME/.tfenv/bin:$PATH"

# krew path
PATH="$HOME/.krew/bin:$PATH"

# jetbrains path
# PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

# mise tools
eval "$(mise activate zsh)"


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
# zsh config
##############################################################################

DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS="true"

ZSH="$(antidote path ohmyzsh/ohmyzsh)"

plugins=(z git docker docker-compose)

if [[ "$TERMINAL_OS" == "macos" ]]; then
  plugins+=(direnv kubectl helm fluxcd)

elif [[ "$TERMINAL_OS" == "fedora" ]]; then
  # plugins+=(direnv kubectl helm fluxcd)

fi

#### load omz
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zstyle ':completion:*' menu yes select
source $ZSH/oh-my-zsh.sh

##############################################################################
# prompt etc
##############################################################################

# # load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$TERMINAL_DIR/starship.toml"

# PS1='\$ '

eval "$(atuin init zsh)"
