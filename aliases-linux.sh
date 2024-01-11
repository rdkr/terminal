function update {
  yay
  antibody bundle < $TERMINAL_DIR/plugins.txt
  antibody update
  yay -Qe | cut -f 1 -d ' ' > $TERMINAL_DIR/pacman.txt
  pacman -Qtdq | sudo pacman -Rns -
}
