#!/bin/sh

sudo apt install zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for rcfile in "$ZDOTDIR"/.zprezto/runcoms/*; do
  [ "$(basename "$rcfile")" = "README.md" ] && continue
  [ -f "$rcfile" ] || continue
  ln -s "$rcfile" "$ZDOTDIR/.$(basename "$rcfile")"
done

chsh -s /bin/zsh

