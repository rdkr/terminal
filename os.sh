if [[ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == '"Ubuntu"' ]]; then

  export CONTAINER_TOOL=docker

  # alias cat='bat'
  # alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'

  export GIT_ASKPASS=`which ksshaskpass`

  function update {
    sudo apt update && sudo apt upgrade && sudo apt autoremove
    antibody bundle < $TERMINAL_DIR/antibody_plugins.txt > $TERMINAL_DIR/antibody_plugins.sh
  }

  export PATH="$HOME/.local/bin:$PATH"

else

  export CONTAINER_TOOL=podman

  alias cat='bat'
  alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'

  export GIT_ASKPASS=`which ksshaskpass`

  function update {
    yay
    antibody bundle < $TERMINAL_DIR/antibody_plugins.txt > $TERMINAL_DIR/antibody_plugins.sh
    yay -Qe | cut -f 1 -d ' ' > $TERMINAL_DIR/pacman.txt
    pacman -Qtdq | sudo pacman -Rns -
  }

fi
