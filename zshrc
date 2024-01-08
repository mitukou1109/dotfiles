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

source ~/.rye/env

source /opt/ros/humble/setup.zsh

source /usr/share/colcon_cd/function/colcon_cd.sh

eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
# source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

overlay() {
  if [ $# -eq 0 ]; then
    source $(pwd | egrep -o ".*_ws")/install/local_setup.zsh
  else
    source ~/$1/install/local_setup.zsh
  fi
}

alias wr='cd $(pwd | egrep -o ".*_ws")'
alias cb='wr && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release'
alias cl='wr && rm -rf build install log'

source "$HOME/.cargo/env"
