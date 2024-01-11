# terminal

## ubuntu

```
apt install go zsh fzf
go get github.com/getantibody/antibody
go install github.com/getantibody/antibody
echo "export TERMINAL_DIR=~/code/terminal" > ~/.zshrc
echo "source $TERMINAL_DIR/main.sh" >> ~/.zshrc
echo "emulate sh -c 'source /etc/profile'" | sudo tee /etc/zsh/zprofile
chsh -s $(which zsh)
```
