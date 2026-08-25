#!/bin/sh

script_dir="$(cd "$(dirname "$0")"; pwd)"
install_dir="${1:-$HOME}"

for path in "$script_dir"/*; do
  name=$(basename "$path")
  
  if [ "$name" = "install.sh" ] || [ "$name" = "setup_ros.sh" ]; then
    continue
  fi

  if [ "$name" = "starship.toml" ]; then
    mkdir -p "$install_dir/.config"
    ln -snfv "$path" "$install_dir/.config/starship.toml"
  else
    ln -snfv "$path" "$install_dir/.$name"
  fi
done

