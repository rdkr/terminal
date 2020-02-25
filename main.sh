export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.terminal/config"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl helm gcloud)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# autoload compinit && compinit

source ~/.terminal/history.sh
source ~/.terminal/aliases.sh
source ~/.terminal/gcp.sh
source ~/.terminal/nwm.sh
source ~/.terminal/spaceship.sh
source ~/.terminal/fzf.sh

export GOPATH=$HOME/go
export PATH="${GOPATH//://bin:}/bin:$PATH"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

if [ "${HOME}/.iterm2_shell_integration.zsh" ]; then source "${HOME}/.iterm2_shell_integration.zsh"; fi
# if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
# if [ /usr/local/bin/helm ]; then source <(helm completion zsh); fi

antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting
