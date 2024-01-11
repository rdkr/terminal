if [[ "$(awk -F= '/^NAME/{print $2}' /etc/os-release)" == '"Ubuntu"' ]]; then

  export CONTAINER_TOOL=docker

  # alias cat='bat'
  # alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'

  function update {
    sudo apt update && sudo apt upgrade && sudo apt autoremove
    sudo snap refresh
    antidote update
    cd ~/.pyenv && git pull
    cd ~/.tfenv && git pull
    cargo install starship --locked
    cargo install kubie --locked
    cd
  }

else

  export CONTAINER_TOOL=podman

  alias cat='bat'
  alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'

  function update {
    yay
    antibody bundle < $TERMINAL_DIR/antibody_plugins.txt > $TERMINAL_DIR/antibody_plugins.sh
    yay -Qe | cut -f 1 -d ' ' > $TERMINAL_DIR/pacman.txt
    pacman -Qtdq | sudo pacman -Rns -
  }

fi
