# terminal

## all

```
mkdir -p ~/rdkr ~/.kube ~/.aws
(curl -fsSL https://mise.run || wget -qO- https://mise.run) | sh
~/.local/bin/mise bootstrap --yes --from https://github.com/rdkr/terminal.git --from-dir ~/rdkr/terminal
```

## mise migration

```
cargo uninstall atuin kubie starship cargo-update
```

and remove the old `TERMINAL_DIR` / `source main.sh` lines from `~/.zshrc`.

Test on each distro: `test/run.sh` (uses `$CONTAINER_TOOL`, default `podman`).

## mac

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
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

yay

```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -Y --gendb; yay -Syu --devel; yay -Y --devel --save
```

### fedora

install fusion

```
sudo dnf install   https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install   https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf swap ffmpeg-free ffmpeg --allowerasin

sudo systemctl enable sshd
sudo systemctl start sshd

```


## ubuntu

https://code.visualstudio.com/

```
echo 'neel ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install gnupg2
```

### kde

to fix start menu: https://www.reddit.com/r/Kubuntu/comments/r9dx60/comment/hncqrr2/

```
emulate sh -c 'source /etc/profile' into /etc/zsh/zprofile
```
