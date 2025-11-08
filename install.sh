#!/bin/bash

set -e

create_desktop_entry() {
  touch /tmp/gparu.desktop
  printf "[Desktop Entry]\nVersion=1.0\nType=Application\nExec=$TERMINAL gparu\nIcon=org.xfce.filemanager\nTerminal=true\nName=GParu Package Manager\nComment=Install, update, and remove packages with a TUI\n" > /tmp/gparu.desktop
  sudo mv /tmp/gparu.desktop /usr/share/applications/gparu.desktop
}

install() {
  printf "Downloading GParu... (1/3)\n"
  curl -fsSL "https://raw.githubusercontent.com/KozmunkasKalman/gparu/main/gparu" -o /tmp/gparu

  if [ $? -ne 0 ]; then
    printf "Error: Downloading of file failed.\n"
    exit 1
  fi

  chmod +x /tmp/gparu

  printf "Installing GParu into the /usr/local/bin/ directory... (2/3)\n"
  sudo mv /tmp/gparu /usr/local/bin/gparu
  if [ $? -ne 0 ]; then
    printf "Error: Installation failed:\nUnable to move file from /tmp/ to /usr/local/bin/\nMost likely missing privileges or file system non-fhs compliant.\n"
  else
    printf "GParu script installed successfully, creating .desktop file in the /usr/share/applications/ directory... (3/3)\n"
    create_desktop_entry
    if [ $? -ne 0 ]; then
      printf"Error: Creation Of desktop file:\nUnable to move file from /tmp/ to /usr/local/bin/\nMost likely missing privileges or file system non-fhs compliant.\n"
    else
      printf "GParu installed successfully. Run \"$ gparu help\" for more info.\n"
    fi
  fi
}

read -p "$(printf 'Are you sure you would like to install GParu? [y/n] ')" action &&

case "$action" in
  Y|y|YES|Yes|yes) install;;
  "") printf "Please confirm installation to install.\n";;
  *) printf "Installation cancelled by user.\n";;
esac


