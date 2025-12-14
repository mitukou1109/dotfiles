#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export EDITOR=vim
export VISUAL=vim

export PATH=$PATH:$HOME/.local/bin

export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

if (( $+commands[ccache] )); then
  export CC=/usr/lib/ccache/gcc
  export CXX=/usr/lib/ccache/g++
  export CCACHE_DIR=$HOME/.cache/ccache/
fi

export _colcon_cd_root=/opt/ros/humble

export RCUTILS_COLORIZED_OUTPUT=1

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file://$HOME/cyclonedds.xml

export ROS_DOMAIN_ID=25

