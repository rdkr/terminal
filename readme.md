# terminal

## arch

```
yay antibody zsh fzf lsd bat
echo "export TERMINAL_DIR=~/code/terminal" > ~/.zshrc
echo "source $TERMINAL_DIR/main.sh" >> ~/.zshrc
chsh -s $(which zsh)
```

## ubuntu

```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo add-apt-repository ppa:git-core/ppa                   
sudo apt update
sudo apt install build-essential golang-go zsh fzf git bat libsecret-1-0 libsecret-1-dev
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
cd -
mkdir ~/rdkr
git clone https://github.com/rdkr/terminal.git ~/rdkr/terminal
go install github.com/getantibody/antibody@latest
echo 'export TERMINAL_DIR=~/rdkr/terminal' > ~/.zshrc
echo 'source $TERMINAL_DIR/main.sh' >> ~/.zshrc
echo "emulate sh -c 'source /etc/profile'" | sudo tee /etc/zsh/zprofile
chsh -s $(which zsh)

```

install stern