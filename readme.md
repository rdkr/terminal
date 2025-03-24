# terminal

## all

```
mkdir ~/rdkr
git clone https://github.com/rdkr/terminal.git ~/rdkr/terminal

mkdir -p ~/.kube ~/.aws

echo 'export TERMINAL_DIR=~/rdkr/terminal' >> ~/.zshrc
echo 'source $TERMINAL_DIR/scripts/main.sh' >> ~/.zshrc
```

## mac

```
eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.zshrc
```

## arch

```
yay antibody zsh fzf lsd bat
echo "export TERMINAL_DIR=~/rdkr/terminal" > ~/.zshrc
echo "source $TERMINAL_DIR/main.sh" >> ~/.zshrc
chsh -s $(which zsh)
```

## ubuntu

https://code.visualstudio.com/


```
echo 'neel ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install build-essential gnupg2 zsh fzf git curl zsh git git-lfs bat

chsh -s $(which zsh)

sudo apt install cmake
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"
cargo install starship --locked
cargo install kubie --locked

sudo apt install protobuf-compiler
cargo install atuin --locked
```


ln -s /home/$USER/rdkr/terminal/services/snapclient.service ~/.config/systemd/user/snapclient.service
systemctl --user enable snapclient
systemctl --user start snapclient

install stern

### kde

to fix start menu: https://www.reddit.com/r/Kubuntu/comments/r9dx60/comment/hncqrr2/

```
emulate sh -c 'source /etc/profile' into /etc/zsh/zprofile
```

ALLL


git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
