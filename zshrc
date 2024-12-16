# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias au='sudo apt update'
alias ag='sudo apt upgrade -y'
alias aa='sudo apt autoremove -y'
alias ai='sudo apt install -y'

function rm_ {
  [[ -d "$1" ]] && rm -rI "$1" || rm -f "$1"
}
alias rm="rm_"

function include {
  [[ -f "$1" ]] && source "$1"
}

include ~/.cargo/env

eval "`uv generate-shell-completion zsh`"

include /opt/ros/humble/setup.zsh
include /usr/share/colcon_cd/function/colcon_cd.sh

eval "`register-python-argcomplete3 ros2 2> /dev/null`"
eval "`register-python-argcomplete3 colcon 2> /dev/null`"
# source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

function overlay {
  if [ $# -eq 0 ]; then
    source `wr`/install/local_setup.zsh
  else
    source ~/$1/install/local_setup.zsh
  fi
  eval "`register-python-argcomplete3 ros2 2> /dev/null`"
}

function wr {
  current_dir=`pwd`
  workspace_dir=`pwd`
  while [ "$current_dir" != "/" ]; do
    if [ -d "$current_dir/src" ]; then
      workspace_dir="$current_dir"
    fi
    current_dir=`dirname "$current_dir"`
  done
  echo "$workspace_dir"
}

alias cwr='cd `wr`'
alias cb='cwr && colcon build --symlink-install --mixin release ccache'
alias cl='cwr && rm -rf build install log'
