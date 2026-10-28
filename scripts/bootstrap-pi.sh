#!/bin/bash
# Apply this repo to a fresh Mainsail image on the printer Pi.
# Run from the repo root, on the Pi, as the Mainsail user:
#   ./scripts/bootstrap-pi.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="${HOME}/printer_data/config"

mkdir -p "$CONFIG"
cp "$ROOT"/config/* "$CONFIG"/
sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp "$ROOT"/pi/90-dsi-rotate.conf /etc/X11/xorg.conf.d/90-dsi-rotate.conf

if [ ! -d "${HOME}/KlipperScreen" ]; then
  git clone --depth 1 https://github.com/KlipperScreen/KlipperScreen.git "${HOME}/KlipperScreen"
fi

export BACKEND=X
export SERVICE=Y
export NETWORK=n
export DEBIAN_FRONTEND=noninteractive
"${HOME}/KlipperScreen/scripts/KlipperScreen-install.sh"

sudo systemctl restart KlipperScreen
sudo systemctl restart klipper
