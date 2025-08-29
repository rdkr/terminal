# terminal

## all

```
mkdir ~/rdkr ~/.kube ~/.aws
git clone https://github.com/rdkr/terminal.git ~/rdkr/terminal
echo 'export TERMINAL_DIR=~/rdkr/terminal' >> ~/.zshrc
echo 'source $TERMINAL_DIR/scripts/main.sh' >> ~/.zshrc
```

## mac

```
eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.zshrc
```

## arch

### wsl

```
wsl --install archlinux
```

```
pacman -Syu

useradd -m neel
passwd neel

echo "[user]" > /etc/wsl.conf
echo "default=neel" >> /etc/wsl.conf

pacman -S sudo
echo "neel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/neel
```

```
wsl --terminate archlinux
```

### arch

```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -Y --gendb; yay -Syu --devel; yay -Y --devel --save
yay -S zsh starship atuin lsd bat
chsh -s /usr/bin/zsh
yay -S wget kubectl sops
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

git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
