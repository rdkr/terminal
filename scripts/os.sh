if [ "$(uname)" = "Darwin" ]; then
  export TERMINAL_OS="macos"
elif [ -f /etc/arch-release ]; then
  export TERMINAL_OS="arch"
elif [ -f /etc/fedora-release ]; then
  export TERMINAL_OS="fedora"
elif [ -f /etc/redhat-release ]; then
  export TERMINAL_OS="rhel"
elif grep -q '^ID=ubuntu' /etc/os-release 2>/dev/null; then
  export TERMINAL_OS="ubuntu"
elif [ -f /etc/debian_version ]; then
  export TERMINAL_OS="debian"
else
  echo "unknown os!"
fi
