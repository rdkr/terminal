export XDG_CONFIG_HOME="$TERMINAL_DIR/config"

# go path
GOPATH=$HOME/go
PATH="${GOPATH//://bin:}/bin:$PATH"

#### set zsh config
DISABLE_AUTO_UPDATE=true
ZSH="$(antibody path robbyrussell/oh-my-zsh)"
COMPLETION_WAITING_DOTS="true"
plugins=(z git kubectl helm gcloud iterm2 fzf gcloud)

#### load plugins
source <(antibody init)
antibody bundle < $TERMINAL_DIR/plugins.txt

#### set paths / os specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then

    # homebrew sbin
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

    # python path
    PATH="/Users/neel/Library/Python/3.7/bin:$PATH" # "/Users/neel/Library/Python/3.8/bin:$PATH"

    # gnupaths generated with get_gnupaths from aliases.sh
    PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    PATH=/usr/local/opt/gnu-tar/libexec/gnubin:$PATH
    PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
    PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
    PATH=/usr/local/opt/make/libexec/gnubin:$PATH
    PATH=/usr/local/opt/findutils/libexec/gnubin:$PATH

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

    PATH="$PATH:/snap/bin"
    
    export GIT_ASKPASS=`which ksshaskpass`

fi 

#### load terminal custom configs
source $TERMINAL_DIR/history.sh
source $TERMINAL_DIR/aliases.sh
source $TERMINAL_DIR/aws.sh
source $TERMINAL_DIR/gcp.sh
source $TERMINAL_DIR/spaceship.sh
