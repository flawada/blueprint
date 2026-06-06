set -e
local_path=~/.cache/flawado

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

sudo dnf in -y git
mkdir -p $local_path
cd $local_path

if [ -z "$(ls -A)" ]; then
  git clone https://github.com/flawada/mango
fi

set -e
local_path=~/.cache/flawado

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

sudo dnf in -y git || true
mkdir -p $local_path
cd $local_path

if [ -z "$(ls -A)" ]; then
  git clone https://github.com/flawada/mango
fi

cd ${local_path}/mango

chmod +x install.sh
./install.sh
