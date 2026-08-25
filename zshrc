# ========================
# History
# ========================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# ========================
# Shell options
# ========================
setopt autocd
setopt extended_glob
setopt interactive_comments

# ========================
# Key bindings
# ========================
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# ========================
# Functions
# ========================
include() {
  [[ -f "$1" ]] && source "$1"
}

overlay() {
  if [ $# -eq 0 ]; then
    source "$(wr)/install/local_setup.zsh"
  else
    source "$HOME/$1/install/local_setup.zsh"
  fi
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
}

wr() {
  local current_dir=$(pwd)
  local workspace_dir=$(pwd)
  while [ "$current_dir" != "/" ]; do
    if [ -d "$current_dir/src" ]; then
      workspace_dir="$current_dir"
    fi
    current_dir=$(dirname "$current_dir")
  done
  echo "$workspace_dir"
}

# ========================
# Aliases
# ========================
alias au='sudo apt update'
alias ag='sudo apt upgrade -y'
alias aa='sudo apt autoremove -y'
alias ai='sudo apt install -y'

alias cwr='cd $(wr)'
alias cb='cwr && colcon build --symlink-install --mixin ccache release'
alias cbd='cwr && colcon build --symlink-install --mixin ccache debug'
alias cl='cwr && rm -rf build install log'

# ========================
# Setup
# ========================
include ~/.cargo/env

include /opt/ros/humble/setup.zsh
include /usr/share/colcon_cd/function/colcon_cd.sh

# ========================
# Completion
# ========================
autoload -Uz compinit
compinit -C

if (( $+commands[uv] )); then
  eval "$(uv generate-shell-completion zsh)"
fi

if (( $+commands[register-python-argcomplete3] )); then
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
fi

if (( $+commands[zellij] )); then
  eval "$(zellij setup --generate-completion zsh)"
fi

# ========================
# Autosuggestions
# ========================
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ========================
# Starship
# ========================
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# ========================
# Syntax highlighting
# ========================
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
