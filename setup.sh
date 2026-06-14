#!/bin/sh

set -e

if ! grep -q '^ID=fedora' /etc/os-release; then
  echo "! Warning ! : This script is made for fedora everthing"
  read -p "Continure? [y/n]: " p
  case "$p" in
  [yY])
    echo "continure text"
    ;;
  *)
    echo "Exit text"
    exit
    ;;
  esac
fi

cd /tmp

sudo dnf in -y git


if ! [ -d "/tmp/blueprint" ]; then
  git clone https://github.com/flawada/blueprint
fi

bash /tmp/blueprint/setup/main.sh
