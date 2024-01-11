function update {
  brew cleanup
  brew upgrade
  brew cask upgrade
  
  antibody bundle < $TERMINAL_DIR/plugins.txt
  antibody update
}

function gen_gnupaths {
    for p in $(find -L /usr/local/opt -type d -name "*gnubin")
    do
        echo PATH="$p:\$PATH"
    done
}