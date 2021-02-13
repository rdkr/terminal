function update {
  yay
  antibody bundle < $TERMINAL_DIR/plugins.txt
  antibody update
  yay -Qe > $TERMINAL_DIR/pacman.txt
}
