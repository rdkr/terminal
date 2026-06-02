sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y swap ffmpeg-free ffmpeg --allowerasing

# gcc for rust compiling
# openssl-devel for cargo-update

sudo dnf -y install zsh git lsd gcc openssl-devel

# sudo systemctl enable sshd
# sudo systemctl start sshd
# chsh -s /usr/bin/zsh
