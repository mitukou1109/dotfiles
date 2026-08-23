#!/bin/sh

for path in "$(cd "$(dirname "$0")"; pwd)/"*; do
  name=$(basename "$path")
  if [ "$name" != "install.sh" ] && [ ! -d "$path" ]; then
    ln -snfv "$path" "$HOME/.$name"
  fi
done
