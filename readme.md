# terminal

## arch

```
yay antibody zsh fzf lsd bat
echo "export TERMINAL_DIR=~/code/terminal" > ~/.zshrc
echo "source $TERMINAL_DIR/main.sh" >> ~/.zshrc
chsh -s $(which zsh)
```

## ubuntu

https://code.visualstudio.com/

```
echo 'neel ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install build-essential gnupg2 zsh fzf git curl

echo 'export TERMINAL_DIR=~/rdkr/terminal' > ~/.zshrc
echo 'source $TERMINAL_DIR/main.sh' >> ~/.zshrc

chsh -s $(which zsh)

mkdir ~/rdkr
git clone https://github.com/rdkr/terminal.git ~/rdkr/terminal

sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install cmake
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"
cargo install starship --locked
cargo install kubie --locked
```

### maybe not needed?

```
libsecret-1-0 libsecret-1-dev silversearcher-ag
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
cd -

```

install stern

### kde

to fix start menu: https://www.reddit.com/r/Kubuntu/comments/r9dx60/comment/hncqrr2/

```
emulate sh -c 'source /etc/profile' into /etc/zsh/zprofile
```
