#!/bin/bash

set -e

install() {
  printf "Downloading gparu... (1/2)\n"
  curl -fsSL "https://raw.githubusercontent.com/KozmunkasKalman/gparu/main/gparu" -o /tmp/gparu

  if [ $? -ne 0 ]; then
    echo "Error: Downloading of file failed."
    exit 1
  fi

  chmod +x /tmp/gparu

  printf "Installing gparu into the /usr/local/bin/ directory... (2/2)\n"
  sudo mv /tmp/gparu /usr/local/bin/gparu
  if [ $? -ne 0 ]; then
    echo "Error: Installation failed:\nUnable to move file from /tmp/ to /usr/local/bin/\nMost likely missing privileges or file system non-fhs compliant."
  else
    echo "GParu installed successfully. Run \"gparu help\" for more info."
  fi
}

read -p "$(printf 'Are you sure you would like to install GParu? ')" action &&

case "$action" in
  Y|y|YES|Yes|yes) install;;
  *) printf "Installation cancelled by user.\n"
esac


