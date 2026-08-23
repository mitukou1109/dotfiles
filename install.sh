#!/bin/sh

for path in "$(cd "$(dirname "$0")"; pwd)/"*; do
  name=$(basename "$path")
  
  if [ "$name" = "install.sh" ] || [ "$name" = "setup_ros.sh" ]; then
    continue
  fi

  if [ "$name" = "starship.toml" ]; then
    mkdir -p "$HOME/.config"
    ln -snfv "$path" "$HOME/.config/starship.toml"
  else
    ln -snfv "$path" "$HOME/.$name"
  fi
done

